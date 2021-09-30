$ErrorActionPreference = 'Stop';
$file = "${env:ProgramFiles(x86)}\Corsair SSD Toolbox\unins000.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  softwareName  = 'Corsair SSD Toolbox*'
  file			= $file
  silentArgs    = "/VERYSILENT"
  validExitCodes= @(0)
}

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
    Uninstall-ChocolateyPackage @packageArgs
  }
  elseif ($key.Count -eq 0) {
	Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
	Write-Warning "$($key.Count) matches found!"
	Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
	Write-Warning "Please alert package maintainer the following keys were matched:"
	$key | % {Write-Warning "- $($_.DisplayName)"}
}