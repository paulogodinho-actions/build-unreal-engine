$stepName = 'Run GenerateProjectFiles.bat'
Write-Output "::group::$stepName"

$enginePath = $Env:ENGINE_PATH
& "$enginePath\GenerateProjectFiles.bat"

Write-Output '::endgroup::'