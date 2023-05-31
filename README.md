# Win-terminal-file-explorer
A terminal file explorer for windows powershell

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


## How to include it to your powershell

1. Go to your profile.ps1 file by typing  ```code $profile``` or   ```vim $profile``` or  ```notepad $profile``` according to your favorite text editor.

2. Make a fucntion there by the name convinient to you
    ```powershell
    Function expl {
    & 'path/to/your/ps1/file'
    }
    ```
    
    
3. Now reload your powershell and whenever you call 'expl' (in this case) explorer will launch on the current directory you are in and you can navigate through keys
