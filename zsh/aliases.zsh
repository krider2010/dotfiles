alias reload!='. ~/.zshrc'

# Support for 1Password CLI to provide a PAT for GitHub gh CLI
# https://developer.1password.com/docs/cli/shell-plugins/github/
export OP_PLUGIN_ALIASES_SOURCED=1
alias gh="op plugin run -- gh"
