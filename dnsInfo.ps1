$basicParams = @{
    ZoneName = "cavort.org"
    ResourceGroupName = "CavortBlog"
    Ttl = 3600
    #WhatIf = [switch]$true
    Verbose = [switch]$true
}

# A
$recordType = "A"

$name = "@"
$Records = New-AzureRmDnsRecordConfig -IPv4Address "69.89.27.205"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records


$name = "cavorter"
$Records = New-AzureRmDnsRecordConfig -IPv4Address "69.89.27.205"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "home"
$Records = New-AzureRmDnsRecordConfig -IPv4Address "69.89.27.205"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "webmail"
$Records = New-AzureRmDnsRecordConfig -IPv4Address "69.89.27.205"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "wiki"
$Records = New-AzureRmDnsRecordConfig -IPv4Address "45.55.138.154"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "www.cavorter"
$Records = New-AzureRmDnsRecordConfig -IPv4Address "69.89.27.205"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "www.home"
$Records = New-AzureRmDnsRecordConfig -IPv4Address "69.89.27.205"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "www.webmail"
$Records = New-AzureRmDnsRecordConfig -IPv4Address "69.89.27.205"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records


# CNAME
$recordType = "CNAME"

$name = "ftp"
$Records = New-AzureRmDnsRecordConfig -Cname "cavort.org"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "mail"
$Records = New-AzureRmDnsRecordConfig -Cname "cavort.org"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "test"
$Records = New-AzureRmDnsRecordConfig -Cname "cavort001.azureedge.net"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "www"
$Records = New-AzureRmDnsRecordConfig -Cname "cavort.org"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

#MX
$recordType = "MX"
$name = "@"
$params = @(
    @{
        Preference = 1
        Exchange   = "aspmx.l.google.com"
    }
    @{
        Preference = 5
        Exchange   = "alt1.aspmx.l.google.com"
    }
    @{
        Preference = 5
        Exchange   = "alt2.aspmx.l.google.com"
    }
    @{
        Preference = 10
        Exchange   = "aspmx2.googlemail.com"
    }
    @{
        Preference = 10
        Exchange   = "aspmx3.googlemail.com"
    }
    @{
        Preference = 10
        Exchange   = "aspmx4.googlemail.com"
    }
    @{
        Preference = 10
        Exchange   = "aspmx5.googlemail.com"
    }
)
$records = $params | ForEach-Object { $paramSet = $_; New-AzureRmDnsRecordConfig @paramSet }
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

# TXT
$recordType = "TXT"

$name = "@"
$Records = New-AzureRmDnsRecordConfig -Value "v=spf1 +a +mx +ip4:69.89.27.205 ?all"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "_domainkey"
$Records = New-AzureRmDnsRecordConfig -Value "o=~"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "cavorter"
$Records = New-AzureRmDnsRecordConfig -Value "v=spf1 +a +mx +ip4:69.89.27.205 ?all"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "home"
$Records = New-AzureRmDnsRecordConfig -Value "v=spf1 +a +mx +ip4:69.89.27.205 ?all"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records

$name = "webmail"
$Records = New-AzureRmDnsRecordConfig -Value "v=spf1 +a +mx +ip4:69.89.27.205 ?all"
New-AzureRmDnsRecordSet @basicParams -Name $name -RecordType $recordType -DnsRecords $records
