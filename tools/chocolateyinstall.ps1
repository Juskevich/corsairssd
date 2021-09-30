$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$setupName	= 'CSSDT_1.2.6.1_WIN.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://downloads.corsair.com/Files/SSD/CSSDT_1.2.6.1_WIN.zip'
  softwareName  = 'Corsair SSD Toolbox*'
  checksum      = '63B81A9FFD851BD45C051B244AC6648BA40EEE59FCD87451DEAA22AFD70249CB'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
}


Install-ChocolateyZipPackage @packageArgs
$packageArgs.file = Join-Path -Path $toolsDir -ChildPath $setupName
Install-ChocolateyInstallPackage @packageArgs



















