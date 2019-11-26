function Get-VagrantConfig {
    <#
    .SYNOPSIS
    Returns current configuration for this module
    
    .DESCRIPTION
    Returns the json config file for the module as an object
    
    .PARAMETER Path
    If you store your config outside of the module default, use Path to specify it
    
    .EXAMPLE
    Get-VagrantConfig

    Return default configuration

    .EXAMPLE
    Get-VagrantConfig -Path C:\vagrantey\config.json

    Return the configuration found in C:\vagrantey\config.json
    
    .NOTES
    
    #>
    
    [cmdletBinding()]
    param(
        [Parameter()]
        [String]
        $Path
    )

    process {

        if(!$Path){

            if($PSVersionTable.PSEdition -eq "Desktop"){

                $root = $env:USERPROFILE
            }
            else{
                if ($IsWindows) {
            
                    $root = $env:USERPROFILE
                
                }
                
                if ($IsMacOS) {
                
                    $root = $env:HOME
                
                }
                
                if ($IsLinux) {
    
                    $root = $env:HOME
                
                }

            }
            
            Get-Content "$root\vagrantey\VagrantConfig.json" | ConvertFrom-Json
        }

        else{

            Get-Content $Path | ConvertFrom-Json
            
        }
        
    }

}