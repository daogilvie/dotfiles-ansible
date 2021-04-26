# Dotfiles

This repo stores my dotfiles as Ansible roles (>2.5).

## Installing

Invoke using the `install.sh` script provided. Tags, if provided, should be comma-seperated.

`./install.sh OPTIONAL_TAGS_FOR_ROLES`

## Current Roles

| Role             | Tags           | Description                                                                        |
| ---------------- | -------------- | ---------------------------------------------------------------------------------- |
| **fish**         | `fish`         | Installs [fish shell][fish], plus some config, then installs and executes [fisher] |
| **cli**          | `cli`          | Installs [exa], [entr], [ripgrep], [ag], [rg], [fzy], [jq] and [boxes]                   |
| **git**          | `git`, `cli`   | Installs git and sets up some configuration                                        |
| **nvim**         | `nvim`, `cli`  | Installs [neovim] with config, and runs [PlugInstall][vim-plug]                    |
| **pyenv**        | `pyenv`, `cli` | Installs [pyenv] and [pyenv-virtualenv] using direct git method                    |
| **editorconfig** | `editorconfig` | Places a root [editorconfig] file into the home directory                          |
| **jupyter**      | `jupyter`      | Install a custom jupyter notebook css file                                         |

[fish]: https://fishshell.com/
[fisher]: https://github.com/jorgebucaran/fisher
[exa]: https://the.exa.website/
[entr]: http://eradman.com/entrproject/
[ripgrep]: https://github.com/BurntSushi/ripgrep
[ag]: https://github.com/ggreer/the_silver_searcher
[rg]: https://github.com/BurntSushi/ripgrep
[fzy]: https://github.com/jhawthorn/fzy
[jq]: https://stedolan.github.io/jq/
[neovim]: https://neovim.io/
[vim-plug]: https://github.com/junegunn/vim-plug
[pyenv]: https://github.com/pyenv/pyenv
[pyenv-virtualenv]: https://github.com/pyenv/pyenv-virtualenv
[boxes]: https://boxes.thomasjensen.com/
[editorconfig]: https://editorconfig.org/
