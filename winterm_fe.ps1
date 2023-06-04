
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
            # $j = $i + 1
            $folderName = Split-Path -Leaf $Items[$i]
            $item = Get-Item $Items[$i]
            
            if ($i -eq $selectedItemIndex) {
                $selectedText = "      $folderName "
                $escSeq = [char]27 + '[48;5;255m'  # Background color: Default
                $selectedTextWithColor = $escSeq + $selectedText + [char]27 + '[0m'
                Write-Host $selectedTextWithColor
            }
            elseif ($item.PSIsContainer) {
                if ($folderName -eq "GitHub") {
                    Write-Host "     $folderName" -ForegroundColor White
                }
                elseif ($folderName -eq "Downloads") {
                    Write-Host "    󰇚 $folderName" -ForegroundColor cyan
                }
                elseif ($folderName -match "onedrive") {
                    Write-Host "     $folderName" -ForegroundColor cyan
                }
                elseif ($folderName -eq "Windows") {
                    Write-Host "     $folderName" -ForegroundColor cyan
                }
                elseif ($folderName -eq "bin") {
                    Write-Host "    󰿩 $folderName" -ForegroundColor cyan
                }
                elseif ($folderName -match "vscode") {
                    Write-Host "    󰨞 $folderName" -ForegroundColor cyan
                }
                elseif ($folderName -eq ".cache") {
                    Write-Host "     $folderName" -ForegroundColor white
                }
                else {
                    Write-Host "     $folderName" -ForegroundColor Cyan
                }
            }
            else {
                # Check if the file is a PDF and display it in red color
                if ($item.Extension -eq ".pdf" -or $item.Extension -eq ".epub") {
                    Write-Host "     $folderName" -ForegroundColor Red
                }
                elseif ($item.Extension -eq ".mkv" -or $item.Extension -eq ".mp4" -or $item.Extension -eq ".vid" -or $item.Extension -eq ".avi" -or $item.Extension -eq ".wmv") {
                    Write-Host "    󰕧 $folderName" -ForegroundColor Yellow
                }
                elseif ($item.Extension -eq ".txt" -or $item.Extension -eq ".toml" -or $item.Extension -eq ".def") {
                    Write-Host "     $folderName" -ForegroundColor blue
                }
                elseif ($item.Extension -eq ".png" -or $item.Extension -eq ".jpeg" -or $item.Extension -eq ".svg" -or $item.Extension -eq ".jpg" -or $item.Extension -eq ".bmp" -or $item.Extension -eq ".ico" -or $item.Extension -eq ".webp") {
                    Write-Host "     $folderName" -ForegroundColor Magenta
                }
                elseif ($item.Extension -eq ".exe" -or $item.Extension -eq ".lnk" -or $item.Extension -eq ".bat" -or $item.Extension -eq ".ini") {
                    Write-Host "     $folderName" -ForegroundColor White
                }
                elseif ($item.Extension -eq ".json") {
                    Write-Host "     $folderName" -ForegroundColor blue
                }
                elseif ($item.Extension -eq ".jar") {
                    Write-Host "     $folderName" -ForegroundColor yellow
                }
                elseif ($item.Extension -eq ".docx" -or $item.Extension -eq ".doc") {
                    Write-Host "    󰈬 $folderName" -ForegroundColor blue
                }
                elseif ($item.Extension -eq ".dll") {
                    Write-Host "     $folderName" -ForegroundColor white
                }
                elseif ($item.Extension -eq ".m") {
                    Write-Host "    󰘨 $folderName" -ForegroundColor darkyellow
                }
                elseif ($item.Extension -eq ".yml") {
                    Write-Host "     $folderName" -ForegroundColor Magenta
                }
                elseif ($item.Extension -eq ".html" -or $item.Extension -eq ".htm") {
                    Write-Host "     $folderName" -ForegroundColor DarkYellow
                }
                elseif ($item.Extension -eq ".gitconfig" -or $item.Extension -eq ".gitattributes" -or $item.Extension -eq ".gitignore") {
                    Write-Host "     $folderName" -ForegroundColor red
                }
                elseif ($item.Extension -eq ".css") {
                    Write-Host "     $folderName" -ForegroundColor Magenta
                }
                elseif ($item.Extension -eq ".md") {
                    Write-Host "     $folderName" 
                }
                elseif ($item.Extension -eq ".ahk") {
                    Write-Host "     $folderName" -ForegroundColor Green
                }
                elseif ($item.Extension -eq ".bashrc" -or $item.Extension -eq ".sh") {
                    Write-Host "     $folderName" 
                }
                elseif ($item.Name -eq "LICENSE") {
                    Write-Host "    󰿃 $folderName" -ForegroundColor white
                }
                elseif ($item.Name -match "docker") {
                    Write-Host "    󰡨 $folderName" -ForegroundColor DarkBlue
                }
                elseif ($item.Extension -eq ".log") {
                    Write-Host "     $folderName" 
                }
                elseif ($item.Extension -eq ".vimrc"  -or $item.Extension -eq ".vim" -or $item.Extension -eq ".viminfo") {
                    Write-Host "     $folderName" -ForegroundColor DarkCyan
                }
                elseif ($item.Extension -eq ".c"  -or $item.Extension -eq ".cpp" -or $item.Extension -eq ".h") {
                    Write-Host "     $folderName" 
                }
                elseif ($item.Extension -eq ".ps1"  -or $item.Extension -eq ".ps1d") {
                    Write-Host "    ﲵ $folderName"  -ForegroundColor Darkblue
                }
                elseif ($item.Extension -eq ".py" -or $item.Extension -eq ".ipynb") {
                    Write-Host "     $folderName" -ForegroundColor green
                }
                elseif ($item.Extension -eq ".zip" -or $item.Extension -eq ".7z" -or $item.Extension -eq ".rar" -or $item.Extension -eq ".tar" -or $item.Extension -eq ".z" -or $item.Extension -eq ".tar.gz") {
                    Write-Host "     $folderName" -ForegroundColor White
                }
                elseif ($item.Extension -eq ".exe" -or $item.Extension -eq ".lnk" -or $item.Extension -eq ".bat" -or $item.Extension -eq ".ini" -or $item.Extension -eq ".msi") {
                    Write-Host "     $folderName" -ForegroundColor White
                }
                elseif ($item.Extension -eq ".rmskin") {
                    Write-Host "     $folderName" -ForegroundColor Green
                }
                elseif ($item.Extension -eq ".lua" -or $item.Extension -eq ".luac") {
                    Write-Host "     $folderName" -ForegroundColor blue
                }
                elseif ($item.Extension -eq ".xlsx" -or $item.Extension -eq ".xls" -or $item.Extension -eq ".csv" -or $item.Extension -eq ".xlsm") {
                    Write-Host "     $folderName" -ForegroundColor green
                }
                elseif ($item.Extension -eq ".ppt" -or $item.Extension -eq ".pptx") {
                    Write-Host "    󱎐 $folderName" -ForegroundColor red
                }
                elseif ($item.Extension -eq ".otf" -or $item.Extension -eq ".sub" -or $item.Extension -eq ".srt" -or $item.Extension -eq ".ttf") {
                    Write-Host "     $folderName" 
                }
                elseif ($item.Extension -eq ".pl") {
                    Write-Host "     $folderName" -ForegroundColor Magenta
                }
                elseif ($item.Extension -eq ".mp3") {
                    Write-Host "    󰎈 $folderName" -ForegroundColor Magenta
                }
                elseif ($item.Extension -eq ".ics") {
                    Write-Host "     $folderName" -ForegroundColor Magenta
                }
                else {
                    Write-Host "     $folderName"
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

                # Handle scrolling when reaching the top
                if ($selectedItemIndex -lt $scrollOffset) {
                    $scrollOffset = [Math]::Max(0, $scrollOffset - 1)
                }

                $selectedItemPath = $Items[$selectedItemIndex]
            }
            'DownArrow' {
                $selectedItemIndex = ($selectedItemIndex + 1) % $Items.Count
                $selectedItemPath = $Items[$selectedItemIndex]

                # Handle scrolling when reaching the bottom
                if ($selectedItemIndex -ge ($scrollOffset + $pageSize)) {
                    $scrollOffset = [Math]::Min($Items.Count - $pageSize, $scrollOffset + 1)
                }
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
