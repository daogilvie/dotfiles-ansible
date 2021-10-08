# Dotfiles

This repository stores my config as Ansible roles (>2.5).

## Installing

Invoke using the `install.sh` script provided. Tags, if provided, should be
comma-separated.

`./install.sh OPTIONAL_TAGS_FOR_ROLES`

## Current Roles

| Role             | Tags           | Description                                                                        |
| ---------------- | -------------- | ---------------------------------------------------------------------------------- |
| **fish**         | `fish`         | Installs [fish shell][fish], plus some config, then installs and executes [fisher] |
| **cli**          | `cli`          | Installs [asdf], [exa], [entr], [ripgrep], [ag], [rg], [fzf], [jq] and [boxes]     |
| **git**          | `git`, `cli`   | Installs git and sets up some configuration                                        |
| **nvim**         | `nvim`, `cli`  | Installs [neovim] with config, and runs [PlugInstall][vim-plug]                    |
| **editorconfig** | `editorconfig` | Places a root [editorconfig] file into the home directory                          |
| **jupyter**      | `jupyter`      | Install a custom jupyter notebook css file                                         |

[fish]: https://fishshell.com/
[fisher]: https://github.com/jorgebucaran/fisher
[asdf]: https://asdf-vm.com/#/
[exa]: https://the.exa.website/
[entr]: http://eradman.com/entrproject/
[ripgrep]: https://github.com/BurntSushi/ripgrep
[ag]: https://github.com/ggreer/the_silver_searcher
[rg]: https://github.com/BurntSushi/ripgrep
[fzf]: https://github.com/junegunn/fzf
[jq]: https://stedolan.github.io/jq/
[neovim]: https://neovim.io/
[vim-plug]: https://github.com/junegunn/vim-plug
[boxes]: https://boxes.thomasjensen.com/
[editorconfig]: https://editorconfig.org/
