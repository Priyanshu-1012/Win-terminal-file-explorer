param (
    [Parameter(Mandatory = $true)]
    [string]$Path
)

Set-Location $Path
Write-Host "Path testing $Path"
