<%inherit file="site.mako" />
<%include file="post.mako" args="post=post" />
% if bf.config.blog.disqus.enabled:
<div id="disqus_thread"></div>
<script type="text/javascript">
  var disqus_url = "${post.permalink}";
  var disqus_developer = 1;
  var disqus_title = "${post.title}";
  var disqus_identifier = "${post.permapath()}";
  var disqus_shortname = "${bf.config.blog.disqus.name}";
</script>
<script async="true" type="text/javascript" src="http://${bf.config.blog.disqus.name}.disqus.com/embed.js"></script>
<noscript><a href="http://${bf.config.blog.disqus.name}.disqus.com/?url=ref">View the discussion thread.</a></noscript>
% endif
