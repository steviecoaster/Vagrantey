function Get-VagrantPlugin {
    <#
    .SYNOPSIS
    Returns vagrant plugin information
    
    .DESCRIPTION
    Returns all plugins, or the specified plugin
    
    .PARAMETER Plugin
    The plugin to return

    .PARAMETER Installed
    Returns all installed Vagrant Plugins
    
    .EXAMPLE
    Get-VagrantPlugin

    Returns all plugins and their version

    .EXAMPLE
    Get-VagrantPlugin -Plugin vagrant-yaml

    .EXAMPLE
    Get-VagrantPlugin -Installed

    Returns the information for the vagrant-yaml plugin
    
    .NOTES
    
    #>
    
    [cmdletBinding()]
    Param(
        [Parameter()]
        [String]
        $Plugin,

        [Parameter()]
        [Switch]
        $Installed
    )

    process {

        $plugins = gem list --remote vagrant-

        if ($Plugin) {
            $plugins = $plugins | Where-Object { $_ -match "$Plugin" }
        }

        If ($Installed) {

            $installedPlugins = vagrant plugin list

            $installedPlugins | ForEach-Object {

                $Name = $_.Split(' ')[0]
                $Version = ($_.SPlit(' ')[1].Replace('(', '').Replace(',',''))
                $Scope = ($_.Split(' ')[2].Replace(')',''))

                [pscustomobject]@{
                    Name = $Name
                    Version = $Version
                    Scope = $Scope
                }

            }

        }

        Else {
        
            $plugins | ForEach-Object {

                $Name = $_.Split(' ')[0]
                $Version = ($_.split(' ')[1]).Replace('(', '').replace(')', '')
                [pscustomobject]@{
                    Name    = $Name
                    Version = $Version

                }
            }

        }
    }

}