---
title: It’s been an exciting few days for me. Last Tuesda…
date: 2002-02-13T16:26:38+00:00
url: /2002/02/13/its-been-an-exciting-few-days-for-me-last-tuesda/
short-url:
- http://bit.ly/eL5xKS
categories:
- General
- Tech
tags:
 - linux
 - iptables
 - firewalls
 - networking

---
It's been an exciting few days for me. Last Tuesday I took down the network to do a bit of reorganizing. Betsy had not been able to use the VPN client on her work machine at home and so we had talked about replacing our existing firewall with something a bit more flexible, as well as a bit more secure. We had been just running the internal Windows 2000 Server as the firewall and gateway as well as serving various other functions. I know, that's a bad plan given how secure Windows is these days, but it was functional and we had no known break-ins.

So, we decided to give Linux a try. I had been playing with the Mandrake 8.1 release for awhile as a workstation OS and thought we could give it a try as a firewall and gateway machine.

So, we did. Mandrake 8.1 uses the Linux 2.4 kernel which has some new code called NetFilter to handle firewall/proxy/NAT and various other functions. It's all handled through an application called IPtables. For those of you familiar with IPchains from previous Linux versions, I imagine that IPtables wouldn't be too hard to figure out. For someone who has been used to using what are essentially off the shelf firewalls, it has been quite an adventure. It did not take me too long to get the internal traffic to forward to the outside world, the real problem was getting outside traffic to get in to this server.

I think that I can safely say that Linux documentation as a whole is still really very bad. It has improved greatly since the last time I looked hard at this OS (circa 1995, Pre 1.0) but it is still largely obtuse and assumes particular arcane knowledge too often. I did however break down and hunted through one of the local Barnes & Noble stores for some help, and I found some.

<a href="http://www.linux-firewall-tools.com/linux/book/">Linux Firewalls (2nd Ed)</a> by Robert L. Ziegler is a really fantastic piece of work. Building on a previous edition written for the pre-2.4 kernels, he builds from simple concepts to complex topics and only then, tells you want you need to do in order to get things working properly. If you plan on putting together a Linux based firewall, this is the book to get.

So, I got HTTP traffic working inbound after 4 days of being stumped, and even got FTP traffic working this morning (which is how this post got here) but now I'm to the stickier bits. Currently we aren't able to resolve the internal servers by their external designations. I think I know where the problem is now, but I just have to find the time to fix it.

In the meantime, the network is much more secure than it was a week ago, and I know a heck of a lot more about both Linux and firewalls in general work.

Definitely a net gain.