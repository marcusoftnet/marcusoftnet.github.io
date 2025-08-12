---
layout: page
permalink: /wc/
title: Word Cloud
author: Marcus Hammarberg
description: Word cloud visualization of blog posts by year.
---

<script src="https://d3js.org/d3.v7.min.js"></script>
<script src="https://unpkg.com/d3-cloud/build/d3.layout.cloud.js"></script>
<style>
  body {
    text-align: center;
    padding: 2em;
  }
</style>

<div id="controls">
  <label for="yearSelectLabel">Select a year:</label>
  <select id="yearSelect">
    <option value="">-- Choose Year --</option>
  </select>
</div>

<div id="wordcloud"></div>

<script>
  const canvas = document.getElementById('wordcloud');
  const yearSelect = document.getElementById('yearSelect');

  document.addEventListener("DOMContentLoaded", () => {
    const endYear = new Date().getFullYear();
    for(let year = endYear; year >= 2006; year--) {
      yearSelect.append(new Option(""+year, ""+year, true, true));
    }
    yearSelect.selectedIndex = 1;
    yearSelect.dispatchEvent(new Event('change', { bubbles: true }));
  });

  yearSelect.addEventListener('change', () => {
    const year = yearSelect.value;
    if (!year) return;

    fetch(`/data/wc/wordcloud-${year}.json`)
      .then(response => response.json())
      .then(data => {
        const words = data.map(([text, size]) => ({
          text,
          size: 10 + size * 0.4 // Adjust scaling as needed
        }));

        console.log(`Creating a word cloud for ${words.length} words`);

        // Remove the current svg, if it exists
        const svg = document.querySelector('#wordcloud svg');
        if (svg) {
          svg.remove();
        }

        d3.layout.cloud()
          .size([800, 400])
          .words(words)
          .padding(5)
          .rotate(() => ~~(Math.random() * 2) * 30)
          .font("Impact")
          .fontSize(d => d.size * 2)
          .on("end", draw)
          .start();

        function draw(words) {
          d3.select("#wordcloud").append("svg")
            .attr("width", 800)
            .attr("height", 400)
            .append("g")
            .attr("transform", "translate(400,200)")
            .selectAll("text")
            .data(words)
            .enter().append("text")
            .style("font-size", d => d.size + "px")
            .style("font-family", "Impact")
            .style("fill", () => d3.schemeCategory10[Math.floor(Math.random() * 10)])
            .attr("text-anchor", "middle")
            .attr("transform", d => `translate(${d.x},${d.y})rotate(${d.rotate})`)
            .text(d => d.text);
        }
      });
  });

</script>
