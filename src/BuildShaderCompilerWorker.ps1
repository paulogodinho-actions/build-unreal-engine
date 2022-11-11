$stepName = 'Building ShaderCompileWorker'
Write-Output "::group::$stepName"

$enginePath = $Env:ENGINE_PATH
& "$enginePath/Engine/Build/BatchFiles/Build.bat" ShaderCompileWorker Win64 Development -WaitMutex -FromMsBuild -2019

Write-Output '::endgroup::'