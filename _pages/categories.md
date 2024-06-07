---
layout: page
permalink: /tags/
title: Tags
---

<div id="archives">
  {% assign tag_list = "" %}
  {% for tag in site.tags %}
    {% capture tag_name %}{{ tag[0] }}{% endcapture %}
    {% capture tag_size %}{{ tag[1] | size }}{% endcapture %}
    {% assign tag_list = tag_list | append: tag_name | append: ":" | append: tag_size | append: ";" %}
  {% endfor %}

{% assign sorted_tag_list = tag_list | split: ";" | sort: "size" %}

{% for item in sorted_tag_list reversed %}
{% assign tag_name = item | split: ":" | first %}
{% assign tag_size = item | split: ":" | last %}
{% assign tag_posts = site.tags[tag_name] %}

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
