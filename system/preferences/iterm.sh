#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# lsd and Starship draw Nerd Font icons, which plain Fira Code lacks.
# PostScript name of the `font-fira-code-nerd-font` cask's regular face.
declare -r FONT="FiraCodeNF-Reg"

set_iterm_font() {

    local plist=""
    local count=0
    local current=""

    plist="$(mktemp -t iterm2)" || return 1

    # Round-trip through `defaults` so cfprefsd doesn't serve a stale copy.
    defaults export com.googlecode.iterm2 "$plist" \
        || return 1

    count="$(/usr/libexec/PlistBuddy -c "Print :'New Bookmarks'" "$plist" | grep -c "^        Guid = ")"

    # Every profile keeps its font size.
    for (( i = 0; i < count; i++ )); do
        current="$(/usr/libexec/PlistBuddy -c "Print :'New Bookmarks':$i:'Normal Font'" "$plist" 2> /dev/null)"
        /usr/libexec/PlistBuddy -c "Set :'New Bookmarks':$i:'Normal Font' '$FONT ${current##* }'" "$plist" 2> /dev/null \
            || /usr/libexec/PlistBuddy -c "Add :'New Bookmarks':$i:'Normal Font' string '$FONT 12'" "$plist"
    done

    defaults import com.googlecode.iterm2 "$plist"
    local status=$?

    rm -f "$plist"
    return $status

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_info "• iTerm2"

if ! defaults read com.googlecode.iterm2 "New Bookmarks" &> /dev/null; then
    print_warning "Open iTerm2 once, quit it, then run 'make prefs' to set its font"
elif pgrep -xq "iTerm2"; then
    # iTerm2 writes its profiles back on quit, which would undo the change.
    print_warning "Quit iTerm2, then run 'make prefs' to set its font"
else
    execute "set_iterm_font" \
        "Use FiraCode Nerd Font in every profile"
fi
