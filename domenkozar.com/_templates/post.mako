<%page args="post"/>
<%
   category_links = []
   for category in post.categories:
       if post.draft:
           #For drafts, we don't write to the category dirs, so just write the categories as text
           category_links.append(category.name)
       else:
           category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
%>

<div class="blog_post">
  <a name="${post.slug}"></a>
  <div class="blog_post_title">
      <a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a>
  </div>
  <em class="datetime">${post.date.strftime('%d. %b. %Y at %H:%M')} </em>
  <span class="tags">written under ${", ".join(category_links)}</span>
  <div class="post_prose text">
    ${self.post_prose(post)}
  </div>

    <!-- AddThis Button BEGIN -->
    <div class="addthis_toolbox addthis_default_style ">
    <a class="addthis_button_reddit"></a>
    <a class="addthis_button_hackernews"></a>
    <a class="addthis_button_twitter"></a>
    <a class="addthis_button_delicious"></a>
    <a class="addthis_button_googlereader"></a>
    <a class="addthis_button_print"></a>
    <a class="addthis_button_facebook_like"></a>
    <a class="addthis_counter addthis_bubble_style"></a>
    </div>
    <script type="text/javascript">
        var addthis_config = {
            data_track_clickback: true,
        };
    </script>
    <script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4dee9af61adda7e6"></script>
    <!-- AddThis Button END -->

</div>

<%def name="post_prose(post)">
  ${post.content}
</%def>
