function Get-VagrantConfig {
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