$stepName = 'Run Setup.bat'
Write-Output "::group::$stepName"

$enginePath = $Env:ENGINE_PATH
$setupBat = Get-Content $enginePath\Setup.bat
$registerLine = Select-String -Path $enginePath\Setup.bat -Pattern "/register"
$setupBat[$registerLine.LineNumber - 1] = ".\Engine\Binaries\Win64\UnrealVersionSelector-Win64-Shipping.exe /register /unattended"
Out-File -InputObject $setupBat -LiteralPath $enginePath\Setup.bat -Encoding ascii -Force

& "$enginePath\Setup.bat"

Write-Output '::endgroup::'