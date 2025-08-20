#!/bin/bash

# Focus or Launch Script for Ubuntu with Wayland
# Usage: ./focus_or_launch.sh <program_name>
# Example: ./focus_or_launch.sh firefox

app_is_running() {
    local window_title="$1"
    
    #local pid=$(pgrep -f "$window_title")
    local pid=$(ps -ef | grep "$window_title" | grep -v grep | grep -v "focus_or_launch.sh")
     echo "Debug: pgrep found PID: '$pid' for '$window_title'"
    [ -n "$pid" ]
}

focus_window() {
    local window_title="$1"
    wmctrl -a "$window_title" 
}

launch_program() {
    local program_name="$1"
    
    # Common program paths and commands
    case "$program_name" in
        "firefox")
            firefox &
            ;;
        "chrome"|"google-chrome")
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
        "vivaldi")
            vivaldi &
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
    echo "=== Focus or Launch Script ==="
    echo "Arguments received: $#"
    echo "All arguments: $@"
    
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
        echo "App is running, focusing window..."
        focus_window "$window_title"
    else
        echo "App is not running, launching..."
        launch_program "$window_title"
    fi
    
    echo "=== Script completed ==="
}

# Run the main function with all arguments
main "$@"
