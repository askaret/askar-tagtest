if ($args.count -ne 1) {
    Write-Host "Missing branch specifier" 
    exit
}

$branch = $args[0].Split("/")

Write-Host "This argument was passed iun $($args)"

foreach($word in $branch) {
    Write-Host $word
}
