function Remove-VagrantSnapshot {
    <#
    .SYNOPSIS
    Deletes a Vagrant snapshot
    
    .DESCRIPTION
    Deletes a Vagrant snapshot
    
    .PARAMETER Environment
    The Environment from which to delete a snapshot
    
    .PARAMETER Name
    The friendly name of the snapshot to delete, if any
    
    .PARAMETER UseSahara
    Use Sahara plugin
    
    .EXAMPLE
    Remove-VagrantSnapshot -Environment MyAwesomeVM

    .EXAMPLE
    Remove-VagrantSnapshot -Environment MyAwesomeVM -Name Test

    .EXAMPLE
    Remove-VagrantSnapshot -Environment MyAwesomeVM -UseSahara
    
    .NOTES
   
    #>
    
    [cmdletBinding(DefaultParameterSetName="BuiltIn")]
    Param(

        [Parameter(Mandatory)]
        [Parameter(ParameterSetName = "BuiltIn")]
        [Parameter(ParameterSetName = "Sahara")]
        [ArgumentCompleter(
            {
                param($Command, $Parameter, $WordToComplete, $CommandAst, $FakeBoundParams)
                $r = Get-VagrantConfig
                $results = @($r.psobject.properties.Name)

                If ($WordToComplete) {
                    $results.Where{ $_ -match "^$WordToComplete" }
                }

                Else {

                    $results
                }
            }
        )]
        [String]
        $Environment,

        [Parameter(ParameterSetName = "BuiltIn")]
        [String]
        $Name,

        [Parameter(ParameterSetName = "Sahara")]
        [Switch]
        $UseSahara
    )

    begin {

        $config = Get-VagrantConfig

    }

    process {

            switch($PSCmdlet.ParameterSetName){
                "BuiltIn" {
                    Push-Location "$($config.$Environment)"
                    if (!$Name) {

                        vagrant snapshot pop

                    }
        
                    else {
        
                        vagrant snapshot delete $Name

                    }

                }

                "Sahara" {

                    if (-not (Get-VagrantPlugin -Installed | Where-Object { $_.Name -match 'sahara' })) {
                        throw "Sahara plugin not installed."
                    }
        
                    Push-Location "$($config.$Environment)"
                    vagrant sandbox rollback
                    Pop-Location
                }
            }


    }


}