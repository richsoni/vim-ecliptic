# Ecliptic.vim

##INTRODUCTION

Using the clipboard with vim is one of its biggest painpoints.
This plugin attempts to expose some mappings that make using the clipboard more sane.

It eclipses your regular clipboard functionality, vim's yank and put commands.

The mneumonic *c* prefixes each command (think clipboard).

## Installation

### Vundle

Add the following line to your .vimrc

```
Bundle "richsoni/vim-ecliptic"
```

### Pathogen

```
cd ~/.vim/bundle
git clone git://github.com/richsoni/vim-ecliptic.git
```

##YANK PROXIES

  - cy{motion} ~    *y* *yank*
  - cyy        ~    *yy*
  - cY         ~    *Y*
  - {Visual}cy ~    *v_y*
  - {Visual}cY ~    *v_Y*

##PUT PROXIES

  - cp         ~    *p* *put*
  - cP         ~    *P*
  - cgp        ~    *gp*
  - cgP        ~    *gp*
  - {Visual}cp ~    replace visual selection with clipboard

## License

Copyright © Rich Soni.  Distributed under the same terms as Vim itself.
See `:help license`.
