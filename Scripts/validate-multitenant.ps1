<#
.SYNOPSIS 
Tests the end to end functionality of the Exchange app.
.DESCRIPTION
This script tests the end to end functionality of the Exchange app by creating 2 users and 'n' orders. It then tests that the 'n' orders are successfully recored in the trade store.
.PARAMETER Domain
The fully qualified domain and reverse proxy port to contact the application i.e. myname.westeurope.cloudapp.azure.com:80
.PARAMETER numVotes
The number of votes to complete.
.PARAMETER requestTimeoutSec
Timeout for HTTP requests to the service
.EXAMPLE
. Scripts\smoke-test-put.ps1 -numVotes 100
#>
Param(
    [string]
    $domain = "clusterEndpoint:port",
    [int]
    $numVotes = 10,
    [int]
    $requestTimeoutSec = 5
)

$endpoint = "http://${domain}"
$global:successfulProbes = 0
$global:numProbes = 0

function log {
    Param ([string] $message)
    $time = (Get-Date).ToString('MM/dd/yyyy hh:mm:ss tt')
    Write-Host "[${time}] ${message}"
}
function call([string] $method, [string] $uri) {
    $global:numProbes++    
    Try {
        Invoke-RestMethod -Method $method -Uri "${uri}" -ContentType "application/json" -TimeoutSec $requestTimeoutSec
        log "Probing $method on $uri"
        $global:successfulProbes++
    }
    Catch {
        log "Error {$_}"
    }
}

$startTime = $(get-date)

# Create three polls
$polls = "cars", "pets", "superheroes"
foreach ($poll in $polls) {
    $testUri = "${endpoint}/polls/$poll"
    call -method "POST" -uri $testUri

    #Start-Sleep -Seconds 10

    $testUri = "${endpoint}/polls"
    call -method "GET" -uri $testUri
}

# Random vote among the three polls
for ($i = 0; $i -lt $numVotes; $i++) {
    $poll = Get-Random -Minimum 0 -Maximum 2

    $vote = (-join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_}))
    
    [string]$pollUri = $polls[$poll];

    $testUri = "${endpoint}/api/Votes/$pollUri/$vote"
    call -method "PUT" -uri $testUri

    $testUri = "${endpoint}/api/Votes/$pollUri"
    call -method "GET" -uri $testUri
}

$endTime = $(get-date)
$elapsedTime = $endTime - $startTime
$totalTime = "{0:HH:mm:ss}" -f ([datetime]$elapsedTime.Ticks)
$percentSuccess = $global:successfulProbes * 100.0 / $global:numProbes

log "Run complete ${status}"
log "--------------------------"
log "Start time: ${startTime}"
log "End time: ${endTime}"
log "Total time: ${totalTime}"
log "Total probes: $global:numProbes"
log "Successful probes: $global:successfulProbes"
log "Success %: ${percentSuccess}"