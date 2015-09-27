<%inherit file="site.mako" />
% for post in posts:
  <%include file="post.mako" args="post=post,excerpt=True" />
% endfor
<nav class="Pagination" role="pagination">
 % if prev_link:
  <a class="Pagination-newer" href="${prev_link}">« Newer posts</a>
 % endif

 <span class="Pagination-number" onclick="location.href='/archives.html'" style="cursor: pointer">Archives</span>

 % if next_link:
  <a class="Pagination-older" href="${next_link}">Older posts »</a>
 % endif
</nav>
