---
title: Environment and Path Variables in InstallShield
date: 2011-11-15T16:16:49+00:00
url: /2011/11/15/environment-and-path-variables-in-installshield/
short-url:
- http://bit.ly/ugnzug
categories:
- InstallTech
- Tech

---
For whatever reason I have either never had a reason to use an Environment Variable for a Path Variable in InstallShield before now, or it's been long enough that I forgot how to do it so this morning when I went in to try and set one up I was a bit surprised to find it to not be quite as straightforward as I thought it might be.

I had originally just gone straight to the Path Variables section of the IDE [EDIT: after creating the environment variable before starting InstallShield] and created a new Path Variable entry and changed the type to "Environment" however no matter what I did I could not get it to resolve to the value of the Environment Variable that I had already created. The help files were no help and I didn't see anything in a quick search on the InstallShield Community Forums (which are normally a great resource for exactly this sort of problem). I had been using InstallShield 2009 Professional and verified that it worked the same ways in 2010 and 2011. Eventually I stumbled on to this method:
<ol>
<li>
Create the environment variable on the system first through the usual methods.
</li>
<li>
Open the InstallShield project that you want to use the variable in. (If you have the project open when you create the variable it does not always propagate until you've restarted InstallShield. It's a fairly consistent problem with Windows environment variables.)
</li>
<li>
In Tools | Options on the Path Variables tab, make sure you have either "Always recommend:" or "Always display:" selected. If you want to use an environment variable that an existing path variable points to you will want to either modify/delete the existing path variable or have the option set to "Always display:".
</li>
<li>
Add or modify the location of a file in some part of the IDE and use the environment variable in the "Browse for File dialog". This could be in a component or in something like the signing certificate file location in the Release settings.
</li>
<li>
When the "Path Variable Recommendation" dialog appears make sure to select "Create a new path:" and enter a name that is identical to the environment variable you want to use.
</li>
<li>
Go to the Path Variables section of the IDE and change the Type for the new variable to "Environment".
</li>
</ol>
If you did everything properly the "Current Value" field should immediately change to "<variablename>" where "VARIABLENAME" is the name of the environment variable that you are referencing.

If someone knows of an easier way of doing this I'd love to hear about it!