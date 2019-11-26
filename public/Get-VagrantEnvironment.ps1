function Get-VagrantEnvironment {
    [cmdletBinding()]
    Param()

 

    process {
        $environments = vagrant global-status
        $environments = $environments[2..$($environments.Length-8)]
        Foreach($environment in $environments){

            $null = $environment -match "^(?<id>[\w]+)\s+(?<name>[\w]+)\s+(?<provider>[\w]+)\s+(?<state>[\w]+)\s+(?<path>[\/\-\w]+)"
            
            [pscustomobject]@{
                Id = $matches.id
                Name = $matches.name
                Provider = $matches.provider
                State = $matches.state
                Path = $matches.path
            }
        }
    }
}