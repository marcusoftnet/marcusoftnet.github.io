---
layout: page
permalink: /tags/
title: Tags
---

<div id="archives">
  {% assign tags_with_sizes = site.tags | map: "first" | map: "size" %}
  {% assign sorted_tags = site.tags | sort: "size" %}
  {% for tag in sorted_tags reversed %}
    {% assign tag_name = tag[0] %}
    {% assign tag_posts = site.tags[tag_name] %}
    {% assign tag_size = tag_posts | size %}
    <div class="archive-group">
      <div id="#{{ tag_name | slugify }}"></div>
      <p></p>

      <h3 class="category-head">{{ tag_name }} ({{ tag_size }})</h3>
      <a name="{{ tag_name | slugify }}"></a>
      <div class="archive-items">
        <table>
          {% for post in tag_posts %}
          <tr>
            <td>{{ post.date | date: "%Y-%m-%d" }}</td> <!-- Display publication date -->
            <td><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></td> <!-- Display post title (link) -->
          </tr>
          {% endfor %}
        </table>
      </div>
    </div>

{% endfor %}

</div>
