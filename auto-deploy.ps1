# CompanyWebAppNew - Auto Deploy PowerShell Script
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "CompanyWebAppNew - Auto Deploy Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Maven is installed
try {
    $mavenVersion = mvn -version 2>$null
    if ($LASTEXITCODE -ne 0) {
        throw "Maven not found"
    }
    Write-Host "✓ Maven found" -ForegroundColor Green
} catch {
    Write-Host "❌ ERROR: Maven is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Maven and add it to your PATH" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Function to check if port is in use
function Test-Port {
    param($Port)
    $connection = Get-NetTCPConnection -LocalPort $Port -ErrorAction SilentlyContinue
    return $connection -ne $null
}

# Check if Tomcat is running
$tomcatRunning = Test-Port -Port 8080

if (-not $tomcatRunning) {
    Write-Host "Starting Tomcat..." -ForegroundColor Yellow
    Write-Host "This will start the application and keep it running." -ForegroundColor Gray
    Write-Host "Press Ctrl+C to stop the server." -ForegroundColor Gray
    Write-Host ""
    
    # Start Tomcat in background
    Start-Process -FilePath "mvn" -ArgumentList "tomcat7:run" -NoNewWindow
    Start-Sleep -Seconds 10
    
    Write-Host "✓ Tomcat started successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Your application is now running at:" -ForegroundColor Cyan
    Write-Host "http://localhost:8080/CompanyWebAppNew/" -ForegroundColor White
    Write-Host ""
    Write-Host "Admin Login:" -ForegroundColor Cyan
    Write-Host "http://localhost:8080/CompanyWebAppNew/admin/login.jsp" -ForegroundColor White
    Write-Host "Username: admin" -ForegroundColor Gray
    Write-Host "Password: admin123" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Changes to JSP files will be automatically reloaded!" -ForegroundColor Green
    Write-Host "For Java changes, restart the server." -ForegroundColor Yellow
    
} else {
    Write-Host "✓ Tomcat is already running on port 8080" -ForegroundColor Green
    Write-Host ""
    
    # Show menu
    Write-Host "Choose an option:" -ForegroundColor Cyan
    Write-Host "1. Build and deploy (hot reload)" -ForegroundColor White
    Write-Host "2. Clean build and restart" -ForegroundColor White
    Write-Host "3. Just build (no restart)" -ForegroundColor White
    Write-Host "4. Open application in browser" -ForegroundColor White
    Write-Host "5. Exit" -ForegroundColor White
    Write-Host ""
    
    $choice = Read-Host "Enter your choice (1-5)"
    
    switch ($choice) {
        "1" {
            Write-Host "Building and deploying with hot reload..." -ForegroundColor Yellow
            mvn compile war:exploded
            if ($LASTEXITCODE -eq 0) {
                Write-Host "✓ Hot reload completed!" -ForegroundColor Green
                Write-Host "Your changes should be visible immediately." -ForegroundColor Green
            } else {
                Write-Host "❌ Build failed!" -ForegroundColor Red
            }
        }
        "2" {
            Write-Host "Clean build and restart..." -ForegroundColor Yellow
            mvn clean compile tomcat7:run
        }
        "3" {
            Write-Host "Building only..." -ForegroundColor Yellow
            mvn compile
            if ($LASTEXITCODE -eq 0) {
                Write-Host "✓ Build completed!" -ForegroundColor Green
            } else {
                Write-Host "❌ Build failed!" -ForegroundColor Red
            }
        }
        "4" {
            Write-Host "Opening application in browser..." -ForegroundColor Yellow
            Start-Process "http://localhost:8080/CompanyWebAppNew/"
        }
        "5" {
            Write-Host "Exiting..." -ForegroundColor Gray
            exit 0
        }
        default {
            Write-Host "Invalid choice. Exiting..." -ForegroundColor Red
            exit 1
        }
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Deployment completed!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to exit" 