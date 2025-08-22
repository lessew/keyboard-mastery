#!/bin/bash

# Focus or Launch Script for Ubuntu with Wayland
# Usage: ./focus_or_launch.sh <program_name>
# Example: ./focus_or_launch.sh firefox

app_is_running() {
    local window_title="$1"
    local match_pattern="$1"

    case "$window_title" in
        "chrome")
            match_pattern="google-chrome" 
            ;;
        "terminal")
            match_pattern="gnome-terminal"
            ;;
        *)
            match_pattern="$window_title"
            ;;
    esac
    
    #local pid=$(pgrep -f "$window_title")
    local pid=$(ps -ef | grep "$match_pattern" | grep -v grep | grep -v "focus_or_launch.sh")
    logger "focus_or_launch: Debug - pgrep found PID: '$pid' for '$window_title'"
    [ -n "$pid" ]
}

focus_window() {
    local window_title="$1"

    if [ "$window_title" == "gnome-terminal" ]; then #https://www.reddit.com/r/linuxquestions/comments/pxv21n/shortcut_to_navigate_to_open_terminal/
        wmctrl -xFa gnome-terminal-server.Gnome-terminal
    else
        wmctrl -a "$window_title" 
        #wmctrl -r "$window_title" -b toggle,fullscreen
        wmctrl -r "$window_title" -b add,maximized_verti,maximized_horz
    fi
}

launch_program() {
    local program_name="$1"
    
    # Common program paths and commands
    case "$program_name" in
        "firefox")
            firefox &
            ;;
        "chrome")
            google-chrome &
            ;;
        "cursor")
            cursor &
            ;;
        "telegram")
            telegram-desktop &
            ;;
        "terminal"|"gnome-terminal")
            gnome-terminal &
            ;;
        "obsidian")
            obsidian &
            ;;
        "vivaldi") # in /snap/bin 
            vivaldi.vivaldi-stable &
            ;;
        "todoist")
            todoist &
            ;;
        *)
            # Try to launch the program directly
            "$program_name" &
            ;;
    esac
}

# Main function
main() {
    logger "focus_or_launch: === Script started ==="
    logger "focus_or_launch: Arguments received: $#"
    logger "focus_or_launch: All arguments: $@"
    
    if [ $# -eq 0 ]; then
        echo "Usage: $0 <program_name>"
        echo "Example: $0 firefox"
        echo ""
        echo "Supported programs:"
        echo "  firefox, chrome, cursor, telegram, terminal, obsidian"
        echo "  vivaldi, todoist"
        echo ""
        exit 1
    fi
    
    local window_title="$1"
    
    if app_is_running "$window_title"; then
        logger "focus_or_launch: App $window_title is running, focusing window..."
        focus_window "$window_title"
    else
        logger "focus_or_launch: App $window_title is not running, launching..."
        launch_program "$window_title"
    fi
    
    logger "focus_or_launch: === Script completed ==="
}

# Run the main function with all arguments
main "$@"
