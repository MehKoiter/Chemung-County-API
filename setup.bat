@echo off
REM Chemung County Politics API - Quick Setup Script for Windows
REM This script helps set up the development environment quickly

echo 🏛️  Setting up Chemung County Politics API development environment...

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js 18+ first.
    pause
    exit /b 1
)

REM Check if PostgreSQL is installed
psql --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  PostgreSQL is not detected. You may need to install it manually.
)

REM Check if Redis is installed
redis-cli --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  Redis is not detected. You may need to install it manually.
)

echo 📦 Installing dependencies...
npm install

echo 📋 Copying environment file...
if not exist .env (
    copy .env.example .env
    echo ✅ .env file created. Please edit it with your configuration.
) else (
    echo ℹ️  .env file already exists.
)

echo 📁 Creating necessary directories...
if not exist logs mkdir logs
if not exist uploads mkdir uploads
if not exist data mkdir data

echo 🔧 Setting up git hooks...
npm run prepare >nul 2>&1 || echo ℹ️  Husky hooks will be set up after first npm install

echo.
echo 🎉 Setup complete! Next steps:
echo.
echo 1. Edit .env file with your database and API configurations
echo 2. Set up PostgreSQL database:
echo    npm run db:setup
echo 3. Start development server:
echo    npm run dev
echo.
echo 📚 Documentation is available in the docs/ directory
echo 🐛 Report issues at: https://github.com/MehKoiter/Chemung-County-API/issues
echo.
echo Happy coding! 🚀
pause