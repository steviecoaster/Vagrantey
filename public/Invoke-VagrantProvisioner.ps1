function Invoke-VagrantProvisioner {
    <#
    .SYNOPSIS
    Re-runs provisioning against a vagrant environment.
    
    .DESCRIPTION
    If a vagrant box has already been provisioned, forces execution of the specified provisioner(s).
    
    .PARAMETER Environment
    The vagrant environment to re-provision.
    
    .PARAMETER All
    Re-run all defined provisioners in the Vagrantfile of the specified environment.
    
    .PARAMETER Provisioner
    Specific provisioner to execute from the Vagrantfile of the specified environment
    
    .EXAMPLE
    Invoke-VagrantProvisioner -Environment Test -All

    Re-runs all defined provisioners for Test vagrant host.

    .EXAMPLE
    Invoke-VagrantProvisioner -Environment Test -Provisioner Shell

    Re-runs the shell provisioner against the Test vagrant host.
    
    .NOTES
    General notes
    #>
    
    [cmdletBinding()]
    Param(
        [Parameter(Mandatory, Position = 0)]
        [Parameter(Mandatory, ParameterSetName = "All")]
        [Parameter(Mandatory, ParameterSetName = "Specific")]
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

        [Parameter(Mandatory, ParameterSetName = "All")]
        [Switch]
        $All,

        [Parameter(Mandatory, ParameterSetName = "Specific")]
        [ArgumentCompleter(
            {
                param($Command, $Parameter, $WordToComplete, $CommandAst, $FakeBoundParams)
                
                $results = @('File', 'Shell', 'Ansible', 'Ansible_local', 'CFEngine',
                    'Chef_solo', 'Chef_zero', 'Chef_client', 'Chef_apply', 'Docker', 'Puppet',
                    'Puppet_server', 'Salt')

                If ($WordToComplete) {
                    $results.Where{ $_ -match "^$WordToComplete" }
                }

                Else {

                    $results
                }
            }
        )]
        [String]
        $Provisioner
    )

    begin { $config = Get-VagrantConfig }

    process {

        Push-Location "$($config.$Environment)"

        Switch ($PSCmdlet.ParameterSetName) {
            "All" { vagrant provision }
            "Specific" { vagrant provision --provision-with $($Provisioner.ToLower()) }
            default { vagrant provision }
        }

        Pop-Location

    }

}