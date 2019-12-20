function Install-VagrantPlugin {
    <#
    .SYNOPSIS
    Installs the given vagrant plugin
    
    .DESCRIPTION
    Installs the given vagrant plugin
    
    .PARAMETER Plugin
    The plugin to install
    
    .EXAMPLE
    Install-VagrantPlugin -Plugin vagrant-sandbox
    
    .NOTES
    
    #>
    
    [cmdletBinding()]
    Param(
        [Parameter(Mandatory,Position=0,ValueFromPipeline)]
        [ArgumentCompleter(
            {
                param($Command,$Parameter,$WordToComplete,$CommandAst,$FakeBoundParams)
                $results = @((Get-VagrantPlugin).Name)

                If($WordToComplete){
                    $results.Where{$_ -match "^$WordToComplete"}
                }

                Else {

                    $results
                }
            }
        )]
        [String]
        $Plugin
    )

    process {

        vagrant plugin install $Plugin

    }

}