# 🚂 Railway Quick Start Guide

## ⚡ Fast Deployment (5 minutes)

### 1. **Sign Up & Install**
```bash
# Sign up at railway.app
# Install Railway CLI
npm install -g @railway/cli
```

### 2. **Login & Initialize**
```bash
# Login to Railway
railway login

# Initialize project
railway init
```

### 3. **Deploy**
```bash
# Deploy to Railway
railway up
```

### 4. **Set Database Variables**
In Railway dashboard:
- Go to your project
- Add MySQL database service
- Copy connection details to environment variables:
  ```
  DB_HOST=your-mysql-host
  DB_PORT=3306
  DB_NAME=erasurecode
  DB_USER=your-username
  DB_PASSWORD=your-password
  ```

### 5. **Setup Database**
- Connect to your MySQL database
- Run the `sql.sql` script
- Your app is ready! 🎉

## 🔧 Manual Steps (if scripts don't work)

### Build Locally
```bash
# Install Maven if not installed
# Windows: Download from maven.apache.org
# Mac: brew install maven
# Linux: sudo apt install maven

# Build project
mvn clean package -DskipTests
```

### Deploy Manually
```bash
# Push to GitHub/GitLab
git add .
git commit -m "Ready for Railway deployment"
git push

# Connect repository in Railway dashboard
# Railway will auto-deploy on push
```

## 🚨 Common Issues & Solutions

### Build Fails
- Ensure Java 11+ is installed
- Check Maven installation: `mvn --version`
- Verify `pom.xml` exists

### Database Connection Fails
- Check environment variables in Railway dashboard
- Verify MySQL service is running
- Test connection with `DatabaseConfig.testConnection()`

### App Won't Start
- Check Railway logs: `railway logs`
- Verify start command in `railway.toml`
- Ensure all dependencies are in `pom.xml`

## 📱 Railway Dashboard Features

- **Auto-deploy**: Deploys on every Git push
- **Environment Variables**: Secure storage for secrets
- **Logs**: Real-time application logs
- **Metrics**: CPU, memory, and network usage
- **Custom Domains**: Add your own domain
- **SSL**: Automatic HTTPS certificates

## 🔗 Useful Commands

```bash
# View logs
railway logs

# Open app in browser
railway open

# Check status
railway status

# View variables
railway variables

# Connect to database
railway connect
```

## 💰 Pricing

- **Free Tier**: $5 credit monthly
- **Pay-as-you-use**: Only pay for what you use
- **No hidden fees**: Transparent pricing

## 🆘 Need Help?

- **Railway Docs**: [docs.railway.app](https://docs.railway.app)
- **Discord**: [discord.gg/railway](https://discord.gg/railway)
- **GitHub Issues**: Create issue in your repository

---

**Your app will be live at**: `https://your-app-name.railway.app`

**Happy Deploying! 🚀**
