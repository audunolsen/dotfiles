## symbolic links

To symlink files from this directory to other directories, the "symlink"
executable will look for a lina which includes `DOTFILES SYMLINK` in this
project's files. Said line can include two optional arguments to alter how
these files are symlinked; `DOTFILES SYMLINK [ path/to/dir/ HIDE ]`. The first
arg can be a path which is the directory the file should be linked to, which
is relative to the home dorectory. If there's a second arg stating HIDE, this
will make the link a hidden file (file prefixed with a dot)"

To symlink files, call the `./sync.sh` script.

## TODO:
- [x] More efficient shell script symlinking files
- [X] Better Guard agains files/directories which should not be symlinked
- [X] Add .gitconfig
- [X] Add .hyper.{css|js}
- [X] Add proper file structuring for this repo. (git/ zsh/ nvim/ etc..)
- [ ] Split up runcom files for zsh and nvim
- [ ] A lot more…
