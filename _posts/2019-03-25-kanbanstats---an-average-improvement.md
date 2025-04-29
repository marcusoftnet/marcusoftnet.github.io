---
layout: post
title: "KanbanStats: Rethinking Process Metrics"
author: "Marcus Hammarberg"
date: 2019-03-25 12:41:24
tags:
 - Agile
 - Kanban
 - Lean
---

I've always believed in the transformative power of books—they alter our perspectives and enrich our understanding of the world. As an avid reader and unapologetic learn-o-holic, I recently delved into [When Will It Be Done](https://leanpub.com/whenwillitbedone) by [Dan Vacanti](https://twitter.com/danvacanti), and it revolutionized my approach to process metrics. My previous musings on the topic, documented in a series of [blog posts](https://www.marcusoft.net/2019/01/kanbanstats-simplify-process-stats-get-started.html), were challenged by Vacanti's insights, prompting a reevaluation of my methodologies.

## The Fallacy of Averages

Vacanti's work references "[The Flaw of Averages](https://www.amazon.com/Flaw-Averages-Underestimate-Risk-Uncertainty-ebook/dp/B0096CT4VY)" by Sam L. Savage, which elucidates the misleading nature of averages in statistical analysis. The book's premise—that averages fail to account for outliers and distribution nuances—resonated deeply, highlighting the inadequacies of conventional metrics.

Consider these illuminating anecdotes:

> "If Bill Gates walks into a bar, everyone in the bar is, on average, a millionaire."
>
> "Never cross a river that is, on average, 4 feet deep."

Vacanti's assertion, echoed in his chapter titled "Don't ever forecast using averages," challenges conventional wisdom and exposes the fallibility of traditional metrics.

## Course Correction

This newfound awareness forced a reckoning with my own practices, particularly regarding lead time calculations. Much of my previous analysis relied heavily on averages, a flawed approach now evident in light of Vacanti's teachings.

Embracing Vacanti's philosophy, I sought to devise a more nuanced and accurate methodology—one that eschews averages in favor of percentiles.

## The Power of Percentiles

Percentiles offer a superior means of gauging data distribution, providing invaluable insights for forecasting. Vacanti's guidance underscored the simplicity and efficacy of percentiles compared to traditional averages.

Armed with this insight, I embarked on a journey to recalibrate my process metrics, leveraging the versatility of Google Sheets' [QUERY](https://support.google.com/docs/answer/3093343?hl=en&authuser=0) function to streamline data analysis.

## Re-imagining Lead Time Analysis

I revamped my lead time analysis, leveraging percentiles to provide more accurate forecasts. By calculating percentile values, I could offer probabilistic estimates of completion time—a marked improvement over simplistic averages.

### Empowering Throughput Reporting

In addition to lead time analysis, I revisited throughput reporting, leveraging percentiles to provide nuanced insights into team performance. By shifting focus from averages to percentiles, I could offer more meaningful forecasts and identify actionable insights.

## Redefining Process Visualization

My journey culminated in the creation of novel visualization tools, including a histogram for flow time analysis and a blockers tracker. These tools offer deeper insights into process dynamics, empowering teams to identify bottlenecks and drive continuous improvement.

## Conclusion

My re-calibrated approach to process metrics represents a departure from conventional wisdom, embracing the transformative potential of percentiles over averages. As I continue to refine these methodologies, I invite fellow practitioners to join me on this journey of exploration and discovery.

[Access the updated Google Sheets template here](https://docs.google.com/spreadsheets/d/1lmlelcMdvo1SvQ0JZXraGYQxnZ5TNZ5qxUj5CapJn40/edit#gid=1896547007) and embark on your own voyage of process optimization.

Stop using averages. Embrace percentiles. Forecast based on data, not estimates.
