$ErrorActionPreference = 'Stop'

$origin = "theme\Agnoster-Lulz.psm1"
$destination = "$($ThemeSettings.MyThemesLocation)\"

Write-Host "--Lulzphantom's Oh-My-Posh install script--" -BackgroundColor white -ForegroundColor black

$name = Read-Host 'Name to display?'
if (!$name) {
    Write-Error "Display name needed"
    break
}

((Get-Content $origin -Raw) -replace 'displayUserName', $name )| Set-Content $origin

Write-Output "Installing required modules ... "
Install-Module -Name oh-my-posh
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

Write-Output "Setting up prompt"
Set-Prompt
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }

Write-Output "Set-Prompt" | Out-File -Encoding ASCII -Append $PROFILE

Write-Output "Importing modules"
Import-Module posh-git
Import-Module oh-my-posh

if (!(Test-Path -Path $destination )) { New-Item -Type directory -Path $destination -Force }
Copy-Item $origin $destination -Recurse -Force

Set-Theme Agnoster-Lulz

((Get-Content $origin -Raw) -replace $name, 'displayUserName' )| Set-Content $origin

Write-Output "Argnoster-Lulz theme setted"
Write-Output "Please install theme/FiraCodeNerd.ttf font and set in console"
Write-Output "Oh-My-Posh repository: https://github.com/JanDeDobbeleer/oh-my-posh"