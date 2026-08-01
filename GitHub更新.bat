@echo off

cd /d "C:\Users\aoaoa\OneDrive\ドキュメント\shop_items"

git add .

git diff --cached --quiet
if %ERRORLEVEL%==0 exit /b 0

git commit -m "Auto update"

git push