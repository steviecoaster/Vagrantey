function Stop-VagrantEnvironment {
    <#
    .SYNOPSIS
    Stop a vagrant environment by specifying it's friendly name
    
    .DESCRIPTION
    Reads the backend path to a vagrant directory and stops that environment based on the environment's friendly name
    
    .PARAMETER Environment
    The friendly name of the vagrant environment to stop
    
    .EXAMPLE
    Stop-VagrantEnvironment -Environment CCM
    
    .NOTES
    
    #>
    
    [cmdletBinding()]
    Param(
        [Parameter(Mandatory,Position=0)]
        [ArgumentCompleter(
            {
                param($Command,$Parameter,$WordToComplete,$CommandAst,$FakeBoundParams)
                $r = Get-VagrantConfig
                $results = @($r.psobject.properties.Name)

                If($WordToComplete){
                    $results.Where{$_ -match "^$WordToComplete"}
                }

                Else {

                    $results
                }
            }
        )]
        [String]
        $Environment
    )

    begin {

        $config = Get-VagrantConfig
    }

    process {

        Push-Location "$($config.$Environment)"
        vagrant halt
        Pop-Location

    }

}