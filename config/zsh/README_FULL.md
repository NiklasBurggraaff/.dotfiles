# My ZSH Config (FULL)

Use `?` alias to view README
Use `??` alias to view full README

## Shortcuts

- `Ctrl + r`: Search history using fzf
- `Ctrl + t`: Search for file using fzf
- `Alt + c`: `cd` using fzf

## Aliases

- `d`: List directory stack
- `1` - `9`: Jump to directory in stack
- `**`: fzf completion
- `ls`: Uses `lsd` instead of `ls`
- `la`: List all files
- `ll`: List files with details
- `lh`: List files
- `tr`: List files in tree format (depth 2)
- `tra`: Tree of all files (depth 2)
- `trl`: Tree of files with details (depth 2)
- `tree`: List files in tree format (depth 8)
- `treea`: Tree of all files (depth 8)
- `treel`: Tree of files with details (depth 8)
- `z`: Use `zoxide` to jump to directory
- `du`: List disk usage

## Tools

- fd: `fd <pattern>` to search for files
- bat: `bat <file>` to view code
- glow: `glow <file>` to view markdown
- btop: `btop` to view system resources
  - config: `~/.config/btop/btop.conf`
- lsd: `lsd` to list files (alternative to `ls`)
  - config: `~/.config/lsd/config.yaml`
- dust: `dust` to view disk usage
- awk: `awk '<pattern>' <file>` to search for pattern
- sed: `sed 's/<find>/<replace>/'` to find and replace
- jq: `jq '<transform>` to transform JSON
- tail: `tail -f <file>` to view file changes
- head: `head -n <number> <file>` to view first n lines of file
- zoxide: `z <directory>` to jump to directory
- oha: `oha <url> -z <duration>` to test HTTP endpoints

## ZSH Plugins

- Powerlevel10k: Terminal prompt
- ZSH Syntax Highlighting: Syntax highlighting for commands
- ZSH Completions: Completions for commands
- ZSH Autosuggestions: Suggest commands based on history
