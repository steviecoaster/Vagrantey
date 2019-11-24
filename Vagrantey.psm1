$public = Get-ChildItem $PSScriptRoot\Public -Filter *.ps1
if (!(Test-Path $PSScriptRoot\Config)) {

    $needsConfig = $true
}

else {
    $config = Get-ChildItem $PSScriptRoot\Config -Filter *.json
}

foreach ($file in $public ) {

    . $file.Fullname
}

If (-not $config -or $needsConfig) {
    
    Write-Host -ForegroundColor Green "This appears to be the first time loading this module"
    Write-Host -ForegroundColor Green "Run 'Set-VagrantConfig' to configure vagrant environments"
    Write-Host -ForegroundColor Green "Get-Help Set-VagrantConfig -Examples"
}