# Win-terminal-file-explorer
A terminal file explorer for windows powershell. 
Useful to quickly navigate through explorer on powershell and get the path of any selected file, reduces the redundant task of cd->ls->cd->ls while searching for a file/folder to perform operation on.



https://github.com/Priyanshu-1012/Win-terminal-file-explorer/assets/39450902/d6c2a71f-1e8f-4971-8fd1-372d19bd7602



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
(make sure u adjust font size to smaller and smaller to make it look better)

### To-Do
1. its seems annoying when items are much more than to be displayed all at once on the console and if we wanna navigate through..fix it
2. include selection through name(alphabets)
3. include icons and color for different extensions
