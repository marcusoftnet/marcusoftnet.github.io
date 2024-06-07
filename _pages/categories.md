---
layout: page
permalink: /tags/
title: Tags
---

<div id="archives">
  {% assign sorted_tags = site.tags | sort: 'last.size' | reverse %}
  {% for tag in sorted_tags %}
    <div class="archive-group">
      {% capture tag_name %}{{ tag | first }}{% endcapture %}
      <div id="#{{ tag_name | slugize }}"></div>
      <p></p>

      <h3 class="category-head">{{ tag_name }} ({{ site.tags[tag_name].size }})</h3>
      <a name="{{ tag_name | slugize }}"></a>
      <div class="archive-items">
        {% for post in site.tags[tag_name] %}
          <article class="archive-item">
            <h4><a href="{{ site.baseurl }}{{ post.url }}">{% if post.title and post.title != "" %}{{post.title}}{% else %}{{post.excerpt | strip_html}}{% endif %}</a></h4>
          </article>
        {% endfor %}
      </div>
    </div>

{% endfor %}

</div>
