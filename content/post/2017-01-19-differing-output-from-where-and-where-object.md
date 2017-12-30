---
title: Differing output from Where and Where-Object

type: post
date: 2017-01-20T00:11:36+00:00
url: /2017/01/19/differing-output-from-where-and-where-object/
categories:
  - Tech
tags:
 - ForEach
 - PowerShell
 - Where
---
One of the lesser known features of PowerShell are some "magic" methods that get added to most (all?) collection objects that replace the slower Where-Object and ForEach-Object cmdlets with basically the same functionality. They're considered magic because they aren't well documented even years after they were introduced. (<a href="http://www.powershellmagazine.com/2014/10/22/foreach-and-where-magic-methods/">Thank goodness for bloggers</a>) I've used ForEach quite a bit, but often forget about it's Where counterpart and apparently had never actually done much with it until today when I ran into a weird issue where I couldn't set the value of a property on a returned object.

The setup is a pretty classic needle-in-a-haystack problem where you have an array of objects and need to update a property on just one of them. Pretty classically you'd do something like this.

```powershell
PS> [xml]$testXml = "<someElements><element id='foo' attr='somevalue'/><element id='bar' attr='someothervalue'/></someElements>"
PS> $testXml.someElements.element

id  attr
--  ----
foo somevalue
bar someothervalue

PS> # Using Where-Object works fine
PS> $testElement = $testXml.someElements.element | Where-Object { $_.id -eq 'foo' }
PS> $testElement.attr = "Good old standby works great"
PS> $testXml.someElements.element

id  attr
--  ----
foo Good old standby works great
bar someothervalue

PS>
```

It works great but if you've got a really big array of complex objects it can start to take a long time to process. So today I had remembered the aforementioned magic methods and figured it would be a lot faster to use Where to do essentially the same thing. Except I got a really unexpected error.

```powershell
PS> $testElement = $testXml.someElements.element.Where({ $_.id -eq 'foo' })
PS> $testElement.attr = "This should work,right?"
The property 'attr' cannot be found on this object. Verify that the property exists and can be set.
At line:1 char:1
+ $testElement.attr = "This should work,right?"
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : PropertyAssignmentException
```

Maybe it was returning a single element array? Running `$testElement -is [array]` said "False" but `$testElement[0].attr = 'something'` worked just fine, so what was going on here? Time for some more "magic" in the form of the pstypenames property.
  
```powershell  
PS> $testElement = $testXml.someElements.element | Where-Object { $_.id -eq 'foo' }
PS> $testElement.pstypenames
System.Xml.XmlElement
System.Xml.XmlLinkedNode
System.Xml.XmlNode
System.Object

PS> $testElement = $testXml.someElements.element.Where({ $_.id -eq 'foo' })
PS> $testElement.pstypenames
System.Collections.ObjectModel.Collection`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
System.Object
```

Of course while I was tinkering with all of that and doing some research on the Where and ForEach methods I ran across that article I linked further up and figured out the correct solution to the problem.

```powershell  
PS> $testXml.someElements.element.Where({$_.id -eq 'foo' }).ForEach('attr',"Much better!")
PS> $testXml.someElements.element

id  attr
--  ----
foo Much better!
bar someothervalue

PS>
```