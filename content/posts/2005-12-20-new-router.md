---
title: New router


date: 2005-12-20T02:45:13+00:00
url: /2005/12/20/new-router/
short-url:
  - http://bit.ly/f7vWB8
categories:
  - Tech
tags:
  - tech
  - network
  - house
---
Due to some problems on the network, I isolated the issue to my venerable old SMC Barricade router. A port had gone bad a couple of years ago and now traffic through it was starting to drag and packet loss was getting pretty extreme.

So I replaced it with a Linksys WRT54G like most of the rest of the world and just finished getting it up and running. A couple of points for others who run into these problems:

 - It appears that you can not upgrade the firmware through the secure http administration pages. You have to do it through the standard http site.
 - After upgrading the firmware, if you have a static ip configured, you may need to go to the setup page and click the Save Settings button for it to use the configure ip again.

Otherwise it appears to be up and running and local network traffic is a _whole_ lot better again.