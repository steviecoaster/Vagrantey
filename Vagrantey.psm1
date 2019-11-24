$public = Get-ChildItem $PSScriptRoot\Public -Filter *.ps1

if ($IsWindows) {
            
    $root = $env:USERPROFILE

}

if ($IsMacOS) {

    $root = $env:HOME

}

if ($IsLinux) {

    $root = $env:HOME

}

if (!(Test-Path "$root\vagrantey\")) {

    $needsConfig = $true
}

else {
    $config = Get-ChildItem "$root\vagrantey\" -Filter *.json
}

foreach ($file in $public ) {

    . $file.Fullname
}

If (-not $config -or $needsConfig) {
    
    Write-Host -ForegroundColor Green "This appears to be the first time loading this module"
    Write-Host -ForegroundColor Green "Run 'Set-VagrantConfig' to configure vagrant environments"
    Write-Host -ForegroundColor Green "Get-Help Set-VagrantConfig -Examples"
}