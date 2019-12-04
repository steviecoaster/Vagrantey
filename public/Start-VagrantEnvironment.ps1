function Start-VagrantEnvironment {
    <#
    .SYNOPSIS
    Start a vagrant environment by specifying it's friendly name
    
    .DESCRIPTION
    Reads the backend path to a vagrant directory and starts that environment based on the environment's friendly name
    
    .PARAMETER Environment
    The friendly name of the vagrant environment to start

    .PARAMETER Name
    Name of host in Vagrantfile to bring online, if multiple are defined in Vagrantfile.

    .PARAMETER Id
    Id of Vagrant environment to start, not tied to Environment parameter.

    .EXAMPLE
    Start-VagrantEnvironment -Environment CCM

    Turn on all hosts defined in the CCM Vagrantfile

    .EXAMPLE
    Start-VagrantEnvironment -Environment CCM -Name client

    Only turn on the client defined in the CCM Vagrantfile

    .EXAMPLE
    Start-VagrantEnvironment -Id a23459ef

    Bring up specified vagrant ID
    
    .NOTES
    
    #>
    
    [cmdletBinding()]
    Param(
        [Parameter(Mandatory,Position=0,ParameterSetName="Environment")]
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

        [Parameter(ParameterSetName="Environment")]
        [String]
        $Name,

        [Parameter(Mandatory,ParameterSetName="Id")]
        [ArgumentCompleter(
            {
                param($Command,$Parameter,$WordToComplete,$CommandAst,$FakeBoundParams)
                $results = @((Get-VagrantEnvironment).Id)

                If($WordToComplete){
                    $results.Where{$_ -match "^$WordToComplete"}
                }

                Else {

                    $results
                }
            }
        )]
        [String]
        $Id



    )

    begin {

        $config = Get-VagrantConfig
    }

    process {

        Switch($PSCmdlet.ParameterSetName) {

            "Environment" {

                Push-Location "$($config.$Environment)"

                if(!$Name) {
                    vagrant up
                }
                
                else {
        
                    vagrant up $Name
        
                }
        
                Pop-Location


            }

            "Id" {

                vagrant up $Id

            }

        }

    }

}