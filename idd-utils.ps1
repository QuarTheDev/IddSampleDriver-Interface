# THIS SOFTWARE COMES WITH ABSOLUTELY NO WARRANTY
# USE AT YOUR OWN RISK.

if (-not (Test-Path -Path "C:\IddSampleDriver\option.txt")) {
    Write-Host "The file C:\IddSampleDriver\option.txt does not exist."
    exit
}

function Show-Menu {
    param (
        [string]$Title = 'IDDSampleDriver Interface',
        [string]$Version = 'v0.0.1'
    )
    Clear-Host
    Write-Host "`n$Title"
    Write-Host $Version
    Write-Host "`n1: Toggle Display Driver On/Off"
    Write-Host "2: Refresh Display Driver"
    Write-Host "3: Modify Config File"
    Write-Host "4: Windows Display Settings"
    Write-Host "5: Exit`n"
}

while ($true) {
    Show-Menu
    $selection = Read-Host "Please select an option"
    switch ($selection) {
        '1' {
            Write-Host "not implemented"
            Start-Sleep -Milliseconds 500
        }

        '2' {
            Write-Host "Patching..."
            Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `$d = Get-PnpDevice | Where-Object {`$_.friendlyname -like 'IddSampleDriver Device'}; `$d | Disable-PnpDevice -Confirm:`$false; `$d | Enable-PnpDevice -Confirm:`$false" -WindowStyle Hidden
            Start-Sleep -Milliseconds 500
            Write-Host "Complete"
            Start-Sleep -Milliseconds 1000
        }

        '3' {
            Write-Host "Editing option file"
            Invoke-Item -Path "C:\IddSampleDriver\option.txt"
            Start-Sleep -Milliseconds 500
        }

        '4' {
            Write-Host "Display Settings"
            Start-Process "ms-settings:display"
            Start-Sleep -Milliseconds 250
            Write-Host "Opened in background."
            Start-Sleep -Milliseconds 500
        }

        '5' {
            Write-Host "Goodbye!"
            Start-Sleep -Milliseconds 500
            exit
        }
    }
}