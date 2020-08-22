---
title: Simple test coverage check for script modules


date: 2016-04-08T22:33:24+00:00
url: /2016/04/08/simple-test-coverage-check-for-script-modules/
short-url:
  - http://bit.ly/25Q6bsq
categories:
  - Random Crap
  - Tech

---
<div class='microid-mailto+http:sha1:4a811d9aca42d375b8052f354e108f30ed0dabc6'>
  
    I've been spending a lot of time at work writing PowerShell modules and as part of that effort we've been trying to make sure we're doing at least some unit testing on those module functions (Using <a href="https://github.com/pester/Pester">Pester</a> of course!). Unfortunately we've had a few instances where a new function gets added to a module without any unit tests being added. We've structured our modules so that every function has it's own source file and accompanying tests file and all of them are located in a \Functions\ folder in the project. Ideally the CodeCoverage parameter for Invoke-Pester would catch this sort of problem but it only runs tests for files with a certain file name structure and so if it runs across Some-Function.ps1 without an accompanying Some-Function.Tests.ps1 it doesn't care. Today I finally got a little tired of finding broken functions and decided to do something about it, the result is Coverage.Tests.ps1:
  
  
  <pre>Describe "Coverage" {
    Context "All functions should have tests" {
        $functions = Get-ChildItem -Path $PSScriptRoot\*.ps1 -Exclude *.Tests.ps1
        foreach ( $function in $functions ) {
            $name = $function.name.Split(".")[0]
            It "$name should have a testing script" {
                Test-Path "$PSScriptRoot\$name.Tests.ps1" | Should Be $true
            }
        }
    }
}</pre>
  
  
    I've got to think that it shouldn't be hard to add a similar test for my other pet peeve: Missing help comment blocks!
  
</div>

<div class="st-post-tags">
  Tags: <a href="http://www.cavort.org/tag/code-coverage/" title="Code Coverage" rel="tag">Code Coverage</a>, <a href="http://www.cavort.org/tag/pester/" title="Pester" rel="tag">Pester</a>, <a href="http://www.cavort.org/tag/powershell/" title="PowerShell" rel="tag">PowerShell</a>, <a href="http://www.cavort.org/tag/unit-testing/" title="Unit Testing" rel="tag">Unit Testing</a><br />
</div>