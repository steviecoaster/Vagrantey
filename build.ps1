[cmdletBinding()]
Param(
    [Parameter()]
    [Switch]
    $Test,

    [Parameter()]
    [Switch]
    $Build,

    [Parameter()]
    [Switch]
    $Deploy
)

#Make some variables, shall we?
$innvocationPath = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PSModuleRoot = Split-Path -Parent $innvocationPath
$PSModuleRoot
$TestPath = Join-Path $PSModuleRoot "Tests"

#Do Stuff based on passed Args
Switch($true){

    $Test {

        If(-not (Get-Module Pester)){
            Install-Module -Name Pester -SkipPublisherCheck -Force
        }

        Invoke-Pester -Script $TestPath -OutputFile "$($env:Build_ArtifactStagingDirectory)\Vagrantey.Results.xml" -OutputFormat 'NUnitXml'

        #
        Get-ChildItem $env:Build_ArtifactStagingDirectory
    }

    $Build {

        If(Test-Path "$($env:Build_ArtifactStagingDirectory)\Vagrantey"){
            Remove-Item "$($env:Build_ArtifactStagingDirectory)\Vagrantey" -Recurse -Force
        }

        $null = New-Item "$($env:Build_ArtifactStagingDirectory)\Vagrantey" -ItemType Directory

        Get-ChildItem $PSScriptRoot\Public\*.ps1 | Foreach-Object {

            #Get-Content $_.FullName | Add-Content "$($env:Build_ArtifactStagingDirectory)\Vagrantey\Vagrantey.psm1"
            If(!(Test-Path "$($env:Build_ArtifactStagingDirectory)\Vagrantey\public")){
                $null = New-Item "$($env:Build_ArtifactStagingDirectory)\Vagrantey\public" -ItemType Directory
            }
            Copy-Item $_.FullName "$($env:Build_ArtifactStagingDirectory)\Vagrantey\public\"
        }

        Copy-Item "$PSScriptRoot\Vagrantey.psm1" "$($env:Build_ArtifactStagingDirectory)\Vagrantey"
        Copy-Item "$PSScriptRoot\Vagrantey.psd1" "$($env:Build_ArtifactStagingDirectory)\Vagrantey"

        #Verification of contents
        Get-ChildItem -Path "$($env:Build_ArtifactStagingDirectory)\Vagrantey" -Recurse

        #Verify we can load the module and see cmdlets
        Import-Module "$($env:Build_ArtifactStagingDirectory)\Vagrantey\Vagrantey.psd1"
        Get-Command -Module Vagrantey

    }

    $Deploy {

        
        Try {
    
            $deployCommands = @{
                Path = (Resolve-Path -Path "$($env:Build_ArtifactStagingDirectory)\Vagrantey")
                NuGetApiKey = $env:NuGetApiKey
                ErrorAction = 'Stop'
            }
            
            Publish-Module @deployCommands
    
        }

        Catch {

            throw $_
    
        }
    
    }

    default {

        echo "Please Provide one of the following switches: -Test, -Build, -Deploy"
    }

}