function New-VagrantSnapshot {
    <#
    .SYNOPSIS
    Create a snapshot of a Vagrant VM
    
    .DESCRIPTION
    Snapshots a Vagrant VM using either built-in tooling, or the Sahara plugin
    
    .PARAMETER Environment
    The Vagrant Environment to snapshot
    
    .PARAMETER Name
    If desired, give the snapshot a friendly name, otherwise a random name will be given by vagrant
    
    .PARAMETER UseSahara
    Force the use of the Sahara plugin
    
    .EXAMPLE
    New-VagrantSnapshot -Environment MyAwesomeEnv

    .EXAMPLE
    New-VagrantSnapshot -Environment MyAwesomeEnv -UseSahara

    .EXAMPLE
    New-VagrantSnapshot -Environment MyAwesomeEnv -Name TestSnapshot
    
    .NOTES
    General notes
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

        switch ($PSCmdlet.ParameterSetName) {

            "Sahara" {
                
                if (-not (Get-VagrantPlugin -Installed | Where-Object { $_.Name -match 'sahara' })) {
                    throw "Sahara plugin not installed."
                }
    
                Push-Location "$($config.$Environment)"
                vagrant sandbox on
                Pop-Location

            }

            "BuiltIn" {
                
                Push-Location "$($config.$Environment)"
                if (!$Name) {
                    vagrant snapshot push
                }
    
                else {
    
                    vagrant snapshot save $Name
                }
                
            }
        }

    }

}