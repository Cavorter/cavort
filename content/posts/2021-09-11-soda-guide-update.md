+++
title = "Soda.Guide Update"
date = 2021-09-11T14:35:08-05:00
images = []
tags = [ "soda" ]
categories = [ "personal", "soda" ]
+++

It is finally complete! This afternoon I finished mining my old Twitter feed for all of the soda reviews (and review adjacent posts) and have completed converting it all to [the new site](https://soda.guide). I have been fairly regularly posting new reviews since the spring but converting all 600+ of the old reviews was a heck of a chore, that thankfully is FINALLY complete.

Current review count: 707! That's a pretty big number.

Of course now that I have all of that data in a fairly consistent format and in one place I'm starting to see the issues with my current organization system and have already been thinking about what the next version of the site might look like. Current issues are:
- The last two pushes I did today brought me over the 250MB limit imposed by [the Free SKU for Azure Static Web Apps](https://docs.microsoft.com/en-us/azure/static-web-apps/plans) so now I'm actually starting to pay some actual money for the hosting. It's not very much but certainly not the nearly $0 that I was paying previously.
- There are now 707 reviews and 721 markdown files in the Reviews folder which is making things a bit more tricky to get to quickly when I am just trying to browse through the content. I'm still missing a few features on the site too, like links to some of the extra taxonomies I've added to be able to _find_ anything on the site. The best example is at least the Brands taxonomy would make it much simpler to jump from one review to all reviews with the same branding.
- It's effectively impossible to post from a phone. I did manage it once, but it was arduous enough that will likely never happen again.

I'm not entirely sure what I'll actually do next. [Hugo](https://gohugo.io) works pretty well for a lot of use cases but I think I might just be getting to some of the reasonable limits for this kind of site and that kind of tool. Still not a JavaScript fan, so maybe something like Flutter or whatever Microsoft's current framework is called is somewhat likely. Whatever direction I end up going it will be a heck of a lot easier to get there now at least.