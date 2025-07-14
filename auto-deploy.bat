@echo off
echo ========================================
echo CompanyWebAppNew - Auto Deploy Script
echo ========================================
echo.

:: Check if Maven is installed
mvn -version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Maven is not installed or not in PATH
    echo Please install Maven and add it to your PATH
    pause
    exit /b 1
)

:: Check if Tomcat is running
echo Checking if Tomcat is running...
netstat -an | findstr :8080 >nul
if errorlevel 1 (
    echo Starting Tomcat...
    call mvn tomcat7:run
) else (
    echo Tomcat is already running on port 8080
    echo.
    echo Choose an option:
    echo 1. Build and deploy (hot reload)
    echo 2. Clean build and restart
    echo 3. Just build (no restart)
    echo 4. Exit
    echo.
    set /p choice="Enter your choice (1-4): "
    
    if "%choice%"=="1" (
        echo Building and deploying with hot reload...
        call mvn compile war:exploded
        echo Hot reload completed!
        echo Your changes should be visible immediately.
    ) else if "%choice%"=="2" (
        echo Clean build and restart...
        call mvn clean compile tomcat7:run
    ) else if "%choice%"=="3" (
        echo Building only...
        call mvn compile
        echo Build completed!
    ) else if "%choice%"=="4" (
        echo Exiting...
        exit /b 0
    ) else (
        echo Invalid choice. Exiting...
        exit /b 1
    )
)

echo.
echo ========================================
echo Deployment completed!
echo ========================================
echo.
echo Your application should be available at:
echo http://localhost:8080/CompanyWebAppNew/
echo.
echo Admin Login: http://localhost:8080/CompanyWebAppNew/admin/login.jsp
echo Username: admin
echo Password: admin123
echo.
pause 