---
layout: page
permalink: /tags/
title: Tags
---

<style>
  .archive-group {
    margin-bottom: 1em;
  }
  .category-head {
    cursor: pointer;
    margin: 0;
    padding: 0.5em;
    background-color: #f4f4f4;
    border: 1px solid #ddd;
  }
  .archive-items {
    display: none;
    padding: 0 1em;
  }
  .archive-item {
    margin: 0.5em 0;
  }
</style>

<div id="archives">
  {% for tag in site.tags %}
    <div class="archive-group">
      {% capture tag_name %}{{ tag | first }}{% endcapture %}
      <div id="#{{ tag_name | slugize }}"></div>
      <p></p>

      <h3 class="category-head">{{ tag_name }}</h3>
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
