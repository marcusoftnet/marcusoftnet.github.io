---
layout: page
permalink: /wc/
title: Word Cloud
author: Marcus Hammarberg
description: Word cloud visualization of blog posts by year.
---

<script src="https://cdn.jsdelivr.net/npm/wordcloud@1.2.2/src/wordcloud2.min.js"></script>
<style>
  body {
    text-align: center;
    padding: 2em;
  }
  canvas {
    border: 1px solid #ccc;
    background: #fff;
    margin-top: 1em;
  }

  #controls {
    margin-bottom: 1em;
  }
</style>

<div id="controls">
  <label for="yearSelect">Select a year:</label>
  <select id="yearSelect">
    <option value="">-- Choose Year --</option>
  </select>
</div>

<canvas id="wordcloud" width="2340" height="1520"></canvas>

<script>
  const canvas = document.getElementById('wordcloud');
  const yearSelect = document.getElementById('yearSelect');

  document.addEventListener("DOMContentLoaded", () => {
    const endYear = new Date().getFullYear();
    for(let year = 2006; year <= endYear; year++) {
      yearSelect.append(new Option(""+year, ""+year, true, true));
    }
    yearSelect.selectedIndex = 0;
  });

  yearSelect.addEventListener('change', () => {
    const year = yearSelect.value;
    if (!year) return;

    fetch(`/data/wc/wordcloud-${year}.json`)
      .then(res => {
        if (!res.ok) throw new Error("Failed to load word list");
        return res.json();
      })
      .then(words => {
        WordCloud(canvas, {
          list: words,
          gridSize: Math.round(16 * $('#canvas').width() / 1024),
          weightFactor: function (size) {
            return Math.pow(size, 2.3) * $('#canvas').width() / 1024;
          },
          fontFamily: 'Arial',
          color: 'random-dark',
          rotateRatio: 0.5,
          rotationSteps: 3,
          backgroundColor: '#fff'
        });
      })
      .catch(err => {
        alert("Could not load word cloud data: " + err.message);
      });
  });
</script>
