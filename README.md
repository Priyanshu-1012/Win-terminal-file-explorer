# Win-terminal-file-explorer
A terminal file explorer for windows powershell. 
Useful to quickly navigate through explorer on powershell and get the path of any selected file, reduces the redundant task of
cd->ls->cd->ls while searching for a file/folder to perform operation on.





https://github.com/Priyanshu-1012/Win-terminal-file-explorer/assets/39450902/bbb37792-4091-4e51-94a2-866602e731d9






## How to use?

| keys  | Function |
| ------------- | ------------- |
| Up/Down  | move selection up/down  |
| number then Up/Down  | jump selection up/down by that number  |
| Right  | go inside the directory  |
| Left x2  | go back to parent directory |
| Tab  | open file/folder in their respective app |
| Spacebar  | prints path of the directory you selected and exit |
| Esc  | quit the file explorer  |

### Prerequisite(s)
 Nerd Fonts
 
 
## How to include it to your powershell
_Note: wherever the command says ~/Documents you can go on and type your preffered location._

1. Type in powershell
   ```powershell
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Priyanshu-1012/Win-terminal-file-explorer/master/winterm_fe.ps1" | Select-Object -ExpandProperty Content | Out-File -FilePath ~/Documents/winterm_fe.ps1 -Encoding UTF8
   ```

2. Next, paste the following command on terminal.
    ```powershell
    "function fe {
    `$scriptPath = Resolve-Path -Path '~/Documents/winterm_fe.ps1'
    & `$scriptPath
   }" | Add-Content $profile
    ```
    
3. Now reload your powershell by command ```pwsh``` and now whenever you call ```fe``` , explorer will launch in the current directory you are in and you can navigate through keys
(make sure u adjust font size to smaller and smaller to make it look better)

### To-Do
1. its seems annoying when items are much more than to be displayed all at once on the console and if we wanna navigate through..fix it
2. include selection through name(alphabets)<br>
~3. include icons and color for different extensions~
