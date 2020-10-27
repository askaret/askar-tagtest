param (
        [Parameter(Mandatory)]
        [string]$Tag,
        [Parameter(Mandatory)]
        [string]$Branch
    )

Write-Host "Creating release $($Tag) from branch $($Branch)"
