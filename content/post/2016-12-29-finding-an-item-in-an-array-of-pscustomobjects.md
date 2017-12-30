---
title: Finding an item in an array of PSCustomObjects
type: post
date: 2016-12-29T17:58:45+00:00
url: /2016/12/29/finding-an-item-in-an-array-of-pscustomobjects/
categories:
  - General
  - Tech
tags:
 - Array
 - PowerShell
 - PSCustomObject

---
(This is mostly so I can find it again someday when I need it again.)

When working with REST interfaces with PowerShell it's pretty common to get JSON responses that have information that is returned as arrays of PSCustomObjects. If you need to update a property of one of those objects you can't just do something simple like:

```powershell
PS C:\> ($result.objArray | Where-Object { $_.name -eq "whatever" }).value = "SomeNewValue"
```

In order to set the value of a property you're going to have to find the index of that particular object in the array and then manipulate it directly. Thankfully this is easier than it sounds because we have access to the static methods of the .Net Array object, and FindIndex in particular. The previous example actually ends up being something like this:

```powershell
PS C:\> $index = [Array]::FindIndex( $result.objArray, [System.Predicate[pscustomobject]]{ $args[0].name -eq "two" } )
PS C:\> $result.objArray[$index].value = "SomeNewValue"
```