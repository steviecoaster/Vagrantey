function Restore-VagrantSnapshot {
    <#
    .SYNOPSIS
    Restores a vagrant snapshot
    
    .DESCRIPTION
        Restores a vagrant snapshot
    
    .PARAMETER Environment
    The vagrant environment to restore
    
    .PARAMETER Name
    If given, restores the provided friendly-named snapshot
    
    .EXAMPLE
    Restore-VagrantSnapshot -Environment MyAwesomeVM

    .EXAMPLE
    Restore-VagrantSnapshot -Environment MyAwesomeVM -Name TestSnappy
    
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
        $Environment,

        [Parameter(Position=1)]
        [String]
        $Name
    )

    begin {

        $config = Get-VagrantConfig
    
    }

    process {

        if(!$Name){
        Push-Location "$($config.$Environment)"
        vagrant snapshot pop
        Pop-Location
        }

        else{
            Push-Location "$($config.$Environment)"
            vagrant snapshot restore $Name
            Pop-Location
            
        }

    }
}