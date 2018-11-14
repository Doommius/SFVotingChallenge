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
    $domain = "localhost:8080",
    [int]
    $numVotes = 250,
    [int]
    $requestTimeoutSec = 1
)

$endpoint = "http://${domain}/api/votes"

function log {
    Param ([string] $message)
    $time = (Get-Date).ToString('MM/dd/yyyy hh:mm:ss tt')
    Write-Host "[${time}] ${message}"
}

$startTime = $(get-date)

$successfulVotes = 0

for ($i = 0; $i -lt $numVotes; $i++) {   
    $index = (Get-Random -Minimum 0 -Maximum 9)
    $uri = "${endpoint}/item${index}"
    Try {
        Invoke-RestMethod -Method Put -Uri "${uri}" -ContentType "application/json" -TimeoutSec $requestTimeoutSec
        log "Voted for item${index}"
        $successfulVotes = $successfulVotes + 1
    }
    Catch {
        log "Error creating item {$_}"
##        throw $_
    }
}

$endTime = $(get-date)
$elapsedTime = $endTime - $startTime
$totalTime = "{0:HH:mm:ss}" -f ([datetime]$elapsedTime.Ticks)
$percentSuccess = $successfulVotes * 100.0 / $numVotes

log "Run complete ${status}"
log "--------------------------"
log "Start time: ${startTime}"
log "End time: ${endTime}"
log "Total time: ${totalTime}"
log "Total votes: ${numVotes}"
log "Successful votes: ${successfulVotes}"
log "Success %: ${percentSuccess}"