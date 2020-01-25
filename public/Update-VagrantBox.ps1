function Update-VagrantBox {
    <#
    .SYNOPSIS
    Update vagrant box versions
    
    .DESCRIPTION
    Update-VagrantBox is a cmdlet which enables the ability to update installed vagrant boxes
    
    .PARAMETER Box
    The box you wish to update
    
    .PARAMETER Environment
    Alternatively, you can update the boxes associated with a specific environment
    
    .EXAMPLE
    Update-VagrantBox -Box 'myfancybox/win2019'

    .EXAMPLE
    Update-VagrantBox -Environment 'MyTestLair'

    .EXAMPLE
    Get-VagrantBox | Where-Object { $_.Name -eq 'foo' } | Update-VagrantBox
    
    .NOTES
    This can be a a SLOW process, if you are on a weak internet connection.
    #>
    
    [cmdletBinding(DefaultParameterSetName = "Box")]
    param(
        [Parameter(Mandatory, ParameterSetName = "Box",ValueFromPipeline,ValueFromPipelineByPropertyName)]
        [String]
        [Alias('Name')]
        $Box,

        [Parameter(ParameterSetName = "Environment",ValueFromPipeline)]
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

    process {

        switch ($PSCmdlet.ParameterSetName) {


            "Box" {
                vagrant box update --box $Box

            }

            "Environment" {
                Push-Location "$($config.$Environment)"
                vagrant box update
                Pop-Location

            }

        }
        
    }

}