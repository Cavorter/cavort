---
title: Standardized Tests for Standardized Parameters
date: 2016-05-20T15:01:48+00:00
url: /2016/05/20/standardized-tests-for-standardized-parameters/
short-url:
- http://bit.ly/255LZ4u
categories:
- General
- Tech
tags:
- powershell
- tech
- pester
---
Something that you find when writing PowerShell modules to wrap API functions for external systems is that a lot of your functions tend to have a consistent subset of parameters that get used for things like credentials and specifying an endpoint. For example in the private TeamCity module that I maintain the parameter block for every function that interacts with a server has:

```powershell
[Parameter(Mandatory=$false)]
[System.Management.Automation.PSCredential]$Credential = ( Get-Credential -Message "Please enter your credentials for the TeamCity server at $server"),

[Parameter(Mandatory=$true)]
[ValidateNotNull()]
[string]$Server
```

(Whether that is the best pattern I'm still not sure, but it's beside the point of what I'm talking about here. If you have better ideas I'd love to hear about them!)

If you are writing good unit tests for your functions you need to test those parameters in every single one of those functions and ideally you want to test those parameters consistently to make sure that FunctionA doesn't use them slightly differently than FunctionB. Additionally if I find a better way of testing those parameters I don't want to have to update dozens (or more!) of Describe blocks. There had to be a way of writing those tests once and then calling those tests consistently when testing every one of those functions and it turns out to be pretty simple.

The trick is to consider that Pester is pretty consistent about scope inside the Describe and Context blocks so if we were to dot-source some external file in the correct context we should be able to inherit anything that's in that file. Declaring variables with consistent test values and wrapping tests inside of a function definition means that we can do the dot-source in the scope of a Describe block and then reference those variables and call those sets of tests in every function's tests.

For example, let's start with a file called "StandardTests.ps1" that defines two variables and a function to test those two variables:

```powershell
#Set some standard vars
$someVar1 = "this"
$someVar2 = "that"

Function Invoke-StandardTests {
It "Tests the first standard variable" {
$someVar1 | Should Not BeNullOrEmpty
}
It "Tests the second standard variable" {
$someVar2 | Should Not Be $someVar1
}
}
```

Then making uses of those variables and tests might look something like this:

```powershell
Describe "Some Tests" {
#import the standardized stuff
. $PSScriptRoot\StandardTests.ps1

It "Check the inherited value of the variables" {
$someVar1 | Should Be "this"
$someVar2 | Should Be "that"
}

#Run the standardized tests
Invoke-StandardTests
}
```
The only thing left is to run the tests!<br /> <a href="http://www.cavort.org/wp-content/uploads/2016/05/Pester-StandardizedTestOutput.png"><img class="alignleft size-full wp-image-1160" src="http://www.cavort.org/wp-content/uploads/2016/05/Pester-StandardizedTestOutput.png" alt="Successful Test output" width="508" height="121" srcset="http://www.cavort.org/wp-content/uploads/2016/05/Pester-StandardizedTestOutput.png 508w, http://www.cavort.org/wp-content/uploads/2016/05/Pester-StandardizedTestOutput-300x71.png 300w" sizes="(max-width: 508px) 85vw, 508px" /></a>