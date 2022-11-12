$stepName = 'Building AutomationTool'
Write-Output "::group::$stepName"

$enginePath = $Env:ENGINE_PATH

Push-Location -Path "$enginePath/Engine/Source/Programs/AutomationTool"
Write-Output "Restoring Nuget Packages on $pwd"
dotnet restore
Pop-Location

Write-Output 'Installing VSSetup to Find Visual Studio Installation'
Install-Module VSSetup -Scope CurrentUser -Force
Write-Output 'Installing BuildUtils to Find MSBuild bundled with Visual Studio Installation'
Install-Module BuildUtils -Scope CurrentUser -Force

$msBuildExe = Get-LatestMsbuildLocation
if (Test-Path -Path $msBuildExe -eq $false) {
    $errorMessage = "Could not find MSBuild.exe at $msBuildExe, is Visual Studio properly installed?"
    Write-Error $errorMessage
    throw $errorMessage
}
Write-Output "Found MSBuild.exe at $msBuildExe"

Write-Output "Building: AutomationTool | Development | AnyCPU"
$automationToolParams = @(
    "$enginePath/Engine/Source/Programs/AutomationTool/AutomationTool.csproj",
    "/nologo",
    "/property:Configuration=Development",
    "/property:Platform=AnyCPU",
    "/target:Build"
)
& $msBuildExe $automationToolParams

Write-Output '::endgroup::'