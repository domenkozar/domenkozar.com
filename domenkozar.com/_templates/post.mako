<%page args="post,excerpt"/>
<%
   category_links = []
   for category in post.categories:
       if post.draft:
           # For drafts, we don't write to the category dirs, so just write the categories as text
           category_links.append(category.name)
       else:
           category_links.append("<a href='%s'>%s</a>" % (category.path, category.name.capitalize()))
%>

<article class="post">

    <header class="Post-header">
      <h1 class="title"><a name="${post.slug}" href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h1>
      <span class="meta"><time datetime="{{date format="DD. MM. YYYY at HH.MM."}}">${post.date.strftime('%d. %b. %Y at %H:%M')}</time> under ${", ".join(category_links)}</span>
    </header>

    % if excerpt:
    <section class="Post-excerpt">
      <p>${post.excerpt}</p>
    </section>

    % else:

    <section class="Post-content">
      ${post.content}

      % if bf.config.blog.disqus.enabled:
      <div id="disqus_thread"></div>
      <script type="text/javascript">
        var disqus_url = "${post.permalink}";
        var disqus_developer = 1;
        var disqus_title = "${post.title}";
        var disqus_identifier = "${post.permapath()}";
        var disqus_shortname = "${bf.config.blog.disqus.name}";
      </script>
      <script async="true" type="text/javascript" src="https://${bf.config.blog.disqus.name}.disqus.com/embed.js"></script>
      <noscript><a href="https://${bf.config.blog.disqus.name}.disqus.com/?url=ref">View the discussion thread.</a></noscript>
      % endif
    </section>
    % endif

    % if not excerpt:
    <footer class="Post-footer">

      <section class="Share">
        <a href="http://twitter.com/share?text=${post.title}&url=${post.permapath()}"
              onclick="window.open(this.href, 'twitter-share', 'width=550,height=235');return false;">Twitter</a>
        <a href="https://www.facebook.com/sharer/sharer.php?u=${post.permapath()}"
              onclick="window.open(this.href, 'facebook-share','width=580,height=296');return false;">Facebook</a>
        <a href="https://plus.google.com/share?url=${post.permapath()}"
             onclick="window.open(this.href, 'google-plus-share', 'width=490,height=530');return false;">Google+</a>
      </section>

    </footer>
    % endif

</article>
