# Input bindings are passed in via param block.
param($Timer)

#To display the details of available Time zones
[System.TimeZoneInfo]::GetSystemTimeZones() | Select ID,StandardName


$currentUTCtime=[System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId( `
    (Get-Date), 'UTC')

$currentISTtime=[System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId( `
    (Get-Date), 'India Standard Time')

$currentETtime=[System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId( `
    (Get-Date), 'Eastern Standard Time')

$currentPTtime=[System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId( `
     (Get-Date), 'Pacific Standard Time')

$currentGMTtime=[System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId( `
    (Get-Date), 'GMT Standard TIme')

$currentCSTtime=[System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId( `
    (Get-Date), 'Central Standard Time')

# The 'IsPastDue' property is 'true' when the current function invocation is later than scheduled.
if ($Timer.IsPastDue) {
    Write-Host "PowerShell timer is running late!"
}

# Write an information log with the current time.

Write-Host "Hey there, it's time to trigger this function"
Write-Host ""
Write-Host "This function ran at UTC time: $currentUTCtime"
Write-Host "This function ran at IST time: $currentISttime"
Write-Host "This function ran at ET time: $currentETtime"
Write-Host "This function ran at PT time: $currentPTtime"
Write-Host "This function ran at GMT time: $currentGMTtime"
Write-Host "This function ran at CST time: $currentCSTtime"
