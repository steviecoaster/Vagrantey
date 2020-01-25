function Add-VagrantBox {
    [cmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]
    Param(
        [Parameter()]
        [String]
        $Name,

        [Parameter()]
        [String]
        $Path,

        [Parameter()]
        [String]
        $Version,

        [Parameter()]
        [Switch]
        $Clean,

        [Parameter()]
        [Switch]
        $Force,

        [Parameter()]
        [Switch]
        $Insecure
    )

    process {

        $args = [System.Collections.Generic.List[string]]::new()
        
        if($PSBoundParameters['Name']){
            $args.Add($($PSBoundParameters['Name']))
        }

        if($PSBoundParameters['Path']){
            $args.Add($($PSBoundParameters['Path']))
        }

        if($PSBoundParameters['Version']){
            $args.Add($($PSBoundParameters['Version']).ToString().Replace($($PSBoundParameters['Version'],"--box-version $($PSBoundParameters['Version'])")))
        }

        if($PSBoundParameters['Clean']){
            $args.Add($($PSBoundParameters['Clean'].ToString().Replace('True','--clean')))

        }

        if($PSBoundParameters['Force']){
            $args.Add($($PSBoundParameters['Force'].ToString().Replace('True','--force')))

        }

        If($PSCmdlet.ShouldProcess($Name,"Adding box")){
            vagrant box add $($args -join ' ')
        }

    }
}