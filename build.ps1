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

        Invoke-Pester -Script $TestPath -OutputFile "$($env:Build_ArtifactStagingDirectory)\PSVagrant.Results.xml" -OutputFormat 'NUnitXml'

        #
        Get-ChildItem $env:Build_ArtifactStagingDirectory
    }

    $Build {

        If(Test-Path "$($env:Build_ArtifactStagingDirectory)\PSVagrant"){
            Remove-Item "$($env:Build_ArtifactStagingDirectory)\PSVagrant" -Recurse -Force
        }

        $null = New-Item "$($env:Build_ArtifactStagingDirectory)\PSVagrant" -ItemType Directory

        Get-ChildItem $PSScriptRoot\Public\*.ps1 | Foreach-Object {

            #Get-Content $_.FullName | Add-Content "$($env:Build_ArtifactStagingDirectory)\PSVagrant\PSVagrant.psm1"
            Copy-Item $_.FullName "$($env:Build_ArtifactStagingDirectory)\PSVagrant\public"
        }

        Copy-Item "$PSScriptRoot\PSVagrant.psm1" "$($env:Build_ArtifactStagingDirectory)\PSVagrant"
        Copy-Item "$PSScriptRoot\PSVagrant.psd1" "$($env:Build_ArtifactStagingDirectory)\PSVagrant"

        #Verification of contents
        Get-ChildItem -Path "$($env:Build_ArtifactStagingDirectory)\PSVagrant" -Recurse

        #Verify we can load the module and see cmdlets
        Import-Module "$($env:Build_ArtifactStagingDirectory)\PSVagrant\PSVagrant.psd1"
        Get-Command -Module PSVagrant

    }

    $Deploy {

        
        Try {
    
            $deployCommands = @{
                Path = (Resolve-Path -Path "$($env:Build_ArtifactStagingDirectory)\PSVagrant")
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