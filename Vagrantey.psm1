$files = Get-ChildItem $PSScriptRoot -Recurse -Filter *.ps1


foreach ($file in $files) {

    . $file.Fullname
}

if (!(Test-Path "$(Get-RootPath)\vagrantey\")) {

    $needsConfig = $true
}

else {
    $config = Get-ChildItem "$(Get-RootPath)\vagrantey\" -Filter *.json
}



If (-not $config -or $needsConfig) {
    
    Write-Host -ForegroundColor Green "This appears to be the first time loading this module"
    Write-Host -ForegroundColor Green "Run 'Set-VagrantConfig' to configure vagrant environments"
    Write-Host -ForegroundColor Green "Get-Help Set-VagrantConfig -Examples"
}