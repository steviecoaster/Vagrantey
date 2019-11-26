function Set-VagrantConfig {
    <#
    .SYNOPSIS
    Configure different environments for your system
    
    .DESCRIPTION
    Specify the friendly name of the environment, as well as the Path to the Vagrant File for the environment
    
    .PARAMETER Name
    The friendly name for the environment
    
    .PARAMETER Path
    The path to the vagrant file

    .PARAMETER Config
    The config file to save information into, otherwise uses module default
    
    .EXAMPLE
    Set-VagrantConfig -Name Foo -Path /my/path/to/foo

    .EXAMPLE
    Set-VagrantConfig -Name Foo -Path /my/path/to/foo -Config C:\vagrantey\config.json
    
    .NOTES
    Specifying the actual vagrant file is not necessary. The path is simply the path to where the vagrantfile resides on disk
    #>
    
    [cmdletBinding()]
    Param(
        [Parameter(Mandatory, Position = 0)]
        [String]
        $Name,

        [Parameter(Mandatory, Position = 1)]
        [ValidateScript( { Test-Path $_ })]
        [String]
        $Path,

        [Parameter()]
        [String]
        $Config

    )

    begin {

        if (!$Config) {
        
            if (!(Test-Path "$(Get-RootPath)\vagrantey\VagrantConfig.json")) {
                
                $null = New-Item "$(Get-RootPath)\vagrantey" -ItemType Directory
            
            }

            else {

                $configuration = Get-VagrantConfig
            
            }

        }

        else {
            
            $configuration = Get-VagrantConfig $Config
        
        }

    }

    process {
    
        If ($configuration.$name) {
            $configuration.$Name = $Path
        }
        
        else {

            if ($configuration) {
                $configuration | Add-Member -MemberType NoteProperty -Name $Name -Value $Path
            }

            else {
                $configuration= [pscustomobject]@{ $Name = $Path }
            }
        }
        $configuration | ConvertTo-Json | Set-Content "$(Get-RootPath)\vagrantey\VagrantConfig.json"
    }
}