function Install-Vagrant {

    [cmdletBinding()]
    Param()

    process {

        if((Get-Command choco)){

            choco install vagrant
        }

        else {

            if($isWindows){

            }

            if($isLinux){

            }

            if*
        }
    }
}