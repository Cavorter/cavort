---
title: Reducing perforce clutter

type: post
date: 2007-03-17T09:56:44+00:00
url: /2007/03/17/reducing-perforce-clutter/
short-url:
  - http://bit.ly/eB7rJN
categories:
  - Tech

---
<div class='microid-mailto+http:sha1:dafb8bd3bae56ce12456a6ae200bdea3cf1bd914'>
  
    As I was getting ready to leave work this evening I went into Perforce to find out who all had files checked out despite the request to get everything checked in before a major outage this weekend. I noticed there were a huge number and that there were some really low numbered changelist numbers so I started browsing through them and noticed a huge number of empty changelists. After a little bit of searching, I found out that you can delete an empty changelist from the command line as long as you have admin access using the following:<br /> <code>P4 change -d -f [changelist #]</code>
  
  
  
    After getting rid of a couple I decided that this was far too tedious to do one at a time and so then figured out the following command that will run through the pending changelists and delete any that are empty:<br /> <code>for /F "tokens=2" %i IN ('p4 changes -s pending') DO @p4 change -d -f %i</code>
  
  
  
    You can actually run this at any time since any changelist that still has open files in it will get a result resembling "Change 218644 has 359 open file(s) associated with it and can't be deleted." (BTW, that one is real and it is two years old).
  
