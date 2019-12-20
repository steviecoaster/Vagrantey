function Get-VagrantPlugin {
    <#
    .SYNOPSIS
    Returns vagrant plugin information
    
    .DESCRIPTION
    Returns all plugins, or the specified plugin
    
    .PARAMETER Plugin
    The plugin to return
    
    .EXAMPLE
    Get-VagrantPlugin

    Returns all plugins and their version

    .EXAMPLE
    Get-VagrantPlugin -Plugin vagrant-yaml

    Returns the information for the vagrant-yaml plugin
    
    .NOTES
    
    #>
    
    [cmdletBinding()]
    Param(
        [Parameter()]
        [String]
        $Plugin
    )

    process {

        $plugins = gem list --remote vagrant-

        if($Plugin){
            $plugins = $plugins | Where-Object { $_ -match "$Plugin" }
        }

        $plugins | ForEach-Object {

            $Name = $_.Split(' ')[0]
            $Version = ($_.split(' ')[1]).Replace('(','').replace(')','')
            [pscustomobject]@{
                Name = $Name
                Version = $Version

            }
        }
    }

}