---
categories: english, python, validation, formencode, form, schema
author: Domen Kožar
date: 2009/07/22 12:11:00
title: "Advanced FormEncode usage"
draft: false
---
I've been working on advanced HTML form that uses some `Mootools <http://mootools.net/>`_
(JavaScript framework) love. In most of my projects I use `FormEncode <http://formencode.org/>`_ in
combination with `FormAlchemy <http://formalchemy.googlecode.com/>`_. Although both libraries have
very different philosophies and areas, they work great together with some patches. I want to share
schema because I spent quite some time putting it together - might save you some trobule. 

This was the first time I used variabledecode module, and found best reference `in this blog post
<http://jimmyg.org/blog/2007/multiple-checkboxes-with-formencode.html>`_. 

Rendered form looks `something like this <http://bayimg.com/image/eacmeaaco.jpg>`_, and if you
choose another option in dropdown menu, it rearanges to `something like this!
<http://bayimg.com/image/dacmnaaco.jpg>`_ 

As you can see, AJAX removes some fields, others are rearranged. First form accepts many
Name/Surname entries, the second one only gets one  pair. I wanted to write a FA schema that can
validate both cases and prepares my resulting dictionary to be directly inserted to SQLAlchemy
model.


.. sourcecode:: python

    class ApplyForm(formencode.Schema):
        allow_extra_fields = True
        filter_extra_fields = True

        billIsNaturalPerson = validators.StringBool(not_empty=True)

        billEmail = validators.Email(not_empty=True)
        billAddress = validators.UnicodeString(not_empty=True)
        billPost = validators.UnicodeString(not_empty=True)
        billPhone = InternationalPhoneNumber(default_cc=386, not_empty=True)

        billFirm = validators.UnicodeString(if_missing=None)
        billTaxNumber = SlovenianTaxNumber(if_missing=None)
        billIDNumber = validators.Int(if_missing=None)
        billContactPerson = validators.UnicodeString(if_missing=None)

        billIsDDV = validators.Bool(not_empty=True, if_missing=None)
        billIsProformaInvoice = validators.Bool(not_empty=True)
        billIsSIR = validators.Bool(not_empty=True)
        billIsDinner = validators.Bool(not_empty=True)

        relParticipants = formencode.ForEach(ParticipantForm)
        relDaysAttending = validators.DictConverter({
            '1': [model.meta.Session()\
                .query(model.PortorozDay)\
                .filter(model.PortorozDay.plPDayDate == date(2009, 11, 18)).one()], # wed
            '2': [model.meta.Session()\
                .query(model.PortorozDay)\
                .filter(model.PortorozDay.plPDayDate == date(2009, 11, 19)).one()], # thu
            '3': model.meta.Session()\
                .query(model.PortorozDay).all() , # both
        }, not_empty=True, hideDict=True)

        pre_validators = [NestedVariables()]
        chained_validators = [
            validators.RequireIfPresent('billFirm', missing='billIsNaturalPerson'),
            validators.RequireIfPresent('billTaxNumber', missing='billIsNaturalPerson'),
            validators.RequireIfPresent('billIDNumber', missing='billIsNaturalPerson'),
            validators.RequireIfPresent('billContactPerson', missing='billIsNaturalPerson'),
        ]

    class ParticipantForm(formencode.Schema):
        allow_extra_fields = True
        filter_extra_fields = False

        parName = validators.UnicodeString(if_missing=None)
        parSurname = validators.UnicodeString(if_missing=None)

        chained_validators = [
            validators.RequireIfPresent('parName', present='parSurname'),
            validators.RequireIfPresent('parSurname', present='parName'),
            MapToModel(model.PortorozParticipant),
        ]


First of all, it's all about the state of billIsNaturalPerson. This is the key boolean that
separates both forms. As you can see in chained_validators, if it's value is False, it will require
some additional fields. Fields with if_missing=None are required only in first form. Javascript
removes input elements from DOM, so SQLAlchemy model is populated with None values. 

relDaysAttending is a SQLAlchemy relation and in form terminology, a radioset. Values are mapped
with help of DictConverter validator to model instances, which results in correctly populated
ForeignKeys. 

relParticipants is also a SQLAlchemy relation that lists name/surname pairs. As you can see, it's
validated with help of variabledecode algorithm and validator that corresponds to that is
NestedVariables. Because NestedVariables validators lies in pre_validators attribute, when validator
occurs, values are already mapped to list/dictionary. Input names look something like this:

.. sourcecode:: html

    <div>
        <input type="text" name="relParticipants-1.parName" value="John" />
        <input type="text" name="relParticipants-1.parSurname" value="Smih" />
    </div>
    <div>
        <input type="text" name="relParticipants-2.parName" value="..." />
    </div>

Which maps to list of dicts:

.. sourcecode:: python

    {'relParticipants': [
       {'parName': 'John', 'parSurname': 'Smith'},
       ...
    ]}

ForEach validator later maps relParticipant list to ParticipantForm schema. This schema is pretty
basic, chained validators are used to require second field (if one is supplied) and map resulting
dict to model instance. MapToModel implementation is very simple:

.. sourcecode:: python

    class MapToModel(validators.FormValidator):
        __unpackargs__ = ('model',)
        model = None

        def _to_python(self, value_dict, state):
            return self.model(**value_dict)

Example of parsed POST data, mapped to be ready for SQLAlchemy model:

.. sourcecode:: text

    18:24:07,349 DEBUG [project.controllers.portoroz] Form input:
    {'billAddress': u'Foo street 12',
     'billContactPerson': u'John Smith',
     'billEmail': u'john.smith@gmail.com',  
     'billFirm': u'Firm',
     'billIDNumber': 1337,
     'billIsDDV': None,
     'billIsDinner': False,
     'billIsNaturalPerson': False,
     'billIsProformaInvoice': True,
     'billIsSIR': False,
     'billPhone': '+386-11-444489',
     'billPost': u'1000 Ljubljana',
     'billTaxNumber': 40952649,
     'relDaysAttending': [, ],
     'relParticipants': [,
                         ,
                         ]
    }


Problems started when I tried htmlfill and it's error rendering. First issue was that I needed
to reverse variabledecode algorithm, this can be achieved with following e.unpack_errors call:

.. sourcecode:: python

    try:
                c.form_result = ApplyForm().to_python(request.POST)
            except formencode.validators.Invalid, e:
                return formencode.htmlfill.render(
                    self.apply_action(),
                    defaults=request.POST,
                    errors=e.unpack_errors(formencode.variabledecode.variable_encode))

Second issue was if user added lots of Participants, they were not correctly populated in form
inputs because by default only one was being rendered and additional ones are inserted by
javascript. I decided to take most ugly but simple approach: by default render 30 fields and
onDOMReady, remove the all the empty fields except one. 

There are details I left out of this post, since main concern was FormEncode usage. I hope you learned something, cheers!
