@echo off
REM Railway Deployment Script for File Handling and Duplication System
REM This script automates the deployment process to Railway

echo 🚂 Railway Deployment Script for File Handling and Duplication System
echo ================================================================

REM Check if Railway CLI is installed
railway --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Railway CLI not found. Installing...
    npm install -g @railway/cli
) else (
    echo ✅ Railway CLI found
)

REM Check if user is logged in
railway whoami >nul 2>&1
if %errorlevel% neq 0 (
    echo 🔐 Please login to Railway...
    railway login
) else (
    echo ✅ Already logged in to Railway
)

REM Build the project
echo 🔨 Building project with Maven...
mvn --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Maven not found. Please install Maven first.
    pause
    exit /b 1
)

mvn clean package -DskipTests
if %errorlevel% equ 0 (
    echo ✅ Build successful
) else (
    echo ❌ Build failed
    pause
    exit /b 1
)

REM Check if project is initialized
if not exist ".railway" (
    echo 🚀 Initializing Railway project...
    railway init
)

REM Deploy to Railway
echo 🚀 Deploying to Railway...
railway up

echo ✅ Deployment completed!
echo.
echo 📋 Next steps:
echo 1. Set up MySQL database in Railway dashboard
echo 2. Configure environment variables:
echo    - DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD
echo 3. Run the SQL script (sql.sql) in your database
echo 4. Your app will be available at the Railway URL
echo.
echo 🔗 Useful commands:
echo   - View logs: railway logs
echo   - Open app: railway open
echo   - View status: railway status

pause
