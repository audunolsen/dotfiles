## Symbolic Links

Run `$ ./sync.sh` to create symbolic links. The links are determined by files containing `DOTFILES SYMLINK` in this repo.

Use `DOTFILES SYMLINK [ <...args> ]` to change `ln` output
- `HIDE` output as a hidden file (filename prefixed with a dot)
- `<path>` change destination. Argument ending in a `/` is treated as a path, otherwise before/after of the final slash-occurence is treated as path/filename

## Rationale

Why is symlink logic written with zsh and cpp instead of e.g. node/deno? zsh and cpp are bundled w/ macos and this script should be able to run on a totally fersh machine before tools like node and such are installed and configured

## TODO
- [x] More efficient shell script symlinking files
- [x] Better Guard agains files/directories which should not be symlinked
- [x] Add .gitconfig
- [x] Add .hyper.{css|js}
- [x] Add proper file structuring for this repo. (git/ zsh/ nvim/ etc..)
- [ ] Split up runcom files for zsh and nvim
- [ ] Add dummy files for my most used languages for syntax evaluation
- [ ] A lot more…

<!-- {
    "workbench.colorTheme": "Default Light+",
    
    "window.titleBarStyle": "native",

    "editor.lineNumbers": "off",
    "editor.folding": false,
    // "editor.glyphMargin": true,
    "editor.guides.indentation": false,

    

    "editor.scrollbar.horizontal": "hidden",
    "editor.scrollbar.vertical": "hidden",
    "editor.minimap.enabled": false,
    "breadcrumbs.enabled": false,
    "editor.glyphMargin": false,
    // "editor.overviewRulerBorder": false,
    // "editor.hideCursorInOverviewRuler": true
    // "editor.decorations."

    "customizeUI.titleBar": "frameless",

    "editor.padding.top": 10,

} -->

