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
</div>

<%def name="post_prose(post)">
  ${post.content}
</%def>
