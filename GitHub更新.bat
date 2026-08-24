@echo off
setlocal
cd /d "%~dp0"

set "LOG=%~dp0github_update_log.txt"

echo.>>"%LOG%"
echo ================================>>"%LOG%"
echo %date% %time%>>"%LOG%"
echo ================================>>"%LOG%"

git add -- index.html archive >>"%LOG%" 2>&1
if errorlevel 1 exit /b 1

git diff --cached --quiet
if errorlevel 1 (
    git commit -m "Auto update" >>"%LOG%" 2>&1
    if errorlevel 1 exit /b 1
)

git pull --rebase origin main >>"%LOG%" 2>&1
if errorlevel 1 (
    echo git pull --rebase failed >>"%LOG%"
    exit /b 1
)

git push origin main >>"%LOG%" 2>&1
if errorlevel 1 (
    echo git push failed >>"%LOG%"
    exit /b 1
)

echo GitHub update success >>"%LOG%"
exit /b 0