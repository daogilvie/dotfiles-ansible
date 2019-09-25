test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Set nvim as editor
set -g -x EDITOR nvim
set -g -x VISUAL nvim

# And less as pager
set -g -x PAGER less

# Configure Homebrew's github token
set -g -x HOMEBREW_GITHUB_API_TOKEN "{{ homebrew_github }}"
set -g -x GITHUB_USER daogilvie
set -g -x GITHUB_TOKEN "{{ daogilvie_github }}"

# Set Java home *shudder*
set -g -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home/jre/

# Set gopath
set -g -x GOPATH ~/go

# Disable virtualenv's default ugly prompt.
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# Invoke pyenv and  pyenv-virtualenv
if command -sq pyenv
    status --is-interactive; and source (pyenv init -|psub)
    status --is-interactive; and source (pyenv virtualenv-init -|psub)
end

# Enable some options in bobthefish
set -g theme_nerd_fonts yes
set -g theme_display_hg yes
set -g theme_newline_cursor yes
set -g theme_color_scheme solarized-dark
set -g theme_display_virtualenv yes
set -g theme_display_docker_machine yes

# SSH Agent
eval (ssh-agent -c) > /dev/null ^ /dev/null

# GPG Agent
gpg-agent --daemon > /dev/null ^ /dev/null
set -gx GPG_TTY (tty)

# We use -g not -U for fish user paths so that we can set it each time in conf

# Add Cargo to path
set -g fish_user_paths ~/.cargo/bin $fish_user_paths

# Add .local/bin to path (used by pipsi)
set -g fish_user_paths ~/.local/bin $fish_user_paths

# Add the icubin for paths
set -g fish_user_paths /usr/local/opt/icu4c/bin $fish_user_paths
set -g fish_user_paths /usr/local/opt/icu4c/sbin $fish_user_paths
set -g fish_color_match -o --background=93A1A1 268bd2

# Add sbin
set -g fish_user_paths /usr/local/sbin $fish_user_paths

# Enable VI mode bindings
fish_vi_key_bindings
