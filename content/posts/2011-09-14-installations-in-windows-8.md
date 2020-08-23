---
title: Installations in Windows 8
date: 2011-09-14T19:07:23+00:00
url: /2011/09/14/installations-in-windows-8/
short-url:
- http://bit.ly/ot2aW5
categories:
- InstallTech

---
<div class='microid-mailto+http:sha1:6512ce0239130c2b55546492a58eebc0b377f7da'>

If you follow my Twitter stream you'll have noticed that I've been playing with the Developer Preview of Windows 8 this morning. I've gotten a couple of funny looks from the family but to me a new operating system to play with and especially one with as many interesting changes as Windows 8 is pretty exciting.

As an installation developer though I figured I'd take a quick peek at things and see what was going on at this stage. The short version is: Quite a lot and very little.

The big news for setup developers is the introduction of an entirely new distribution model for the Metro Style applications using an AppX package which according to <a href="http://msdn.microsoft.com/en-us/library/windows/apps/hh464929">the documentation</a> is "An app package is a container based on the Open Packing Conventions (OPC) standard.". So pretty much it's a zip file with some structured content. There is <a href="http://msdn.microsoft.com/en-us/library/windows/apps/windows.management.deployment">API access to the installation system</a> but for the most part as far as installation development goes for Metro Style apps: A person with my specialized skills is not needed. Honestly, that's pretty much a good thing.

Of course this being a Microsoft product it does provide backward compatibility for older technologies and so I was unsurprised to see only a minor increment to the version of Windows Installer in this build to 5.0.8102.0 and continued to be unsurprised by the log output from a test installer I threw together to check for any non-obvious operational changes.

For your perusal:
<ul>
<li>
<a href='http://www.cavort.org/wp-content/uploads/2011/09/Win7-Install.txt'>Windows 7 Verbose Log</a>
</li>
<li>
<a href='http://www.cavort.org/wp-content/uploads/2011/09/Win8-Install.txt'>Windows 8 Verbose Log</a>
</li>
</ul>
The few little differences:
<ul>
<li>
The USERNAME property in Windows 8 gets set to a generic "Windows User" instead of the username.
</li>
<li>
Even though the authored MSI does not have a LaunchConditions action in either the UI or Execute sequences it appears that Windows Installer on Windows 8 is attempting to run it anyway and gets an error.
</li>
<li>
A few small errors that appear to occur while attempting to update the progress dialog during execution.
</li>
</ul>
At a guess the last two can probably be put down to defects of some sort, but the first one could be interesting if it is not another defect. The installer was executed under an account that was generated using my Windows Live ID so I generated a local user (Which can only be done through a currently non-obvious method) and verified that it shows up the same there. Though the USERNAME environment variable is populated properly so maybe this is just another defect. I know I have used that property for installations a couple of times and it would be problematic if it was no longer populated.

For completeness sake I also ran a couple of classic InstallScript installers and everything ran fine there as well and the log output from those didn't have any surprises.

