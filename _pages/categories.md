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

{% assign tag_array = tag_list | split: ";" %}
{% assign sorted_tags = tag_array | sort %}

{% for item in sorted_tags reversed %}
{% assign tag_info = item | split: ":" %}
{% assign tag_name = tag_info[0] %}
{% assign tag_size = tag_info[1] %}
{% assign tag_posts = site.tags[tag_name] | sort: "date" %}

    <div class="archive-group">
      <div id="#{{ tag_name | slugify }}"></div>
      <p></p>

      <h3 class="category-head">{{ tag_name }} ({{ tag_size }})</h3>
      <a name="{{ tag_name | slugify }}"></a>
      <div class="archive-items">
        <table>
          {% for post in tag_posts %}
          <tr>
            <td width="25%">{{ post.date | date: "%Y-%m-%d" }}</td> <!-- Display publication date -->
            <td><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></td> <!-- Display post title (link) -->
          </tr>
          {% endfor %}
        </table>
      </div>
    </div>

{% endfor %}

</div>
