# Base16 color schemes for nvim

Install with something like Plug:

    Plug 'Soares/base16.vim'

Check the docs:

    :help base16

Spoiler alert: You can configure the color schemes with things like

    let g:base16_color_overrides = {'Comment': 'fg=green'}

and you can use a transparent background, if you want, via

    let g:base16_transparent_background = 1

When you're ready, use a colorscheme of your choice:

    :set background=dark
    :colorscheme summerfruit

You're welcome to change colorschemes on the fly.

It's also easy to make your own base16 color scheme, see the `schemes/`
directory for details. Basically, all you need to do is make a yaml file with
16 hex values in it. For reference, the order is:

    black dark3 dark2 dark1 light1 light2 light3 white
    red orange yellow green aqua blue purple brown

If you change the templates or add schemes, run `python buildall.py` to
generate all the pretty new color files. You'll need
[base16-builder](https://github.com/base16-builder/base16-builder).
