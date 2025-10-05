#!/bin/bash

# Chemung County Politics API - Quick Setup Script
# This script helps set up the development environment quickly

echo "🏛️  Setting up Chemung County Politics API development environment..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

# Check if PostgreSQL is installed
if ! command -v psql &> /dev/null; then
    echo "⚠️  PostgreSQL is not detected. You may need to install it manually."
fi

# Check if Redis is installed
if ! command -v redis-cli &> /dev/null; then
    echo "⚠️  Redis is not detected. You may need to install it manually."
fi

echo "📦 Installing dependencies..."
npm install

echo "📋 Copying environment file..."
if [ ! -f .env ]; then
    cp .env.example .env
    echo "✅ .env file created. Please edit it with your configuration."
else
    echo "ℹ️  .env file already exists."
fi

echo "📁 Creating necessary directories..."
mkdir -p logs uploads data

echo "🔧 Setting up git hooks..."
npm run prepare 2>/dev/null || echo "ℹ️  Husky hooks will be set up after first npm install"

echo ""
echo "🎉 Setup complete! Next steps:"
echo ""
echo "1. Edit .env file with your database and API configurations"
echo "2. Set up PostgreSQL database:"
echo "   npm run db:setup"
echo "3. Start development server:"
echo "   npm run dev"
echo ""
echo "📚 Documentation is available in the docs/ directory"
echo "🐛 Report issues at: https://github.com/MehKoiter/Chemung-County-API/issues"
echo ""
echo "Happy coding! 🚀"