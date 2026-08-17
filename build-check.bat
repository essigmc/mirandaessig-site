@echo off
cd /d "%~dp0"
echo Building the production version of your site...
echo.
call npm run build
echo.
echo If you see "Complete!" above and no red errors, it built fine and is safe to push.
pause
