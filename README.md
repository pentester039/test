# File Handling and Duplication System

A Java web application for improved file handling and duplication removal using erasure coding and AES encryption.

## Features

- File upload/download with deduplication
- User registration and authentication
- Admin panel
- File sharing capabilities
- AES encryption
- Erasure coding for data redundancy
- MySQL database backend

## Technology Stack

- **Backend**: Java Servlets, JSP
- **Database**: MySQL
- **Build Tool**: Maven
- **Java Version**: 11
- **Web Container**: Tomcat 9

## Railway Deployment

This application is configured for deployment on Railway cloud platform.

### Prerequisites

1. **Railway Account**: Sign up at [railway.app](https://railway.app)
2. **Git Repository**: Push your code to GitHub/GitLab
3. **MySQL Database**: Set up a MySQL database (Railway provides this)

### Deployment Steps

#### 1. Connect to Railway

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login to Railway
railway login

# Initialize project (if not already done)
railway init
```

#### 2. Set Environment Variables

In Railway dashboard, set these environment variables:

```bash
DB_HOST=your-mysql-host
DB_PORT=3306
DB_NAME=erasurecode
DB_USER=your-username
DB_PASSWORD=your-password
JAVA_VERSION=11
TOMCAT_VERSION=9.0.65
```

#### 3. Deploy

```bash
# Deploy to Railway
railway up

# Or deploy from Railway dashboard by connecting your Git repository
```

#### 4. Database Setup

After deployment, run the SQL script to create tables:

```sql
-- Use the sql.sql file in your project root
-- This will create all necessary tables
```

### Local Development

#### 1. Build the Project

```bash
# Clean and compile
mvn clean compile

# Package as WAR
mvn package

# Run locally (requires Tomcat)
mvn tomcat7:run
```

#### 2. Database Setup

1. Install MySQL
2. Create database: `CREATE DATABASE erasurecode;`
3. Run `sql.sql` script
4. Update database connection in `DatabaseConfig.java` if needed

### Project Structure

```
├── src/java/com/ErasureCode/    # Java source files
├── web/                         # Web resources (JSP, CSS, JS)
├── web/WEB-INF/                 # Web configuration
├── lib/                         # External libraries
├── pom.xml                      # Maven configuration
├── railway.toml                 # Railway configuration
├── nixpacks.toml               # Build configuration
└── sql.sql                     # Database schema
```

### Key Components

- **FileUpload1.java**: Handles file uploads
- **FileDownLoad.java**: Manages file downloads
- **UserRegistrationForm.java**: User registration
- **AdminServlet.java**: Admin functionality
- **DatabaseConfig.java**: Database connection utility

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `DB_HOST` | MySQL host | localhost |
| `DB_PORT` | MySQL port | 3306 |
| `DB_NAME` | Database name | erasurecode |
| `DB_USER` | Database username | root |
| `DB_PASSWORD` | Database password | password |

### Troubleshooting

#### Common Issues

1. **Build Failures**: Ensure Java 11 is installed
2. **Database Connection**: Verify environment variables are set
3. **Port Conflicts**: Railway handles port allocation automatically

#### Logs

```bash
# View Railway logs
railway logs

# View specific service logs
railway logs --service your-service-name
```

### Support

For Railway-specific issues, check:
- [Railway Documentation](https://docs.railway.app)
- [Railway Discord](https://discord.gg/railway)

For application issues, check the logs and ensure all environment variables are properly set.

## License

This project is for educational purposes.
