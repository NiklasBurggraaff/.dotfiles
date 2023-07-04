alias fs="eufs"

alias eufscd="cd \$EUFS_MASTER && cd \$(command find -L . -mindepth 1 \\( -path '*/\\.*' -o -path '*/build/*' -o -path '*/install/*' -o -path '*/data/*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
	-o -type d -print 2> /dev/null | cut -b3- | (echo '.'; cat -) | fzf --height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-})"
alias fscd="eufscd"
