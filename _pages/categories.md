---
layout: page
permalink: /tags/
title: Tags
---

<div id="archives" class="tags-container">
  {% assign tag_list = "" %}
  {% for tag in site.tags %}
    {% capture tag_name %}{{ tag[0] }}{% endcapture %}
    {% capture tag_size %}{{ tag[1] | size }}{% endcapture %}
    {% assign tag_list = tag_list | append: tag_name | append: ":" | append: tag_size | append: ";" %}
  {% endfor %}

  {% assign tag_array = tag_list | split: ";" %}
  {% assign sorted_tags = tag_array | sort %} <!-- Alphabetical order -->

  <div class="tags-list">
    {% for item in sorted_tags %}
      {% assign tag_info = item | split: ":" %}
      {% assign tag_name = tag_info[0] %}
      {% assign tag_size = tag_info[1] %}

      <a href="#{{ tag_name | slugify }}" class="tag-badge">
        {{ tag_name }} <span class="tag-count">{{ tag_size }}</span>
      </a>
    {% endfor %}
  </div>

  {% for item in sorted_tags %}
    {% assign tag_info = item | split: ":" %}
    {% assign tag_name = tag_info[0] %}
    {% assign tag_size = tag_info[1] %}
    {% assign tag_posts = site.tags[tag_name] | sort: "date" %} <!-- Ensures posts are sorted by date -->

    <div class="archive-group">
      <h3 id="{{ tag_name | slugify }}" class="category-head">
        {{ tag_name }} <span class="tag-count">({{ tag_size }})</span>
      </h3>
      <ul class="post-list">
        {% for post in tag_posts reversed %}
          <li>
            <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
            <a href="{{ site.baseurl }}{{ post.url }}" class="post-link">{{ post.title }}</a>
          </li>
        {% endfor %}
      </ul>
    </div>
  {% endfor %}
</div>

<style>
  .tags-container {
    max-width: 800px;
    margin: auto;
    font-family: Arial, sans-serif;
  }

  .tags-list {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-bottom: 20px;
  }

  .tag-badge {
    background: #0073e6;
    color: white;
    padding: 6px 12px;
    border-radius: 20px;
    text-decoration: none;
    font-size: 14px;
  }

  .tag-badge:hover {
    background: #005bb5;
  }

  .tag-count {
    background: white;
    color: #0073e6;
    padding: 2px 6px;
    border-radius: 10px;
    margin-left: 6px;
    font-weight: bold;
  }

  .archive-group {
    margin-top: 20px;
    padding: 10px;
    border-bottom: 1px solid #ddd;
  }

  .category-head {
    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
  }

  .post-list {
    list-style: none;
    padding: 0;
  }

  .post-list li {
    padding: 8px 0;
    display: flex;
    gap: 10px;
    align-items: center;
  }

  .post-date {
    color: #888;
    font-size: 14px;
    min-width: 100px;
  }

  .post-link {
    text-decoration: none;
    color: #0073e6;
    font-size: 16px;
  }

  .post-link:hover {
    text-decoration: underline;
  }
</style>
