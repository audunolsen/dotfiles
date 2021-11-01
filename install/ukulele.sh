#!/bin/zsh

# Eliminate the hugely annoying compound keys in macOS

curl -O https://software.sil.org/downloads/r/ukelele/Ukelele_3.5.1.dmg

# Todo…

# # mount image
# hdiutil attach <name>.dmg

# # copy app, remove old version first if installed
# if [[ -d /Applications/<name>.app ]]; then
#     sudo rm -rf /Applications/<name>.app
# fi
# sudo cp -r /Volumes/<name>/<name>.app /Applications/<name>.app

# # unmount and remove image
# hdiutil detach /Volumes/<name>
# mv <name>.dmg ~/.Trash/ (rm -rf instead?)