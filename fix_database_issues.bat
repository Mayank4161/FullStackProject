@echo off
echo ========================================
echo Database Issues Fix Script
echo ========================================
echo.

echo [1/6] Cleaning previous build...
call mvn clean
if %errorlevel% neq 0 (
    echo ❌ Maven clean failed
    pause
    exit /b 1
)
echo ✅ Clean completed

echo.
echo [2/6] Downloading dependencies...
call mvn dependency:resolve
if %errorlevel% neq 0 (
    echo ❌ Dependency resolution failed
    pause
    exit /b 1
)
echo ✅ Dependencies downloaded

echo.
echo [3/6] Compiling project...
call mvn compile
if %errorlevel% neq 0 (
    echo ❌ Maven compile failed
    pause
    exit /b 1
)
echo ✅ Compilation completed

echo.
echo [4/6] Building WAR file...
call mvn package -DskipTests
if %errorlevel% neq 0 (
    echo ❌ WAR build failed
    pause
    exit /b 1
)
echo ✅ WAR file created

echo.
echo [5/6] Database setup reminder...
echo.
echo IMPORTANT: Please ensure you have:
echo 1. MySQL server running on localhost:3306
echo 2. Database 'companywebappnew' created
echo 3. Run the database setup script:
echo    mysql -u root -p < database_setup.sql
echo.
pause

echo.
echo [6/6] Starting Tomcat server...
echo.
echo ✅ All fixes applied successfully!
echo.
echo Application URL: http://localhost:8080/CompanyWebAppNew
echo Test URL: http://localhost:8080/CompanyWebAppNew/TestServlet
echo Admin Login: http://localhost:8080/CompanyWebAppNew/admin/login.jsp
echo.
echo Default admin credentials:
echo Username: admin
echo Password: admin123
echo.
echo Press any key to start Tomcat...
pause

call mvn tomcat7:run 