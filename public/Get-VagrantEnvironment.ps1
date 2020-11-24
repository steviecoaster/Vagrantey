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
        if ($All) {
            $environments = vagrant global-status
        
            $environments = $environments[2..$($environments.Length - 8)]
            Foreach ($environment in $environments) {

                if ($environment -match "^(?<id>[\w]+)\s+(?<name>[\w\-._]+)\s+(?<provider>[\w]+)\s+(?<state>[\w]+)\s+(?<path>[\/\-\w:]+)") {
                    [pscustomobject]@{
                        Id       = $matches.id
                        Name     = $matches.name
                        Provider = $matches.provider
                        State    = $matches.state
                        Path     = $matches.path
                    }
            
                }
                
            }
        }
        else {
            $environments = vagrant status
            
            $environments = $environments[2..$($environments.Length - 4)]
            
            foreach($environment in $environments){
                if ($environment -match "^(?<name>[\w\-._]+)\s+(?<state>[\w]+)\s+\((?<provider>[\w]+)\)") {
                    [pscustomobject]@{
                        Name     = $matches.name
                        Provider = $matches.provider
                        State    = $matches.state
                    }
            
                }
            }
        }
    }

}
