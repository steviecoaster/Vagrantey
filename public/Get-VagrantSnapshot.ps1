function Get-VagrantSnapshot {
    [cmdletBinding()]
    [cmdletBinding(DefaultParameterSetName = "BuiltIn")]
    Param(

        [Parameter(Mandatory)]
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
        $Environment
    )

    begin {

        $config = Get-VagrantConfig
    
    }

    process {

        Push-Location "$($config.$Environment)"
        $snapshot = vagrant snapshot list 
        
        if($snapshot -match "No snapshots*"){
            Write-Output "No Snapshots for Environment: $Environment"
        }

        else {

            $snapshot| ForEach-Object {

                [pscustomobject]@{
                    Name = $_
                }
            }
            Pop-Location
            
        }
        
        
    }

}