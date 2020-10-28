param (
        [Parameter(Mandatory)]
        [string]$GithubContext
    )

    Write-Host $GithubContext

    $jsonContext = ConvertTo-Json -InputObject $GithubContext -Depth 10

    Write-Host $jsonContext
