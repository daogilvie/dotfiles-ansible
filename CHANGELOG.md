# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Calendar Versioning](https://calver.org/).

## [Unreleased]

### Added

- nvim: Add everything needed for nvim biscuits

### Changed

- nvim: Telescope file browser now a separate plugin
- fish: Change out deprecated ssh-add -A flag (monterey)

### Removed

- nvim: Several plugins and config items I don't use

## [2021.10.1]

### Fixed

- nvim: custom action works with file_browser dir switch

## [2021.10]

### Added

- cli: new packages choose-rust, zoxide, dust
- fish: use zoxide if present
- nvim: Plugin evanleck/vim-svelte
- nvim: Plugin tpope/vim-rhubarb
- nvim: Plugin tpope/vim-dispatch
- nvim: Plugin tpope/vim-unimpaired
- cli: gpg config
- nvim: Doge and snippet config
- nvim: Add tpope's unimpaired (mainly for conflict marker objects)
- nvim: Add terraform
- nvim: Add zig
- nvim: Binding for telescope file explorer

### Changed

- nvim: Swap nerd commenter for vim commentary (also ts-context-commentstring)
- nvim: init.vim now not a template
- fish: refreshed github tokens
- cli: packages now supplied as list from defaults in role
- nvim adapt telescope to new options structure (changelogs 922 & 839)
- nvim: Tweak search bindings
- nvim: Swap back to fzf from fzy, and add basic multi-select to telescope
- cli: Swap back to fzf from fzy

### Fixed

- fish: config.fish /dev/null redirects work in 3.3.0
- Ansible: clean up install script lint errors
- Ansible: version checker now handles new [core X.X.X] format
- nvim: Can't use non-recursive mappings with \<Plug\> commands

### Removed

- fish: jethrokuan/z plugin (replaced by zoxide)
- fish: unused personal github token
- nvim: UndoTree — I just never use it.

## [2021.04.1]

### Changed

- nvim: Stopped disabling open-in-split C-X for telescope

### Fixed

- nvim: changed clashing keybind for delete-then-paste
- Tweaked out-of-date readme

## [2021.04]

### Added

- git: add .vim to global ignore file
- nvim: some new navigation keybinds

### Changed

- nvim: use telescope and plugin structure

### Removed

- git: requirements.in removed from global ignore file
- nvim: remove easymotion, sneak

## [2021.03]

### Added

- fish: Add ssh-add -q -A for the agent
- cli: Add gnupg
- fish: Add asdf direnv integration
- git: Add asdf and direnv ignores
- cli: Add fd package
- all: Add tasks to ensure config dirs exist
- ansible: Add hosts file to suppress implicit localhost message
- neovim: Add maximizer

### Changed

- fish: Update fishfile package names
- all: Remove pyenv config, replacing with asdf.
- neovim: Change default fzf command to include hidden files
- neovim: Change my word search keybinds (twice)

### Removed

- fish: Remove barnybug docker from fishfile

## [2020.09]

### Added

- fish: Starship config file added
- neovim: Add emoji completion
- neovim: Add stylus plugin
- neovim: Introduce FastFold for performance
- neovim: Add ultisnips and vim-snippets
- neovim: Add window switch movement
- neovim: Add NERDTreeFind keybind

### Changed

- neovim: Always replace the init file (with backups)
- neovim: Disable providers I don't use
- neovim: harmonise fixers
- neovim: Swap to Nord theme

### Removed

- neovim: Remove ALE, use only COC

## [2020.04]

### Added

- neovim: tpope/vim-surround plugin
- neovim: Asciidoctor plugin and example settings
- neovim: Yaml fold plugin
- neovim: colorcolumn at 80
- git: Add Session.vim to global ignore
- git: Add publish alias
- fish: Add nvses abbreviation

### Changed

- fish: update fishfile
- neovim: Swap filename for relativepath in lightline
- neovim: Swap ncm for coc
- neovim: Tweaks to sneak and nerdtree
- neovim: Plugged will auto-install if not present
- neovim: Swap plasticboy->gabrielelana for markdown
- neovim: consolidate and add to lightline config
- neovim: Add R and r nuance for coc symbol search
- neovim: Add surround plugin
- neovim: NerdCommenter configuration added
- neovim: Set spelllang to en_gb
- neovim: Change wildmenu to move onto longest match
- neovim: Modify lightline elements to include git branch

## [2020.01]

### Added

- neovim: add initial ALEFix integration
- neovim: add fugitive plug
- neovim: add nerdtree
- neovim: add lightline-ale and some config
- neovim: add git-gutter plug and setting

### Changed

- neovim: `leader>w` now fixed, `leader>s` now also sends `<CR>`
- neovim: move Files to leader--f to free C-p for word completion
- neovim: nnoremap swap ; and : for simple ex-commands
- neovim: Splits now open below and right

### Removed

- neovim: Remove bn and bp keymaps as they conflict with iterm

## [2019.12.2]

### Added

- cli: fzf and ranger added to install list

### Changed

- ansible: swap to `loop` from `with_items` (now need >= 2.5)
- fish: swap to starship prompt
- install: Cows now opt-in

## [2019.12]

### Added

- neovim: path setting to enable built-in recursive find
- neovim: plugins for various additional syntax types
- neovim: setting for default 3-deep fold
- neovim: C-P mapping for Files command

### Removed

- neovim: Unneeded Files command spec.

### Fixed

- neovim: CARGO_TARGET_DIR removed, I didn't fix it when copying from jonhoo

## [2019.11]

### Changed

- Nvim leader is SPACE and easymotion is included

## [2019.09]

### Added

- Initial tagged version

[unreleased]: https://github.com/daogilvie/dotfiles/compare/v2021.10.1...HEAD
[2021.10.1]: https://github.com/daogilvie/dotfiles/releases/tag/v2021.10.1
[2021.10]: https://github.com/daogilvie/dotfiles/releases/tag/v2021.10
[2021.04.1]: https://github.com/daogilvie/dotfiles/releases/tag/v2021.04.1
[2021.04]: https://github.com/daogilvie/dotfiles/releases/tag/v2021.04
[2021.03]: https://github.com/daogilvie/dotfiles/releases/tag/v2021.03
[2020.09]: https://github.com/daogilvie/dotfiles/releases/tag/v2020.09
[2020.04]: https://github.com/daogilvie/dotfiles/releases/tag/v2020.04
[2020.01]: https://github.com/daogilvie/dotfiles/releases/tag/v2020.01
[2019.12.2]: https://github.com/daogilvie/dotfiles/releases/tag/v2019.12.2
[2019.12]: https://github.com/daogilvie/dotfiles/releases/tag/v2019.12
[2019.11]: https://github.com/daogilvie/dotfiles/releases/tag/v2019.11
[2019.09]: https://github.com/daogilvie/dotfiles/releases/tag/v2019.09
