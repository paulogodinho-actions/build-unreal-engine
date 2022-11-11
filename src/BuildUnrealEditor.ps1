$stepName = 'Building UnrealEngine'
Write-Output "::group::$stepName"

$enginePath = $Env:ENGINE_PATH

$buildBat = "$enginePath/Engine/Build/BatchFiles/Build.bat"
$buildEngineParams = @('UnrealEditor', 'Win64', 'Development', '-WaitMutex', '-FromMsBuild', '-2019')
Write-Output "Run Build Bat"
& $buildBat $buildEngineParams

Write-Output '::endgroup::'