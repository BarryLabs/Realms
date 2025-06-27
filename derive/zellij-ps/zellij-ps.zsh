#!/etc/profiles/per-user/mamotdask/bin/zsh

# This is an implementation of m3tam3re's zellij-ps for Zsh.
#
# https://code.m3ta.dev/m3tam3re/helper-scripts/src/branch/master/zellij-ps.fish

IFS=':' read -r -a folders <<< "${PROJECT_FOLDERS//$HOME/\$HOME}"

if (( $#argv > 1 )); then
    selected=$1
else
    selected=$(fd --type d --max-depth 1 . $folders | fzf --preview='')
fi

selected_name=$(basename "$selected" | tr . _)

if [[ -n $ZELLIJ_SESSION_NAME ]]; then
    echo "You are in a Zellij Session!
Please use the session manager to switch sessions." >&2
else
    cd "$selected"; zellij --layout zellij-ps attach -c "$selected_name" options
fi
