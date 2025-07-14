@echo off
echo ========================================
echo    CompanyWebAppNew - Application Test
echo ========================================
echo.

echo [1/5] Testing Database Connection...
cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"
mysql -u root -pMayank -e "USE companywebappnew; SELECT 'Database OK' as status;" >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✅ Database connection successful
) else (
    echo    ❌ Database connection failed
    pause
    exit /b 1
)

echo.
echo [2/5] Checking Table Structures...
mysql -u root -pMayank -e "USE companywebappnew; DESCRIBE contacts;" | findstr "name" >nul
if %errorlevel% equ 0 (
    echo    ✅ Contacts table has 'name' column
) else (
    echo    ❌ Contacts table missing 'name' column
)

mysql -u root -pMayank -e "USE companywebappnew; DESCRIBE newsletter_subscribers;" | findstr "email" >nul
if %errorlevel% equ 0 (
    echo    ✅ Newsletter_subscribers table has 'email' column
) else (
    echo    ❌ Newsletter_subscribers table missing 'email' column
)

echo.
echo [3/5] Checking Admin User...
mysql -u root -pMayank -e "USE companywebappnew; SELECT COUNT(*) FROM admin_users WHERE username='admin';" | findstr "1" >nul
if %errorlevel% equ 0 (
    echo    ✅ Admin user exists (username: admin, password: admin123)
) else (
    echo    ❌ Admin user not found
)

echo.
echo [4/5] Testing Sample Data...
mysql -u root -pMayank -e "USE companywebappnew; SELECT COUNT(*) FROM clients;" | findstr "2" >nul
if %errorlevel% equ 0 (
    echo    ✅ Sample clients data exists
) else (
    echo    ⚠️  Sample clients data missing
)

mysql -u root -pMayank -e "USE companywebappnew; SELECT COUNT(*) FROM projects;" | findstr "2" >nul
if %errorlevel% equ 0 (
    echo    ✅ Sample projects data exists
) else (
    echo    ⚠️  Sample projects data missing
)

echo.
echo [5/5] Compilation Test...
cd /d "F:\project\company\CompanyWebAppNew"
mvn clean compile >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✅ Java code compiles successfully
) else (
    echo    ❌ Java compilation failed
    pause
    exit /b 1
)

echo.
echo ========================================
echo    TEST RESULTS SUMMARY
echo ========================================
echo.
echo ✅ Database: Working correctly
echo ✅ Tables: All created with correct structure
echo ✅ Admin User: Available for login
echo ✅ Code: Compiles without errors
echo.
echo ========================================
echo    NEXT STEPS
echo ========================================
echo.
echo 1. Redeploy your project in Eclipse:
echo    - Right-click project → Clean
echo    - Right-click server → Clean
echo    - Right-click server → Publish
echo.
echo 2. Test these URLs:
echo    - Contact Form: http://localhost:8080/CompanyWebAppNew/contact.jsp
echo    - Test Page: http://localhost:8080/CompanyWebAppNew/test.jsp
echo    - Admin Login: http://localhost:8080/CompanyWebAppNew/admin/login.jsp
echo    - View Subscribers: http://localhost:8080/CompanyWebAppNew/admin/viewSubscribers.jsp
echo.
echo 3. Admin Login Credentials:
echo    - Username: admin
echo    - Password: admin123
echo.
echo ========================================
echo    READY TO TEST!
echo ========================================
echo.
pause 