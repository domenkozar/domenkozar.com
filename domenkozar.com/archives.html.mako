<%inherit file="site.mako" />
<article class="post">
% for i, post in enumerate(bf.config.blog.posts):
    % if i == 0 or bf.config.blog.posts[i-1].date.year != post.date.year:
        <h1>${ post.date.year }</h1>
    % endif
    % if i == 0 or bf.config.blog.posts[i-1].date.month != post.date.month:
        <h3>${ post.date.strftime('%B') }</h3>  
    % endif
    <a class="archives" href="${ post.permalink }">${ post.title }</a><br />
% endfor
<article>
