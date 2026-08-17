@echo off
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo.
  echo Node.js is not installed yet.
  echo Install the LTS version from https://nodejs.org  then double-click this file again.
  echo.
  pause
  exit /b
)
if not exist node_modules (
  echo Installing dependencies for the first time. This can take a minute or two...
  call npm install
)
echo.
echo Starting your local site.
echo When you see "localhost:4321", open that address in your browser.
echo Keep this window open while you work. Close it (or press Ctrl+C) to stop.
echo.
call npm run dev
pause
