#!/usr/bin/env bash

tmux_sessions=$(tmux list-sessions -F "#{session_name}")

if [[ $# -eq 1 ]]; then
    selected=$1
else
    current_sesion=""
    if [[ $TMUX ]]; then
        current_session=$(tmux display-message -p '#S')
    fi
    other_tmux_sessions=$(echo "$tmux_sessions" | sed "/^$current_session$/d")

    projects=$(ls -dt ~/Developer/*/*)

    selected=$(printf "$other_tmux_sessions\n$projects" | sed '/^$/d' | fzf --header "Select session")
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

if [[ $TMUX ]]; then
    tmux switch-client -t $selected_name
else
    tmux attach-session -t $selected_name
fi
