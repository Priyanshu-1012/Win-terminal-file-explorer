
function Show-List {
    param (
        [Parameter(Mandatory = $true)]
        [string[]]$Items
    )

    $selectedItemIndex = 0
    $selectedItemPath = $Items[$selectedItemIndex]
    $quitFlag = $false

    while (-not $quitFlag) {
        Clear-Host

        # Display the list with the selected item highlighted
        for ($i = 0; $i -lt $Items.Count; $i++) {
            $j = $i + 1
            $folderName = Split-Path -Leaf $Items[$i]
            $item = Get-Item $Items[$i]
            
            if ($i -eq $selectedItemIndex) {
                $selectedText = "   $j $folderName "
                $escSeq = [char]27 + '[48;5;255m'  # Background color: Default
                $selectedTextWithColor = $escSeq + $selectedText + [char]27 + '[0m'
                Write-Host $selectedTextWithColor
            }
            elseif ($item.PSIsContainer) {
                Write-Host "   $j $folderName" -ForegroundColor Cyan
            }
            else {
                # Check if the file is a PDF and display it in red color
                if ($item.Extension -eq ".pdf" -or $item.Extension -eq ".epub") {
                    Write-Host "   $j $folderName" -ForegroundColor Red
                }
                elseif ($item.Extension -eq ".mkv" -or $item.Extension -eq ".mp4" -or $item.Extension -eq ".vid") {
                    Write-Host "   $j $folderName" -ForegroundColor Yellow
                }
                elseif ($item.Extension -eq ".docx" -or $item.Extension -eq ".txt" -or $item.Extension -eq ".doc" -or $item.Extension -eq "].doc" -or $item.Extension -eq ".yml" -or $item.Extension -eq ".toml") {
                    Write-Host "   $j $folderName" -ForegroundColor blue
                }
                elseif ($item.Extension -eq ".py" -or $item.Extension -eq ".xlsx" -or $item.Extension -eq ".xls" -or $item.Extension -eq ".ipynb") {
                    Write-Host "   $j $folderName" -ForegroundColor green
                }
                elseif ($item.Extension -eq ".png" -or $item.Extension -eq ".jpeg" -or $item.Extension -eq ".jpg") {
                    Write-Host "   $j $folderName" -ForegroundColor Magenta
                }
                elseif ($item.Extension -eq ".exe" -or $item.Extension -eq ".lnk" -or $item.Extension -eq ".bat") {
                    Write-Host "   $j $folderName" -ForegroundColor White
                }
                else {
                    Write-Host "   $j $folderName"
                }
            }
        }

        # Wait for user input
        $key = [System.Console]::ReadKey($true).Key

        # Handle arrow key presses
        switch ($key) {
            'UpArrow' {
                $selectedItemIndex = ($selectedItemIndex - 1) % $Items.Count
                if ($selectedItemIndex -lt 0) {
                    $selectedItemIndex = $Items.Count - 1
                }
                $selectedItemPath = $Items[$selectedItemIndex]
            }
            'DownArrow' {
                $selectedItemIndex = ($selectedItemIndex + 1) % $Items.Count
                $selectedItemPath = $Items[$selectedItemIndex]
            }
            'RightArrow' {
                $selectedItem = $Items[$selectedItemIndex]
                if (Test-Path $selectedItem -PathType Container) {
                    $childItems = Get-ChildItem $selectedItem | Select-Object -ExpandProperty FullName
                    if ($childItems.Count -gt 0) {
                        $Items = $childItems
                        $selectedItemIndex = 0
                        $selectedItemPath = $Items[$selectedItemIndex]
                    }
                }
            }
            'LeftArrow' {
                $parentPath = Split-Path -Parent $selectedItemPath
                if ($parentPath -ne $selectedItemPath) {
                    $Items = Get-ChildItem -Path $parentPath | Select-Object -ExpandProperty FullName
                    $selectedItemIndex = $Items.IndexOf($selectedItemPath)
                    $selectedItemPath = $parentPath
                }
            }
            'Spacebar' {
                $selectedItem = $Items[$selectedItemIndex]
                return $selectedItem
            }
            'escape' {
                $quitFlag = $true
            }
            'tab' {
                $selectedItem = $Items[$selectedItemIndex]
                Invoke-Item $selectedItem
            }
            default {
                # Check if the key is a number followed by an arrow key
                if ($key -ge 'D0' -and $key -le 'D9') {
                    $number = [int]($key - 'D0')
                    $nestedKey = [System.Console]::ReadKey($true).Key
                    if ($nestedKey -eq 'UpArrow') {
                        $selectedItemIndex = ($selectedItemIndex - $number) % $Items.Count
                        if ($selectedItemIndex -lt 0) {
                            $selectedItemIndex = $Items.Count - 1
                        }
                        $selectedItemPath = $Items[$selectedItemIndex]
                    }
                    elseif ($nestedKey -eq 'DownArrow') {
                        $selectedItemIndex = ($selectedItemIndex + $number) % $Items.Count
                        $selectedItemPath = $Items[$selectedItemIndex]
                    }
                }
            }
        }
    }
}
Import-Module -Name Terminal-Icons
$items = Get-ChildItem | Select-Object -ExpandProperty FullName 
$selectedItem = Show-List -Items $items

if ($selectedItem) {
    # Set-Location $selectedItem
    Write-Host "`nfolder selected: $selectedItem"
}
