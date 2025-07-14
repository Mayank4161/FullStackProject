# 🔧 Troubleshooting Guide - Company Web Application

## 🚨 "An unexpected error occurred" - How to Fix

### Step 1: Identify the Specific Error

1. **Check the Error Page**: 
   - If you see a detailed error page, note the specific error message
   - Look for the exception type and stack trace

2. **Check Tomcat Logs in Eclipse**:
   - Open Eclipse
   - Go to Window → Show View → Console
   - Look for red error messages in the console
   - Copy the full error message

3. **Run Diagnostic Tests**:
   - Visit: `http://localhost:8080/CompanyWebAppNew/DiagnosticServlet`
   - This will test all components and show specific issues

4. **Test Individual Components**:
   - Visit: `http://localhost:8080/CompanyWebAppNew/test.jsp`
   - This tests JSP processing and database connection

### Step 2: Common Error Types and Solutions

#### 🔴 Database Connection Errors

**Error**: `Communications link failure` or `Access denied for user`
**Solution**:
```bash
# 1. Start MySQL service
net start mysql

# 2. Test connection
mysql -u root -pMayank

# 3. Create database if missing
mysql -u root -pMayank < database_setup.sql
```

#### 🔴 Missing Database Tables

**Error**: `Table 'companywebappnew.contacts' doesn't exist`
**Solution**:
```bash
# Run the database setup script
mysql -u root -pMayank < database_setup.sql
```

#### 🔴 Missing Properties File

**Error**: `db.properties file not found`
**Solution**:
- Ensure `src/main/resources/db.properties` exists
- Check file content matches your MySQL setup

#### 🔴 MySQL Driver Not Found

**Error**: `ClassNotFoundException: com.mysql.cj.jdbc.Driver`
**Solution**:
- Check `pom.xml` has MySQL dependency
- Run `mvn clean compile` to download dependencies

#### 🔴 Compilation Errors

**Error**: `Compilation failed`
**Solution**:
```bash
# Clean and recompile
mvn clean compile

# Check for syntax errors in Java files
```

### Step 3: Manual Testing Steps

1. **Test Database Connection**:
   ```bash
   mysql -u root -pMayank -e "USE companywebappnew; SELECT COUNT(*) FROM contacts;"
   ```

2. **Test Application Endpoints**:
   - Main page: `http://localhost:8080/CompanyWebAppNew/`
   - Test page: `http://localhost:8080/CompanyWebAppNew/test.jsp`
   - Diagnostics: `http://localhost:8080/CompanyWebAppNew/DiagnosticServlet`
   - Contact form: `http://localhost:8080/CompanyWebAppNew/contact.jsp`

3. **Check File Structure**:
   ```
   CompanyWebAppNew/
   ├── src/main/
   │   ├── java/com/companywebappnew/
   │   │   ├── servlets/
   │   │   ├── dao/
   │   │   ├── dto/
   │   │   ├── service/
   │   │   └── util/
   │   ├── resources/
   │   │   └── db.properties
   │   └── webapp/
   │       ├── WEB-INF/
   │       │   └── web.xml
   │       ├── admin/
   │       ├── error/
   │       └── *.jsp
   └── pom.xml
   ```

### Step 4: Environment Setup Verification

1. **Java Version**: Ensure Java 17+ is installed
   ```bash
   java -version
   ```

2. **Maven Version**: Ensure Maven is installed
   ```bash
   mvn -version
   ```

3. **MySQL Service**: Ensure MySQL is running
   ```bash
   net start mysql
   ```

4. **Port Availability**: Ensure port 8080 is free
   ```bash
   netstat -an | findstr :8080
   ```

### Step 5: Quick Fix Scripts

#### Run Complete Troubleshooting:
```bash
cd CompanyWebAppNew
troubleshoot_error.bat
```

#### Test Endpoints:
```bash
cd CompanyWebAppNew
test_endpoints.bat
```

#### Fix Database Issues:
```bash
cd CompanyWebAppNew
fix_database_issues.bat
```

### Step 6: Eclipse-Specific Issues

1. **Project Not Deployed**:
   - Right-click project → Run As → Run on Server
   - Check server is started

2. **Classpath Issues**:
   - Right-click project → Properties → Java Build Path
   - Ensure all dependencies are included

3. **Server Configuration**:
   - Double-click server in Servers view
   - Check port settings and deployment

### Step 7: Advanced Debugging

1. **Enable Debug Logging**:
   - Add to `web.xml`:
   ```xml
   <context-param>
       <param-name>org.apache.catalina.level</param-name>
       <param-value>FINE</param-value>
   </context-param>
   ```

2. **Check Database Logs**:
   ```bash
   # View MySQL error log
   tail -f /var/log/mysql/error.log
   ```

3. **Test Database Connection Manually**:
   ```java
   // Add this to any servlet for testing
   try {
       Connection conn = DBConnection.getConnection();
       System.out.println("Database connected successfully");
       conn.close();
   } catch (Exception e) {
       e.printStackTrace();
   }
   ```

### Step 8: Still Having Issues?

1. **Collect Information**:
   - Copy the exact error message
   - Note which page/action caused the error
   - Check browser console (F12) for JavaScript errors
   - Copy Tomcat console logs

2. **Common Solutions**:
   - Restart Tomcat server
   - Restart MySQL service
   - Clean and rebuild project
   - Check firewall settings
   - Verify all files are in correct locations

3. **Emergency Reset**:
   ```bash
   # Stop all services
   net stop mysql
   
   # Clean project
   mvn clean
   
   # Restart services
   net start mysql
   
   # Rebuild and deploy
   mvn clean package
   ```

### 📞 Need More Help?

If you're still experiencing issues:

1. Run the diagnostic servlet and share the results
2. Copy the exact error message from the error page
3. Share the Tomcat console logs
4. Note which specific action caused the error

The diagnostic tools will help identify the exact cause of the "unexpected error" and provide specific solutions. 