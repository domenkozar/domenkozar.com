<%inherit file="base.mako" />
<!DOCTYPE html>
<html>
  <head>
    <title>${bf.config.blog.name}</title>
    <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/index.xml')}" />
    <link rel="alternate" type="application/atom+xml" title="Atom 1.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/atom/index.xml')}" />
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="stylesheet" type="text/css" href="/css/screen.css" />
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
  </head>
  <body class="home-template">
    <!-- github fork me button -->
    <a href="https://github.com/domenkozar/domenkozar.com"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub"></a>

    <aside class="SiteInfobar">
      <a href="/" class="SiteInfobar-logo" alt="Blog logo" ><span class="fa-stack fa-5x">
          <img class="fa-stack-1x" src="/images/me.png" />
        </span></a>
      <h2 class="Title">Domen Kožar's thoughts</h2>
      <h6 class="Description"><a href="https://haskell-lang.org/">Haskell</a> / <a href="https://nixos.org">Nix</a> / <a href="http://elm-lang.org">Elm</a> developer</h6>

      <section>
        <a href="https://twitter.com/iElectric"><span class="fa-stack fa-lg">
          <i class="fa fa-circle fa-stack-2x"></i>
          <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
        </span></a>
        &nbsp;
        <a href="https://github.com/domenkozar"><span class="fa-stack fa-lg">
          <i class="fa fa-circle fa-stack-2x"></i>
          <i class="fa fa-github fa-stack-1x fa-inverse"></i>
        </span></a>
        &nbsp;
        <a href="mailto:domen@dev.si"><span class="fa-stack fa-lg">
          <i class="fa fa-circle fa-stack-2x"></i>
          <i class="fa fa-envelope fa-stack-1x fa-inverse"></i>
        </span></a>
        &nbsp;
        <a href="https://www.gittip.com/iElectric/"><span class="fa-stack fa-lg">
          <i class="fa fa-circle fa-stack-2x"></i>
          <i class="fa fa-gittip fa-stack-1x fa-inverse"></i>
        </span></a>
      </section>
      <section>
      </section>
    </aside>
  
    <main class="SiteContent" role="main">
      ${ next.body() }
    </main>

    <footer class="SiteFooter">

      <section>
        <span>This <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" rel="dct:type">work</span>
        is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">CCA 3.0 Unported License</a>.</span>
      </seciton>

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
    </footer>
  </body>
</html>

  <!-- TODO ul id="menu" class="horizontal-list">
    <li><a href="/archives.html">Archives</a></li>
    <li><a href="/about.html">About</a></li>
  </ul-->
