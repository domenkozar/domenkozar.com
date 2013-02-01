<%inherit file="base.mako" />
<!DOCTYPE html>
<html>
  <head>
    ${ self.head() }
  </head>
  <body>
    <a href="https://github.com/iElectric/domenkozar.com"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub"></a>
    <div id="container">
      <div id="header">
        ${ self.header() }
      </div>
      <div id="content">
        ${ next.body() }
      </div>
      <div id="footer">
        ${ self.footer() }
      </div>
    </div>
  </body>
</html>

<%def name="head()">
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Ubuntu:regular,italic,bold' rel='stylesheet' type='text/css'>
  <link href='/css/reset.css' rel='stylesheet' type='text/css'>
  <link href='/css/rst.css' rel='stylesheet' type='text/css'>
  <link href='/css/style.css' rel='stylesheet' type='text/css'>
  <%include file="head.mako" />
</%def>
<%def name="header()">
  <div id="logo">
    <strong>
      <a href="/">Domen Kožar</a>
      <iframe style="border: 0; margin: 0; padding: 0;"
              src="https://www.gittip.com/iElectric/widget.html"
              width="48pt" height="22pt"></iframe>
    </strong>
    <em>Open Source enthusiast and Python/Plone/Django/Pyramid/Web developer</em>
  </div>
  <ul id="menu" class="horizontal-list">
    <li><a href="/archives.html">Archives</a></li>
    <!--<li><a href="/projects.html">Projects</a></li>-->
    <li><a href="/about.html">About</a></li>
  </ul>
  <%include file="header.mako" />
</%def>
<%def name="footer()">
  <span id="copyright">© 2009-2011 by Domen Kožar. </span>
  <span>&nbsp;This <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" rel="dct:type">work</span>
  is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">CCA 3.0 Unported License</a>.</span>
  <ul id="social" class="horizontal-list">
    <li><a href="mailto:domen@dev.si">email</a></li>
    <li><a href="https://twitter.com/#!/iElectric">twitter</a></li>
    <li><a href="https://github.com/iElectric">github</a></li>
  </ul>
  <%include file="footer.mako" />
    <script type="text/javascript">

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-2515480-11']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();

    </script>
</%def>
