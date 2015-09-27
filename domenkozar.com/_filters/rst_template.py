import docutils.core

config = {
    'name': "reStructuredText",
    'description': "Renders reStructuredText formatted text to HTML",
    'aliases': ['rst']
    }


def run(content):
    return docutils.core.publish_parts(content,
                                       writer_name='html',
                                       settings_overrides={'initial_header_level': 3})['html_body']
