function Remove-VagrantPlugin {
    <#
    .SYNOPSIS
    Uninstalls the given vagrant plugin
    
    .DESCRIPTION
    Uninstalls the given vagrant plugin
    
    .PARAMETER Plugin
    The plugin to uninstall
    
    .EXAMPLE
    Remove-VagrantPlugin -Plugin vagrant-sandbox
    
    .NOTES
    
    #>
    
    [cmdletBinding(ConfirmImpact="High",SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory,Position=0,ValueFromPipeline,ValueFromPipelineByPropertyName)]
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
        [Alias('Name')]
        $Plugin
    )

    process {

        if($PSCmdlet.ShouldProcess($plugin, "Uninstall specified plugin")){

            vagrant plugin uninstall $Plugin

        }
        
    }

}