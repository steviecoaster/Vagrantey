function Remove-VagrantEnvironment {
    <#
    .SYNOPSIS
    Equivalent to 'vagrant destroy -f'
    
    .DESCRIPTION
    Destroys the specified vagrant environment. (Don't worry, it's -Confirm gated :))
    
    .PARAMETER Environment
    The vagrant environment to destroy
    
    .EXAMPLE
    Remove-VagrantEnvironment -Environment CCM

    This will prompt for confirmation

    .EXAMPLE
    Remove-VagrantEnvironment -Environment CCM -Confirm:$false

    This will destroy the environment without prompting
    
    .NOTES
    
    #>
    
    [cmdletBinding(ConfirmImpact="High",SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory)]
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



        If($PSCmdlet.ShouldProcess($Environment,"Destroy specified environment")){

            Push-Location "$($config.$Environment)"
            Start-Process vagrant -ArgumentList @("destroy","-f") -Wait
            Pop-Location
        }
    }
}