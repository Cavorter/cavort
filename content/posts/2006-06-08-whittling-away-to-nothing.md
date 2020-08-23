---
title: Whittling away to nothing
date: 2006-06-08T22:37:44+00:00
url: /2006/06/08/whittling-away-to-nothing/
short-url:
- http://bit.ly/h7t33v
categories:
- InstallTech
tags:
- InstallShield
- MacroVision
---
I took some time at work today to give a pretty thorough run through to [InstallShield 12 Professional](http://www.macrovision.com/products/flexnet_installshield/installshield/editions/professional.shtml). I have to say: I'm pretty annoyed. The last couple of releases under the new [Macrovision](http://www.macrovision.com) brand have really been fairly telling about the focus of the parent company.

In particular with InstallShield 12 is the removal of the stand alone build engine from the Professional edition. Now it's only available if I spend another $1199.00 to upgrade to the [Premier edition](http://www.macrovision.com/products/flexnet_installshield/installshield/editions/premier.shtml). Unfortunately I actually make very good use of the stand alone build engine from InstallShield 11.5, 11, and 10 on several build boxes here at work. It has always been really nice to be able to test the automation scripts on my primary workstation and then port them over to a pure build environment with only a couple of tweaks and not have to worry about purchasing extra licenses for the application.

I suppose the upside is that there is really absolutely nothing except [some IDE tweaks and long awaited bug fixes](http://www.macrovision.com/downloads/products/flexnet_installshield/installshield/release_notes/is12_relnotes.shtml) in 12 that really give me any reason to upgrade any of my existing projects. Without the stand along build engine I'm certainly going to be giving some thought to not migrating them at all.

However this is really starting to show a trend in recent InstallShield releases that we in the idustry should really be paying attention to. InstallShield X, while certainly having some flaws, was a really well done release that finally combined the entire sweep of InstallShield installation projects under one big suite of applications. You could build for any platform with pretty much a single app, and it worked. Just over a year later and Macrovision buys out InstallShield. The next release (10.5) is expectedly incremental, but still pretty good.

11 is the first full release under the Macrovision banner, and it's pretty good. There are some interesting features added (The repository being my favorite. Too bad local repositories are <em>still</em> not entirely functional even in the current version!) and overall it's a decent release.

Then came 11.5 which should have been just a point release, but somewhat unexpectedly they split up the Windows and Multiplatform camps into two seperate suites again. Those of us who were lucky enough to have a software maintenance plan got both versions but the letter that came along with it started to show that the Macrovision's respect for it's customers ended at the depth of their wallets.

Now comes 12, which really has very little in the way of substantial updates and they start to take <em>away</em> features? I think that might settle how badly they want the business of a shop like ours.

You know, [WiX](http://wix.sourceforge.net/) has been looking really stable lately and it won't be a big deal to port some of my smaller InstallScript projects over to it. It will be nice to get some of those into MSI finally as well and there hasn't been any really good reason to do it before now with InstallShield.