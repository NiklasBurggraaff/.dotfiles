#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

main()
{
  # set configuration option variables
  show_fahrenheit=$(get_tmux_option "@penumbra-show-fahrenheit" true)
  show_location=$(get_tmux_option "@penumbra-show-location" false)
  fixed_location=$(get_tmux_option "@penumbra-fixed-location")
  show_flags=$(get_tmux_option "@penumbra-show-flags" false)
  show_military=$(get_tmux_option "@penumbra-military-time" true)
  show_timezone=$(get_tmux_option "@penumbra-show-timezone" false)
  show_left_sep=$(get_tmux_option "@penumbra-show-left-sep" )
  show_right_sep=$(get_tmux_option "@penumbra-show-right-sep" )
  show_border_contrast=$(get_tmux_option "@penumbra-border-contrast" false)
  show_day_month=$(get_tmux_option "@penumbra-day-month" true)
  show_refresh=$(get_tmux_option "@penumbra-refresh-rate" 5)
  show_kubernetes_context_label=$(get_tmux_option "@penumbra-kubernetes-context-label" "")
  IFS=' ' read -r -a plugins <<< $(get_tmux_option "@penumbra-plugins" "battery time")

  # Penumbra Dark+ Color Pallette
  white='color07'
  neutral='color08'
  light_gray='#3E4044'
  gray='#24262a'
  dark_gray='color00'
  red='color01'
  green='color02'
  yellow='color03'
  blue='color04'
  magenta='color05'
  cyan='color06'

  # Handle powerline option
  right_sep="$show_right_sep"
  left_sep="$show_left_sep"

  # Set timezone unless hidden by configuration
  case $show_timezone in
    false)
      timezone="";;
    true)
      timezone="#(date +%Z)";;
  esac

  case $show_flags in
    false)
      flags=""
      current_flags="";;
    true)
      flags="#{?window_flags,#[fg=${blue}]#{window_flags},}"
      current_flags="#{?window_flags,#[fg=${magenta}]#{window_flags},}"
  esac

  # sets refresh interval to every 5 seconds
  tmux set-option -g status-interval $show_refresh

  # set the prefix + t time format
  if $show_military; then
    tmux set-option -g clock-mode-style 24
  else
    tmux set-option -g clock-mode-style 12
  fi

  # set length
  tmux set-option -g status-left-length 100
  tmux set-option -g status-right-length 100

  # pane border styling
  if $show_border_contrast; then
    tmux set-option -g pane-active-border-style "fg=${magenta}"
  else
    tmux set-option -g pane-active-border-style "fg=${blue}"
  fi
  tmux set-option -g pane-border-style "fg=${gray}"

  # message styling
  tmux set-option -g message-style "bg=${gray},fg=${white}"

  # status bar
  tmux set-option -g status-style "bg=${gray},fg=${white}"

  # Status left
  tmux set-option -g status-left "#[bg=${green},fg=${dark_gray}]#{?client_prefix,#[bg=${yellow}],} #S #[fg=${green},bg=${gray}]#{?client_prefix,#[fg=${yellow}],}${left_sep} "
  powerbg=${gray}

  # Status right
  tmux set-option -g status-right ""

  for plugin in "${plugins[@]}"; do

    if [ $plugin = "git" ]; then
      IFS=' ' read -r -a colors  <<< $(get_tmux_option "@penumbra-git-colors" "green dark_gray")
        script="#($current_dir/git.sh)"     
    fi

    if [ $plugin = "battery" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@penumbra-battery-colors" "red dark_gray")
      script="#($current_dir/battery.sh)"
    fi

    if [ $plugin = "gpu-usage" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@penumbra-gpu-usage-colors" "red dark_gray")
      script="#($current_dir/gpu_usage.sh)"
    fi

    if [ $plugin = "cpu-usage" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@penumbra-cpu-usage-colors" "orange dark_gray")
      script="#($current_dir/cpu_info.sh)"
    fi

    if [ $plugin = "ram-usage" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@penumbra-ram-usage-colors" "cyan dark_gray")
      script="#($current_dir/ram_info.sh)"
    fi

    if [ $plugin = "network" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@penumbra-network-colors" "cyan dark_gray")
      script="#($current_dir/network.sh)"
    fi

    if [ $plugin = "network-bandwidth" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@penumbra-network-bandwidth-colors" "cyan dark_gray")
      tmux set-option -g status-right-length 250
      script="#($current_dir/network_bandwidth.sh)"
    fi

    if [ $plugin = "network-ping" ]; then
      IFS=' ' read -r -a colors <<<$(get_tmux_option "@penumbra-network-ping-colors" "cyan dark_gray")
      script="#($current_dir/network_ping.sh)"
    fi

    if [ $plugin = "kubernetes-context" ]; then
      IFS=' ' read -r -a colors <<<$(get_tmux_option "@penumbra-kubernetes-context-colors" "cyan dark_gray")
      script="#($current_dir/kubernetes_context.sh $show_kubernetes_context_label)"
    fi

    if [ $plugin = "time" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@penumbra-time-colors" "blue white")
      if $show_day_month && $show_military ; then # military time and dd/mm
        script="%a %d/%m %R ${timezone} "
      elif $show_military; then # only military time
        script="%a %m/%d %R ${timezone} "
      elif $show_day_month; then # only dd/mm
        script="%a %d/%m %I:%M %p ${timezone} "
      else
        script="%a %m/%d %I:%M %p ${timezone} "
      fi
    fi

    tmux set-option -ga status-right "#[fg=${!colors[0]},bg=${powerbg},nobold,nounderscore,noitalics]${right_sep}#[fg=${!colors[1]},bg=${!colors[0]}] $script "
    powerbg=${!colors[0]}
  done

  # Window option
  tmux set-window-option -g window-status-current-format "#[fg=${blue},bg=${gray}]#[fg=${white},bg=${blue}]#I#[fg=${blue},bg=${neutral}]#[fg=${white}]#[bg=${neutral}] #W${current_flags}#[fg=${neutral}]#[bg=${gray}]"

  tmux set-window-option -g window-status-format "#[fg=${light_gray}]#[bg=${gray}]#[fg=${white}]#[bg=${light_gray}]#I#[fg=${light_gray}]#[bg=${dark_gray}]#[fg=${white}]#[bg=${dark_gray}] #W${flags}#[fg=${dark_gray}]#[bg=${gray}]"
  tmux set-window-option -g window-status-activity-style "bold"
  tmux set-window-option -g window-status-bell-style "bold"
}

# run main function
main
