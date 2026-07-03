# Define target org as parameter
param(
    [string]$TargetOrg = "HCDeployment"
)

Write-Host "Target Org: $TargetOrg" -ForegroundColor Cyan
Write-Host ""


# Dry-run
Write-Host "Dry-run..." -ForegroundColor Cyan
sf project deploy start --target-org $TargetOrg -x manifest/package.xml --dry-run --wait 60

# Confirm and deploy
$confirm = Read-Host "Deploy? (yes/no)"
if ($confirm -eq "yes") {
    Write-Host " Deploying..." -ForegroundColor Green
    sf project deploy start --target-org $TargetOrg -x manifest/package.xml --wait 60
    Write-Host "Done!" -ForegroundColor Green
}