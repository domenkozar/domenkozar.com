<%inherit file="base.mako" />
<!DOCTYPE html>
<html>
	<head>
		<title>Domen Kožar's blog</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href='http://fonts.googleapis.com/css?family=Cabin' rel='stylesheet' type='text/css'>
		<link href='reset.css' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Ubuntu:regular,italic,bold' rel='stylesheet' type='text/css'>
		<script type="text/javascript" charset="utf-8">
		</script>
		<style type="text/css">
		body {
	      font: 13px/1.5 "Ubuntu", "Georgia", "Helvetica Neue", "Helvetica", "Times New Roman", sans-serif;
		}
		em, i {
        font-style: italic;
		}
		b, strong {
        font-weight: bold;
		}
		a {
        color: #000;
				text-decoration: underline;
		}
		h1 {
        font: 3em 'Cabin', "Georgia";
				border-bottom: 1px solid #000;
				padding-bottom: 1px;
		}
		h1 a {
        color: #000;
				text-decoration: none;
		}
		#logo {
		    float: left;
		}
		#logo strong {
        font: 30px Georgia;
				display: block;
		}
		#header {
        overflow: hidden;
				margin-bottom: 40px;
		}
		#menu {
        margin-top: 15px;
        float: right;
		}
		#menu li {
        list-style: none;
				display: inline;
				padding: 0 4px;
		}
		#container {
        width: 800px;
				margin: 0 auto;
		}
		#content .text {
			  margin: 10px 0 30px 0;
		}
		#content .tags {
        float: right;     
		}

		#social {
        float: right;
		}
		</style>
	</head>
	<body>
		<div id="container">
      <div id="header">
			  <div id="logo">
					<strong>Domen Kožar</strong>
					<em>Open Source enthusiast and Python/Plone/Django/Pyramid/Web developer</em>
				</div>
				<ul id="menu">
					<li><a href="">Blog</a></li>
					<li><a href="">Projects</a></li>
					<li><a href="">About</a></li>
				</ul>
			</div>

			<div id="content">
                ${ next.body() }
				<h1><a href="">Plone under development</a></h1>
				<em class="datetime">1. May 2011 at 20:03</em>
				<span class="tags">written under <a href="">English</a>, Plone</span>
				<div class="text">
	Lorem ipsum dolor sit amet, consectetur <strong>adipisicing elit</strong>, sed do <a href="">eiusmod</a> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>

				<h1><a href="">And more content</a></h1>
				<em>1. May 2011 at 20:03</em>
				<div class="text">
	Lorem ipsum dolor sit amet, consectetur <strong>adipisicing elit</strong>, sed do <a href="">eiusmod</a> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>
			</div>

      <div id="footer">
				<ul id="social">
					<li><a href="mailto:domen@dev.si">domen@dev.si</a></li>
					<li><a href="https://twitter.com/#!/iElectric">twitter</a></li>
					<li><a href="https://github.com/iElectric">github</a></li>
				</ul>
			</div>
		</div>
	</body>
</html>
