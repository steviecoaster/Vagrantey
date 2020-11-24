function Get-VagrantEnvironment {
    <#
    .SYNOPSIS
    Returns information on all vagrant environments on a system
    
    .DESCRIPTION
    Wraps the vagrant global-status tool to provide powershell-friendly output
    
    .EXAMPLE
    Get-VagrantEnvironment

    Returns all environments
    
    .NOTES
    
    #>
    
    [cmdletBinding()]
    Param(
        [switch]
        $All
    )

    process {
        $command = 'status'
        $extraLines = 4
        if($All){
            $command = 'global-status'
            $extraLines = 8
        }
        $environments = & vagrant $command
        $environments = $environments[2..$($environments.Length - $extraLines)]
        Foreach($environment in $environments){

            # This is global-status environments
            if($environment -match "^(?<id>[\w]+)\s+(?<name>[\w\-._]+)\s+(?<provider>[\w]+)\s+(?<state>[\w]+)\s+(?<path>[\/\-\w:]+)"){
                [pscustomobject]@{
                    Id = $matches.id
                    Name = $matches.name
                    Provider = $matches.provider
                    State = $matches.state
                    Path = $matches.path
                }
            
            }
            # This is status environments
            if($environment -match "^(?<name>[\w\-._]+)\s+(?<state>[\w]+)\s+\((?<provider>[\w]+)\)"){
                [pscustomobject]@{
                    Name = $matches.name
                    Provider = $matches.provider
                    State = $matches.state
                }
            
            }
            
        }
    }

}
