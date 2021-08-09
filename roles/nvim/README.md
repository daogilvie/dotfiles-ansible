# nvim

Install neovim with my templated setup.

## Layout

### init.vim

My `init.vim` is mostly just an install of junegunn's plug.vim, and then several
package declarations. See the files directory.

### Other files

I template/copy in several other files into the `plugin` directory. Only
core*options.vim is a template, as it includes a path calculation for the python
provider. Neovim will load all of these files after loading the init.vim file,
so I tend to \_roughly* group related config items together. Format is still
evolving, and will probably do so forever.
