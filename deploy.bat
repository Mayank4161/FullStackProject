@echo off
echo ========================================
echo CompanyWebAppNew - Deployment Script
echo ========================================
echo.

echo [1/5] Cleaning previous build...
call mvn clean
if %errorlevel% neq 0 (
    echo ❌ Maven clean failed
    pause
    exit /b 1
)
echo ✅ Clean completed

echo.
echo [2/5] Compiling project...
call mvn compile
if %errorlevel% neq 0 (
    echo ❌ Maven compile failed
    pause
    exit /b 1
)
echo ✅ Compilation completed

echo.
echo [3/5] Running database setup...
echo Please ensure MySQL is running and execute:
echo mysql -u root -p < database_setup.sql
echo.
pause

echo.
echo [4/5] Starting Tomcat server...
call mvn tomcat7:run
if %errorlevel% neq 0 (
    echo ❌ Tomcat startup failed
    pause
    exit /b 1
)

echo.
echo ========================================
echo ✅ Deployment completed successfully!
echo ========================================
echo.
echo Application URL: http://localhost:8080/CompanyWebAppNew
echo Test URL: http://localhost:8080/CompanyWebAppNew/TestServlet
echo Admin Login: http://localhost:8080/CompanyWebAppNew/admin/login.jsp
echo.
echo Default admin credentials:
echo Username: admin
echo Password: admin123
echo.
pause 