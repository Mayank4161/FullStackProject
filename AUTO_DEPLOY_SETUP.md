# Automatic Deployment Setup Guide

## 🚀 Quick Start

### Option 1: Using PowerShell Script (Recommended for Windows)
```powershell
# Run the PowerShell script
.\auto-deploy.ps1
```

### Option 2: Using Batch Script
```cmd
# Run the batch script
auto-deploy.bat
```

### Option 3: Manual Maven Commands
```bash
# Start the application
mvn tomcat7:run

# In another terminal, for hot reload
mvn compile war:exploded
```

## 📋 Prerequisites

### 1. Install Maven
- Download from: https://maven.apache.org/download.cgi
- Add to PATH environment variable
- Verify installation: `mvn -version`

### 2. Java 8 or Higher
- Download from: https://adoptium.net/
- Set JAVA_HOME environment variable
- Verify installation: `java -version`

### 3. MySQL Database
- Ensure MySQL is running
- Database `companywebappnew` exists
- Admin table is created (run `admin_setup.sql`)

## 🔧 Configuration Files

### 1. Maven Configuration (`pom.xml`)
- ✅ Tomcat plugin configured
- ✅ Hot reload enabled
- ✅ Automatic resource copying

### 2. Tomcat Context (`src/main/webapp/META-INF/context.xml`)
- ✅ `reloadable="true"` - enables automatic reloading
- ✅ File watching configured
- ✅ Database connection pool

### 3. Database Properties (`src/main/resources/db.properties`)
- ✅ Connection settings configured
- ✅ Matches your MySQL setup

## 🎯 How Automatic Deployment Works

### Hot Reload Types

#### 1. **JSP Files** (Instant Reload)
- Changes to `.jsp` files are detected immediately
- No server restart required
- Refresh browser to see changes

#### 2. **Static Resources** (CSS/JS/Images)
- Changes to files in `src/main/webapp/assets/` are detected
- Browser cache refresh may be needed
- Use Ctrl+F5 for hard refresh

#### 3. **Java Classes** (Requires Restart)
- Changes to servlets require server restart
- Use `mvn compile` then restart
- Or use the "Clean build and restart" option

#### 4. **Configuration Files**
- `web.xml` changes require restart
- `context.xml` changes are detected automatically

## 🛠️ Development Workflow

### 1. **Start Development Server**
```powershell
.\auto-deploy.ps1
```
- Choose option 1 to start Tomcat
- Server runs on http://localhost:8080/CompanyWebAppNew/

### 2. **Make Changes**
- Edit JSP files → **Instant reload**
- Edit CSS/JS files → **Browser refresh needed**
- Edit Java files → **Restart required**

### 3. **Hot Reload (JSP Changes)**
```powershell
# In the script menu, choose option 1
# Or manually:
mvn compile war:exploded
```

### 4. **Full Restart (Java Changes)**
```powershell
# In the script menu, choose option 2
# Or manually:
mvn clean compile tomcat7:run
```

## 📁 File Structure for Hot Reload

```
CompanyWebAppNew/
├── src/main/webapp/
│   ├── *.jsp                    # ✅ Hot reload
│   ├── assets/
│   │   ├── css/*.css           # ✅ Hot reload
│   │   ├── js/*.js             # ✅ Hot reload
│   │   └── images/*            # ✅ Hot reload
│   └── admin/
│       └── *.jsp               # ✅ Hot reload
├── src/main/java/
│   └── com/companywebappnew/
│       └── servlets/*.java     # ⚠️ Restart required
└── src/main/resources/
    └── db.properties           # ⚠️ Restart required
```

## 🔍 Troubleshooting

### Common Issues

#### 1. **Port 8080 Already in Use**
```bash
# Find process using port 8080
netstat -ano | findstr :8080

# Kill the process
taskkill /PID <process_id> /F
```

#### 2. **Maven Not Found**
- Add Maven to PATH environment variable
- Restart command prompt/PowerShell
- Verify: `mvn -version`

#### 3. **Database Connection Failed**
- Check MySQL is running
- Verify database credentials in `db.properties`
- Ensure database `companywebappnew` exists

#### 4. **Changes Not Reflecting**
- **JSP files**: Refresh browser (F5)
- **CSS/JS**: Hard refresh (Ctrl+F5)
- **Java files**: Restart server
- **Static files**: Clear browser cache

#### 5. **Build Errors**
```bash
# Clean and rebuild
mvn clean compile

# Check for compilation errors
mvn compile -X
```

### Debug Mode

#### Enable Detailed Logging
```bash
# Run with debug output
mvn tomcat7:run -X

# Or add to pom.xml
<configuration>
    <systemProperties>
        <property>
            <name>org.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH</name>
            <value>true</value>
        </property>
    </systemProperties>
</configuration>
```

## 🎨 Development Tips

### 1. **Browser Developer Tools**
- Use F12 to open developer tools
- Disable cache in Network tab for development
- Use "Disable cache" option

### 2. **IDE Integration**
- **VS Code**: Install Java extensions
- **Eclipse**: Use Maven integration
- **IntelliJ**: Built-in Tomcat support

### 3. **File Watching**
- Most IDEs can auto-save files
- Enable "Auto-save" in your editor
- Use file watchers for automatic deployment

### 4. **Database Changes**
- Use a database migration tool
- Keep SQL scripts in version control
- Test database changes in development first

## 🚀 Production Deployment

### For Production
1. **Disable hot reload**: Set `reloadable="false"` in context.xml
2. **Use proper database connection pooling**
3. **Enable HTTPS**
4. **Set appropriate session timeout**
5. **Configure logging properly**

### Build for Production
```bash
# Create production WAR file
mvn clean package

# Deploy to production Tomcat
# Copy target/CompanyWebAppNew-1.0-SNAPSHOT.war to webapps/
```

## 📞 Support

### Quick Commands Reference
```bash
# Start server
mvn tomcat7:run

# Hot reload
mvn compile war:exploded

# Clean build
mvn clean compile

# Package for deployment
mvn clean package

# Run tests
mvn test
```

### Useful URLs
- **Application**: http://localhost:8080/CompanyWebAppNew/
- **Admin Login**: http://localhost:8080/CompanyWebAppNew/admin/login.jsp
- **Tomcat Manager**: http://localhost:8080/manager/

### Log Files
- **Tomcat logs**: `logs/catalina.out`
- **Application logs**: Check your servlet container logs
- **Maven logs**: Console output during build

---

**Happy Coding! 🎉**

Your changes will now apply automatically with hot reloading enabled! 