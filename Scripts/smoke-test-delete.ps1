<#
.SYNOPSIS 
Tests the end to end functionality of the Exchange app.
.DESCRIPTION
This script tests the end to end functionality of the Exchange app by creating 2 users and 'n' orders. It then tests that the 'n' orders are successfully recored in the trade store.
.PARAMETER Domain
The fully qualified domain and reverse proxy port to contact the application i.e. myname.westeurope.cloudapp.azure.com:80
.PARAMETER requestTimeoutSec
Timeout for HTTP requests to the service
.EXAMPLE
. Scripts\smoke-test-delete.ps1
#>
Param(
    [string]
    $domain = "localhost:8080",
    [int]
    $numVotes = 100,
    [int]
    $requestTimeoutSec = 20
)

$endpoint = "http://${domain}/api/votes"

function log {
    Param ([string] $message)
    $time = (Get-Date).ToString('MM/dd/yyyy hh:mm:ss tt')
    Write-Host "[${time}] ${message}"
}

$startTime = $(get-date)

$maxDeletes = 10
$successfulDeletes = 0

for ($i = 0; $i -lt $maxDeletes; $i++) {   
    $uri = "${endpoint}/item${i}"
    Try {
        Invoke-RestMethod -Method Delete -Uri "${uri}" -ContentType "application/json" -TimeoutSec $requestTimeoutSec
        log "Deleted item${i}"
        $successfulDeletes = $successfulDeletes + 1
    }
    Catch {
        log "Error deleting item{$_}"
##        throw $_
    }
}


$endTime = $(get-date)
$elapsedTime = $endTime - $startTime
$totalTime = "{0:HH:mm:ss}" -f ([datetime]$elapsedTime.Ticks)
$percentSuccess = $successfulDeletes * 100.0 / $maxDeletes

log "Run complete ${status}"
log "--------------------------"
log "Start time: ${startTime}"
log "End time: ${endTime}"
log "Total time: ${totalTime}"
log "Items deleted: ${successfulDeletes}"
log "Success %: ${percentSuccess}"