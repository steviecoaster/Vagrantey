function Get-VagrantBox {
<#
.SYNOPSIS
Returns information about installed Vagrant boxes

.DESCRIPTION
Vagrant boxes are pre-built base images available to be customized via a VagrantFile to suit your particular testing/use needs.
This cmdlet queries your installed boxes and provides information about them

.EXAMPLE
Get-VagrantBox

.NOTES

#>

    [cmdletBinding()]
    Param()

    process {

        $outdated = vagrant box outdated --global

        $UpToDate = "\*\s'(?<name>[\w\-\/.]+)'\s\w+\s'(?<provider>[\w]+)'\s\((?<version>[\w.]+)\)"
        $OutDatedMatch = "\*\s'(?<name>[\w\-\/.]+)'\s\w+\s'(?<provider>[\w]+)'\s\w+\s\w+!\s\w+:\s(?<current>\d+.\d+.\d+).\s+Latest:\s(?<latest>\d+.\d+.\d+)"

        $outdated | ForEach-Object {
            If ($_ -match $UpToDate) {
        
                $hash = @{
                    Name          = $matches.name
                    Provider      = $matches.provider
                    Version       = $matches.version
                    LatestVersion = $true
                }

                [pscustomobject]$hash
        
            }

            ElseIf ($_ -match $OutDatedMatch) {
                $hash = @{
                    Name          = $matches.name
                    Provider      = $matches.provider
                    Version       = $matches.current
                    LatestVersion = $matches.latest
                }

                [pscustomobject]$hash
            }
        }
    }
}