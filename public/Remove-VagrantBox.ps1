function Remove-VagrantBox {
    <#
    .SYNOPSIS
    Removes a vagrant box
    
    .DESCRIPTION
    Removes a vagrant box
    
    .PARAMETER Name
    The box you want to remove
    
    .PARAMETER Version
    If a box has multiple versions, you can select what versions to delete with the version flag
    
    .PARAMETER Provider
    The provider-specific box to remove with the given name. This is only required if a box is backed by multiple providers. If there is only a single provider, Vagrant will default to removing it.    
    
    .PARAMETER Force
    Forces removing the box even if an active Vagrant environment is using it
    
    .PARAMETER All
    PIf a box has multiple versions, removes all versions
    
    .EXAMPLE
    Remove-VagrantBox -Name 'bento/ubuntu-18.04'

    .EXAMPLE
    Remove-VagrantBox -Name 'bento/ubuntu-18.04' -Force -All
    
    .NOTES
    
    #>
    
    [cmdletBinding(SupportsShouldProcess, ConfirmImpact = "High")]
    param(
        [Parameter(Mandatory, Position = 0,ValueFromPipeline,ValueFromPipelineByPropertyName)]
        [String]
        $Name,

        [Parameter()]
        [String[]]
        $Version,

        [Parameter()]
        [String]
        $Provider,

        [Parameter()]
        [Switch]
        $Force,

        [Parameter()]
        [Switch]
        $All
    )

    process {

        if ($PSCmdlet.ShouldProcess($Name,"Removing Box")) {
            if ($Version) {
                vagrant box remove $Name --box-version $Version
            }

            elseif ($Force) {
                vagrant box remove $Name --force
            }

            elseif ($All) {
                vagrant box remove $Name --all
            }

            elseif ($Provider) {
                vagrant box remove $Name --provider $Provider
            }

            else {
                vagrant box remove $Name
            }
        }
    }

}