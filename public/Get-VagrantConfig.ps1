function Get-VagrantConfig {
    [cmdletBinding()]
    param(
        [Parameter()]
        [String]
        $Path = "$(Split-Path -Parent $PSScriptRoot)\config\VagrantConfig.json"
    )

    process {

        Get-Content $Path | ConvertFrom-Json
    }

}