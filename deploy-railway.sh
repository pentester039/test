#!/bin/bash

# Railway Deployment Script for File Handling and Duplication System
# This script automates the deployment process to Railway

echo "🚂 Railway Deployment Script for File Handling and Duplication System"
echo "================================================================"

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI not found. Installing..."
    npm install -g @railway/cli
else
    echo "✅ Railway CLI found"
fi

# Check if user is logged in
if ! railway whoami &> /dev/null; then
    echo "🔐 Please login to Railway..."
    railway login
else
    echo "✅ Already logged in to Railway"
fi

# Build the project
echo "🔨 Building project with Maven..."
if command -v mvn &> /dev/null; then
    mvn clean package -DskipTests
    if [ $? -eq 0 ]; then
        echo "✅ Build successful"
    else
        echo "❌ Build failed"
        exit 1
    fi
else
    echo "❌ Maven not found. Please install Maven first."
    exit 1
fi

# Check if project is initialized
if [ ! -f ".railway" ]; then
    echo "🚀 Initializing Railway project..."
    railway init
fi

# Deploy to Railway
echo "🚀 Deploying to Railway..."
railway up

echo "✅ Deployment completed!"
echo ""
echo "📋 Next steps:"
echo "1. Set up MySQL database in Railway dashboard"
echo "2. Configure environment variables:"
echo "   - DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD"
echo "3. Run the SQL script (sql.sql) in your database"
echo "4. Your app will be available at the Railway URL"
echo ""
echo "🔗 Useful commands:"
echo "  - View logs: railway logs"
echo "  - Open app: railway open"
echo "  - View status: railway status"
