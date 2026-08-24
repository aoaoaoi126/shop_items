@echo off
cd /d "%~dp0"

git add -- index.html archive
if errorlevel 1 exit /b 1

git diff --cached --quiet
if errorlevel 1 (
    git commit -m "Auto update"
    if errorlevel 1 exit /b 1
)

git push
exit /b %ERRORLEVEL%