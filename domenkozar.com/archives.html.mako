<%inherit file="site.mako" />
% for i, post in enumerate(bf.config.blog.posts):
    % if i == 0 or bf.config.blog.posts[i-1].date.year != post.date.year:
        <strong class="year archives">${ post.date.year }</strong><br />  
    % endif
    % if i == 0 or bf.config.blog.posts[i-1].date.month != post.date.month:
        <strong class="month archives">${ post.date.strftime('%B') }</strong><br />  
    % endif
    <a class="archives" href="${ post.permalink }">${ post.title }</a><br />
% endfor
<br /><br /><br />
