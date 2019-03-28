function get_random_rgb () {
    printf $(python -c "import random; print((random.randint(0,255)+255)/2)")
}

function set_iterm_tab_color () {
    local color=$1; 
    local color_rgb_value=$(get_random_rgb)
    echo -ne "\033]6;1;bg;$color;brightness;$color_rgb_value\a"
}

function iterm2_tab_precmd() {
    tab-reset
}

function automatic_iterm_tab_color_cwd () {
    set_iterm_tab_color "red" 
    set_iterm_tab_color "green"
    set_iterm_tab_color "blue"
}



autoload -U add-zsh-hook
add-zsh-hook precmd iterm2_tab_precmd
add-zsh-hook precmd automatic_iterm_tab_color_cwd
