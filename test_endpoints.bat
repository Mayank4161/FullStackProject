@echo off
echo ========================================
echo    TESTING APPLICATION ENDPOINTS
echo ========================================
echo.

echo Testing application endpoints on localhost:8080...
echo.

echo [1/6] Testing main page...
curl -s -o nul -w "HTTP Status: %%{http_code}\n" http://localhost:8080/CompanyWebAppNew/
echo.

echo [2/6] Testing test page...
curl -s -o nul -w "HTTP Status: %%{http_code}\n" http://localhost:8080/CompanyWebAppNew/test.jsp
echo.

echo [3/6] Testing diagnostic servlet...
curl -s -o nul -w "HTTP Status: %%{http_code}\n" http://localhost:8080/CompanyWebAppNew/DiagnosticServlet
echo.

echo [4/6] Testing contact page...
curl -s -o nul -w "HTTP Status: %%{http_code}\n" http://localhost:8080/CompanyWebAppNew/contact.jsp
echo.

echo [5/6] Testing admin login page...
curl -s -o nul -w "HTTP Status: %%{http_code}\n" http://localhost:8080/CompanyWebAppNew/admin/login.jsp
echo.

echo [6/6] Testing database test servlet...
curl -s -o nul -w "HTTP Status: %%{http_code}\n" http://localhost:8080/CompanyWebAppNew/DatabaseTest
echo.

echo ========================================
echo    MANUAL TESTING INSTRUCTIONS
echo ========================================
echo.
echo Please manually test these URLs in your browser:
echo.
echo 1. Main page: http://localhost:8080/CompanyWebAppNew/
echo 2. Test page: http://localhost:8080/CompanyWebAppNew/test.jsp
echo 3. Diagnostics: http://localhost:8080/CompanyWebAppNew/DiagnosticServlet
echo 4. Contact form: http://localhost:8080/CompanyWebAppNew/contact.jsp
echo 5. Admin login: http://localhost:8080/CompanyWebAppNew/admin/login.jsp
echo.
echo If you get "unexpected error" on any page:
echo 1. Check the browser's developer console (F12)
echo 2. Look at the Tomcat logs in Eclipse
echo 3. Note the specific error message
echo.
pause 