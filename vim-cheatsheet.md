## Terminal ##
- `Ctrl` + `z`      *switch between jobs (foreground/background)*
- `Ctrl` + `w`      *delete a word once a time in command line* 
- `Ctrl` + `u`      *delete a line*
- `Ctrl` + `r`      *reverse search (history commands)*

```bash
$ dos2unix FILENAME   # dos -> unix file
$ unix2dos FILENAME   # unix -> dos file
```

## VIM ##
### Movement 
- `H(<)` `J(v)` `K(^)` `L(>)`
- `W/B`                   go foward/backward a word
- `3j`                    jump down 3 lines
- `Shift` + `^` or `0`    jump to start of line
- `Shift` + `$`           jump to end of line
- `gg`                    jump to start of file 
- `G`                     jump to end of file 

### Operation
- `d`               delete a char (backward) (cut) 
- `dd`              delete a line 
- `3dd`             delete down 3 lines
- `D`               delete content after postion of arrow (in line)
- `y`               copy 
- `yy`              copy a line
- `3yy`             copy down 3 lines
- `p`               paste on
- `4p`              paste on 4 times
- `u`               undo
- `Ctrl` + `r`      undo the undo

### Search 
- `/`               search target 
- `n`               next result 
- `N`               previous result 

### Mode
`Ctrl` + `[`        alternative of `ESC`
`:earlier 2m`       go to file 2 minutes ago
#### Insertion Mode
- `i`               insert
- `I`               move to **start** of the line and insert
- `a`               **append**, start from end of line)
- `A`               move to **end of line** and insert
- `o` / `O`         insert a newline `below` / `above`
- `Ctrl` + `N`      built-in **auto-complete**

#### Indent
- `5>>`             to indent the next 5 lines  
- `Vjj>`            
    1. `V` change to `VISUAL` mode
    2. `j` is to select down a block of lines and then `>` indent

#### VISUAL Mode
- Use `h` `j` `k` `l` to select more
- `Shift` + `v`      visual line
- `Ctrl`  + `v`      visual block

### View Layout
- `sp FILENAME`      split windows in **horizonal**           
- `vsp FILENAME`     split windows in **vertical**
- `Ctrl` + `w`       switch between windows
- `Ctrl` + `E`       scroll **down**
- `Ctrl` + `Y`       scroll **up**

### Combination 
- `caw`              change all word
- `diw`              delete in word
- `yi)`              yank contents in `()`
- `di[`              delete contents in `[]`
- `va"`              In `VISUAL` mode, select all comtent inside `""`
- `.`                do the last motion again 
- Add specific code snippets to multiple lines (block)
1. `Ctrl` + `V`      To select the first column of text in the lines you want to comment.
2. `Shift` + `i`     Type the text you want to insert.
3. `Esc`             wait the inserted text to appear at each line
4. ex. add comments `//` to a block 

### `.vimrc`
```
:set nowrap           # no wrap in vim
:set hlsearch         # highlight search result
```
### Bundle
```
:PluginUpdate
:PluginClean
:PluginList
:PluginSearch
```
