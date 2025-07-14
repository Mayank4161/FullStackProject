@echo off
echo ========================================
echo    TROUBLESHOOTING APPLICATION ERROR
echo ========================================
echo.

echo [1/8] Checking Java installation...
java -version
if %errorlevel% neq 0 (
    echo ERROR: Java is not installed or not in PATH
    echo Please install Java 17 or later
    pause
    exit /b 1
)
echo.

echo [2/8] Checking Maven installation...
mvn -version
if %errorlevel% neq 0 (
    echo ERROR: Maven is not installed or not in PATH
    echo Please install Maven
    pause
    exit /b 1
)
echo.

echo [3/8] Checking if MySQL is running...
netstat -an | findstr :3306
if %errorlevel% neq 0 (
    echo WARNING: MySQL might not be running on port 3306
    echo Please start MySQL service
    echo.
)

echo [4/8] Testing database connection...
echo Attempting to connect to MySQL...
mysql -u root -pMayank -e "SELECT 1;" 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Cannot connect to MySQL
    echo Please check:
    echo - MySQL service is running
    echo - Username: root, Password: Mayank
    echo - Database exists: companywebappnew
    echo.
)

echo [5/8] Checking database and tables...
mysql -u root -pMayank -e "USE companywebappnew; SHOW TABLES;" 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Database 'companywebappnew' not found or tables missing
    echo Running database setup...
    mysql -u root -pMayank < database_setup.sql
    echo.
)

echo [6/8] Cleaning and compiling project...
call mvn clean compile
if %errorlevel% neq 0 (
    echo ERROR: Compilation failed
    echo Check the error messages above
    pause
    exit /b 1
)
echo.

echo [7/8] Building WAR file...
call mvn package -DskipTests
if %errorlevel% neq 0 (
    echo ERROR: WAR packaging failed
    echo Check the error messages above
    pause
    exit /b 1
)
echo.

echo [8/8] Starting Tomcat for testing...
echo Starting Tomcat on port 8080...
call mvn tomcat7:run
if %errorlevel% neq 0 (
    echo ERROR: Failed to start Tomcat
    echo Check if port 8080 is available
    pause
    exit /b 1
)

echo.
echo ========================================
echo    TROUBLESHOOTING COMPLETE
echo ========================================
echo.
echo If you're still getting errors:
echo 1. Open http://localhost:8080/CompanyWebAppNew/DiagnosticServlet
echo 2. Check the detailed diagnostic results
echo 3. Look for specific error messages
echo.
echo Common solutions:
echo - Start MySQL service: net start mysql
echo - Create database: mysql -u root -p < database_setup.sql
echo - Check firewall settings
echo - Ensure port 8080 is not in use
echo.
pause 