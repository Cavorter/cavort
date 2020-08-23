---
title: Reporting Pester Code Coverage Metrics to TeamCity
date: 2016-04-27T15:18:07+00:00
url: /2016/04/27/reporting-pester-code-coverage-metrics-to-teamcity/
short-url:
- http://bit.ly/26ugH8R
categories:
- General
- Random Crap
- Tech
tags:
- Powershell
- TeamCity
- Pester
---
As [previously mentioned](http://www.cavort.org/2016/04/08/simple-test-coverage-check-for-script-modules/) I've been doing a lot of work with PowerShell modules at work where I have recently gotten all the parts for a full continuous delivery pipeline working for those modules. A big section of that pipeline runs through [TeamCity](https://www.jetbrains.com/teamcity/) and while the existing [ability to have Pester test results show up in the build results](https://github.com/pester/Pester/wiki/Showing-Test-Results-in-CI-%28TeamCity%2C-AppVeyor%29) is really great, code coverage is slightly less obvious but in the end fairly simple.

The trick is to use the -PassThru parameter with Invoke-Pester and then use [TeamCity's build reporting interaction](https://confluence.jetbrains.com/display/TCD8/Build+Script+Interaction+with+TeamCity#BuildScriptInteractionwithTeamCity-ReportingBuildStatistics) to get the values into the system. The end result will look a lot like this:

```powershell
$testResults = Invoke-Pester -OutputFile Test.xml -OutputFormat NUnitXml -CodeCoverage (Get-ChildItem -Path $PSScriptRoot\*.ps1 -Exclude *.Tests.* ).FullName -PassThru
Write-Output "##teamcity[buildStatisticValue key='CodeCoverageAbsLTotal' value='$($testResults.CodeCoverage.NumberOfCommandsAnalyzed)']"
Write-Output "##teamcity[buildStatisticValue key='CodeCoverageAbsLCovered' value='$($testResults.CodeCoverage.NumberOfCommandsExecuted)']"
```

<figure id="attachment_1156" style="width: 277px" class="wp-caption aligncenter"><a href="http://www.cavort.org/wp-content/uploads/2016/04/PesterCodeCoverage.png"><img src="http://www.cavort.org/wp-content/uploads/2016/04/PesterCodeCoverage.png" alt="Pester code coverage right in your TeamCity build results!" width="277" height="161" class="size-full wp-image-1156" /></a><figcaption class="wp-caption-text">Pester code coverage right in your TeamCity build results!</figcaption></figure>