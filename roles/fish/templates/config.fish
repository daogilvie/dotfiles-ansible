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

# Hook direnv if present
if command -sq direnv
    direnv hook fish | source
end

# Hook in asdf if present
if command -sq asdf
    set -g -x ASDF_DIR (brew --prefix asdf)
    source (brew --prefix asdf)/asdf.fish
    # Conditional integration of asdf + direnv
    if asdf plugin list | grep -q direnv
        asdf exec direnv hook fish | source
        function direnv
            asdf exec direnv $argv
        end
    end
end

# Activate starship prompt
starship init fish | source

# SSH Agent
if command -sq ssh-agent
    eval (ssh-agent -c) > /dev/null ^ /dev/null
end

# GPG Agent
if command -sq gpg-agent
    gpg-agent --daemon > /dev/null ^ /dev/null
    set -gx GPG_TTY (tty)
end

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
