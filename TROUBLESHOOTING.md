# Backend Troubleshooting Guide

## Common Issues and Solutions

### 1. Database Connection Issues

**Problem**: Cannot connect to MySQL database
**Solutions**:
- Ensure MySQL is running on localhost:3306
- Verify database credentials in `src/main/resources/db.properties`
- Run the database setup script: `database_setup.sql`
- Check if the database `companywebappnew` exists

**Database Setup**:
```sql
-- Run this in MySQL
source database_setup.sql
```

### 2. Servlet Mapping Issues

**Problem**: Servlets not responding
**Solutions**:
- Check servlet annotations (@WebServlet)
- Verify form actions point to correct servlet paths
- Ensure context path is correct in JSP forms

**Correct Servlet Paths**:
- ContactServlet: `/ContactServlet`
- NewsletterServlet: `/NewsletterServlet`
- AdminLoginServlet: `/AdminLoginServlet`
- AdminServlet: `/AdminServlet`
- ClientServlet: `/ClientServlet`
- ProjectServlet: `/ProjectServlet`

### 3. Session Management Issues

**Problem**: Admin login not working
**Solutions**:
- Check session attributes in AdminLoginServlet
- Verify admin credentials in database
- Default admin: username=`admin`, password=`admin123`

### 4. Compilation Issues

**Problem**: Maven compilation errors
**Solutions**:
```bash
# Clean and compile
mvn clean compile

# Check for missing dependencies
mvn dependency:resolve

# Run with Tomcat
mvn tomcat7:run
```

### 5. Deployment Issues

**Problem**: Application not deploying
**Solutions**:
- Check Tomcat version compatibility (Tomcat 10+ for Jakarta EE)
- Verify web.xml configuration (if using)
- Check context.xml configuration
- Ensure all JAR files are in WEB-INF/lib

### 6. Form Submission Issues

**Problem**: Forms not submitting data
**Solutions**:
- Check form action URLs
- Verify form method (POST)
- Check input field names match servlet parameters
- Ensure proper content type headers

### 7. Database Table Issues

**Problem**: Tables not found or wrong structure
**Solutions**:
- Run the complete database setup script
- Check table structure matches DTO fields
- Verify column names and data types

### 8. Validation Issues

**Problem**: Input validation not working
**Solutions**:
- Check ValidationUtil methods
- Verify validation rules in servlets
- Check error message display in JSPs

## Quick Fix Commands

```bash
# 1. Clean and rebuild
mvn clean compile

# 2. Run database setup
mysql -u root -p < database_setup.sql

# 3. Start Tomcat
mvn tomcat7:run

# 4. Check logs
tail -f logs/catalina.out
```

## Testing Checklist

- [ ] Database connection working
- [ ] Contact form submission
- [ ] Newsletter subscription
- [ ] Admin login (admin/admin123)
- [ ] Admin dashboard access
- [ ] Client management
- [ ] Project management

## Common Error Messages

1. **"Database connection failed"**
   - Check MySQL service
   - Verify credentials in db.properties

2. **"Servlet not found"**
   - Check @WebServlet annotations
   - Verify form action URLs

3. **"Table doesn't exist"**
   - Run database_setup.sql
   - Check table names

4. **"Session expired"**
   - Check session timeout
   - Verify login process

## Support

If issues persist, check:
1. Tomcat logs in `logs/catalina.out`
2. Application logs in console output
3. Database error logs
4. Browser developer tools for client-side errors 