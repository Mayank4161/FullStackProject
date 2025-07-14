@echo off
echo ========================================
echo    Database Fix Script for CompanyWebAppNew
echo ========================================
echo.

echo Checking if MySQL is running...
mysql --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: MySQL is not installed or not in PATH
    echo Please install MySQL or add it to your PATH
    pause
    exit /b 1
)

echo MySQL found. Running database fix script...
echo.

echo Connecting to MySQL and running fix script...
mysql -u root -pMayank -e "source fix_database.sql"

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo    SUCCESS: Database tables fixed!
    echo ========================================
    echo.
    echo All tables have been recreated with the correct structure:
    echo - contacts (with name, email, phone, city, message columns)
    echo - newsletter_subscribers (with email column)
    echo - admin_users (with admin account)
    echo - clients (with sample data)
    echo - projects (with sample data)
    echo.
    echo You can now test your application!
) else (
    echo.
    echo ========================================
    echo    ERROR: Database fix failed!
    echo ========================================
    echo.
    echo Please check:
    echo 1. MySQL is running
    echo 2. Database 'companywebappnew' exists
    echo 3. User 'root' has proper permissions
    echo 4. Password is correct
    echo.
    echo Manual steps:
    echo 1. Open MySQL Workbench or command line
    echo 2. Run: USE companywebappnew;
    echo 3. Copy and paste the contents of fix_database.sql
)

echo.
pause 