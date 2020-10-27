if ($args.count -ne 1) {
    Write-Host "Missing tag specifier" 
    exit
}

$branch = $args[0].Split("/")
$gitTag = $branch[$branch.count - 1]
$gitBranch = git branch --contains $gitTag

Write-Host "Creating new Release from tag $($gitTag)"
Write-Host "Guessing $($gitBranch) is the git branch"