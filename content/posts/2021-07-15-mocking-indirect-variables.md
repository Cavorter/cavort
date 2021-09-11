+++
title = "Mocking Indirect Variables"
date = 2021-07-15T16:52:01-05:00
images = []
tags = [ "Tech" ]
categories = [ "PowerShell" , "Pester" ]
+++

I have been working with an API that returns some extra info in the response headers and so was looking forward to getting a lot of mileage out of the new `-ResponseHeadersVariable` parameter for `Invoke-RestMethod`, but as I was writing tests for my new functions I ran into an issue: How do you mock setting that kind of variable?

Turns out the answer was pretty simple, just use the old trusty `Set-Variable` function with the `-Scope` parameter. It took me a little bit of figuring out which scope to use and tried the value for the parent scope first (`1`), but it turns out that the `script` scope is all that's needed.

```powershell
function My-Function {
    $result = Invoke-RestMethod -Uri "https://api.somewhere.com/some/endpoint" -ResponseHeadersVariable responseHeaders
    $responseHeaders.SomeKey | Write-Output
}

Describe "My-Function" {
    It "Returns the value of SomeKey from the response headers" {
        $goodResponse = "Woot!"
        Mock -CommandName Invoke-RestMethod -MockWith { Set-Variable -Scope Script -Name responseHeaders -Value @{ SomeKey = $goodResponse }; return $true }
        My-Function | Should -Be $goodResponse
    }
}
```
