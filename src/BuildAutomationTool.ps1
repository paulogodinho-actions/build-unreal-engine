$stepName = 'Building AutomationTool'
Write-Output "::group::$stepName"

$enginePath = $Env:ENGINE_PATH

Push-Location -Path "$enginePath/Engine/Source/Programs/AutomationTool"
Write-Output "Restoring Nuget Packages on $pwd"
dotnet restore
Pop-Location

# TODO Dinamically find MSBuild
$msBuildExe = "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/MSBuild/Current/Bin/MSBuild.exe"
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