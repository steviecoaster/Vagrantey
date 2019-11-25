function Get-RootPath {

    if($PSVersionTable.PSEdition -eq "Desktop"){

        $root = $env:USERPROFILE
    }
    else{
        if ($IsWindows) {
    
            $root = $env:USERPROFILE
        
        }
        
        if ($IsMacOS) {
        
            $root = $env:HOME
        
        }
        
        if ($IsLinux) {

            $root = $env:HOME
        
        }

    }

    $root
}