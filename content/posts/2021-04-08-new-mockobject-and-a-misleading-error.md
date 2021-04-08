+++
title = "New-MockObject and a Misleading Error"
date = 2021-04-08T09:57:25-05:00
images = []
categories = [ "Tech" ]
tags = [ "PowerShell" , "New-MockObject" ]
draft = false
+++

The joy of writing unit tests sometimes is making sure that you can properly mock the interaction with other systems, especially systems that might be really expensive if you had to hit them every time you wanted to run a unit test. Obviously mocking function calls with simple `$true` and `$false` values will get you most of the way there, but sometimes you need to return an object from those mocked calls and for that [`New-MockObject`](https://pester-docs.netlify.app/docs/commands/New-MockObject) can be a lifesaver. **IF** you can get it to work.

I just finished working through one of those problems recently and since it was so hard to find someone else who had talked about how they had solved this kind of problem I figured it was worth making a quick post both so I can refer to it again later when I inevitably see this problem again, but also hopefully to help anyone else who runs into this problem in the future.

I was working on a function that interacts with Azure resources and needed to make a call to `Get-AzSubscription` but then needed to make use of the returned subscription object in later calls to some other functions so the answer seemed straight-forward and at the time simple.
```powershell
Describe "My-Function" {
    BeforeAll {
        $azSubObj = New-MockObject -Type 'Microsoft.Azure.Commands.Profile.Models.PSAzureSubscription'
        Mock -CommandName Get-AzSubscription -MockWith { return $azSubObj }
    }

    It "Retrieves the specified subscription" {
        Should -Invoke -CommandName Get-AzSubscription -Times 1 -Exactly
    }
}
```

Tests done. Implementation done. Local unit tests green. Commit to repo. Done. Right?

**Not so fast!**

```
[-] Describe My-Function failed

 PSInvalidCastException: Cannot convert the "Microsoft.Azure.Commands.Profile.Models.PSAzureSubscription" value of type "System.String" to type "System.Type".
 ArgumentTransformationMetadataException: Cannot convert the "Microsoft.Azure.Commands.Profile.Models.PSAzureSubscription" value of type "System.String" to type "System.Type".
 ParameterBindingArgumentTransformationException: Cannot process argument transformation on parameter 'Type'. Cannot convert the "Microsoft.Azure.Commands.Profile.Models.PSAzureSubscription" value of type "System.String" to type "System.Type".
 at <ScriptBlock>, /home/vsts/work/1/s/functions/My-Function.Tests.ps1:3

```

After checking through to see if it was a problem with Windows PowerShell vs PowerShell Core or Core on Linux vs Core on Windows and a whole host of other attempts to resolve the error, I finally figure out the problem: While PowerShell is great at auto-loading modules when you refer to functions it does not do any of that magically behavior when you are referring to a type that might be loaded by one of those modules so in this case the class was not available without first loading the module. Once I finally realized what was happening the solution was incredibly simple: load the module pre-emptively!

```powershell
Describe "My-Function" {
    BeforeAll {
        Import-Module -Name Az.Accounts
        $azSubObj = New-MockObject -Type 'Microsoft.Azure.Commands.Profile.Models.PSAzureSubscription'
        Mock -CommandName Get-AzSubscription -MockWith { return $azSubObj }
    }

    It "Retrieves the specified subscription" {
        Should -Invoke -CommandName Get-AzSubscription -Times 1 -Exactly
    }
}
```
