# CSV file path
$csvPath = "C:\Users\kshit\OneDrive\Desktop\Devops\terraform-resource-group\RG.csv"

# Output terraform.tfvars path
$outputPath = "C:\Users\kshit\OneDrive\Desktop\Devops\terraform-resource-group\terraform.tfvars"

# Check CSV exists
if (-not (Test-Path $csvPath)) {
    Write-Host "CSV file not found!" -ForegroundColor Red
    Write-Host $csvPath
    exit
}

# Read CSV
$data = Import-Csv -Path $csvPath

# Start Terraform variable
$output = "rgs = {`n"

# Counter
$i = 1

# Process each row
foreach ($row in $data) {

    $name = $row.Name
    $location = $row.Location

    $output += "  rg$i = {`n"
    $output += "    name     = `"$name`"`n"
    $output += "    location = `"$location`"`n"
    $output += "  }`n"
    $output += "`n"

    $i++
}

# Close Terraform map
$output += "}`n"

# Create terraform.tfvars
Set-Content -Path $outputPath -Value $output -Encoding UTF8

Write-Host ""
Write-Host "terraform.tfvars created successfully!" -ForegroundColor Green
Write-Host "File: $outputPath" -ForegroundColor Cyan