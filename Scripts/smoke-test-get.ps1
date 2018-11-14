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
. Scripts\smoke-test-get.ps1
#>
Param(
    [string]
    $domain = "localhost:8080",
    [int]
    $requestTimeoutSec = 20
)

$endpoint = "http://${domain}/api/votes"

Try {
    Invoke-RestMethod -Method Get -Uri "${endpoint}" -ContentType "application/json" -TimeoutSec $requestTimeoutSec
}
Catch {
    throw $_
}
