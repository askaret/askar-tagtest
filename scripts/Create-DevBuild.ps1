param (
        [Parameter(Mandatory)]
        [string]$Branch
    )

function Read-BranchName {
    param(
        [Parameter(Mandatory)]
        [string]$Branch,
        [Parameter(Mandatory)]
        [string]$Pattern
    )
    $splitBranch = $Branch.Split("/.") | Where-Object {$_}

    foreach($word in $splitBranch) {
        if($word -match $Pattern) {
            $actualBranchName = $word;
            break;
        }
    }
    
    if( $actualBranchName.Length -eq 0) {
        Write-Error "Unable to find a branch name matching '$($Pattern)'"
        throw
    }

    return $actualBranchName
}
function Read-DatabaseNames {
    param(
        [Parameter(Mandatory)]
        [string]$Branch
    )
    $splitBranch = $Branch.Split("/") | Where-Object {$_}
    $databases = $splitBranch[$splitBranch.Length - 1].Split(".") | Where-Object {$_ -NotLike "*dev*"}

    if($databases.Length -eq 0) {
        Write-Warning "The specified branch $($branch) doesn't contain at least one database specifier. Build will be created but without database configuration."
        return ""
    }    

    return $databases
}

Read-BranchName -Branch $Branch -Pattern "dev-"

Read-DatabaseNames -Branch $Branch