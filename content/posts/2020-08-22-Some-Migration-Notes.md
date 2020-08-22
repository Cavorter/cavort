+++
title = "Some Migration Notes"
date = 2020-08-22T14:07:30-05:00
images = []
tags = []
categories = [
    "Tech"
]
+++

As I mentioned in the previous post I am hosting this blog on [Azure Static Web Apps](https://docs.microsoft.com/en-us/azure/static-web-apps/) now using [Hugo](https://gohugo.io/) as my generator. That transition was definitely not without quite a few bumps along the way. I first started to work on this transition about 4 years ago when it was necessary to generate quite a bit of Azure infrastructure to make it work, including some hacks to make default pages for folders work properly, so it never quite got done until today.

I relied on plenty of tools and good advice on the net so I figured I'd add my own pointers for the next person who tries to get this to work, especially someone with a fairly long archive of posts.
- Do have make sure to read through [Jason Hand's post](https://dev.to/jasonhand/10-tips-for-building-and-deploying-hugo-websites-on-azure-static-web-apps-307l) for a number of handy tips, especially about the default value of the `api_location` property. Every test site I've been working with for the past week has had that particular problem on the first commit.
- I chose Hugo as my generator quite a few years ago when there were only a few available. IIRC my primary reason for choosing it over Jekyll, which has a MUCH higher install base given GitHub's fantastic integration for GitHub Pages, was that Hugo is GO based while Jekyll is Ruby based and I'm a Windows guy. Generally ruby is just PITA on Windows. IIRC I did also like some of the flexibility built into Hugo for different kinds of sites too but that probably wasn't the primary concern.
- It turns out that the current 100MB content size limit in Azure Static Web Apps is non-trivial for a site like this one where I had implemented both categories and tags on the original WordPress implementation and also wanted to maintain all of the links to my old content. That generates a non-trivial number of pages which all added up to nearly 200MB of content to upload. I was able to get it down to ~50MB just by disabling the tags.
- Keep in mind that Azure Static Web Apps are still in preview and have only been available publicly since May 2020, which isn't very long from when I'm writing this. They've already improved a fair bit from the issue logs that I've seen and I imagine they'll improve quite a bit more over time. It'll be interesting to see the pricing when it finally comes out of preview but I'm not really expecting too much sticker shock based on what I was paying for the old infrastructure that I never quite got working. (~2 USD per month for the full site with all of the tag pages)
- I used a few different exporters to get my content out of WordPress. I finally ended up using [WordPress to Hugo Exporter](https://github.com/SchumacherFM/wordpress-to-hugo-exporter) and a **_HUGE_** amount of regex to parse the output into something that actually rendered with my chosen theme. I went the direct route only because the route of WordPress -> Jekyll -> Hugo was _just_ about right but the regex to fix the problems was actually more complicated. A lot of that had to do with some of the legacy formatting I was using on my WordPress site so it's not entirely clear that everyone would have those kinds of problems.

Good luck to you if you are trying to do something similar. At least it's a lot easier now than it was four years ago!