# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Calendar Versioning](https://calver.org/).

## [Unreleased]

### Changed

- neovim: Swap ncm for coc
- neovim: Tweaks to sneak and nerdtree

### Added

- neovim: Asciidoctor plugin and example settings

## [2020.01]

### Added

- neovim: add initial ALEFix integration
- neovim: add fugitive plug
- neovim: add nerdtree
- neovim: add lightline-ale and some config
- neovim: add git-gutter plug and setting

### Changed

- neovim: leader>w now fixed, leader>s now also sends <CR>
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

[unreleased]: https://github.com/daogilvie/dotfiles/compare/v2020.01...HEAD
[2020.01]: https://github.com/daogilvie/dotfiles/releases/tag/v2020.01
[2019.12.2]: https://github.com/daogilvie/dotfiles/releases/tag/v2019.12.2
[2019.12]: https://github.com/daogilvie/dotfiles/releases/tag/v2019.12
[2019.11]: https://github.com/daogilvie/dotfiles/releases/tag/v2019.11
[2019.09]: https://github.com/daogilvie/dotfiles/releases/tag/v2019.09
