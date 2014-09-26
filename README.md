## Ecliptic.vim: Amicable Clipboard Integration

#Motivation

Juggling between vim's local clipboard and the system clipboard is a headache.
The plus register (e.g. ```"+yy```,  ```"+p```) hinders workflows that require even minimal use of the clipboard.
It is a significant amount of keystrokes, and the keys are not in incovenient places.

### What Happens In Vim Stays In Vim

Ecliptic is for those who find vim's builtin solution (```:set clipboard=unamedplus```) inconvenient.
When using ```unamedplus``` the system clipboard gets polluted with the text of every yank and delete command.
Perpetually binding the clipboard to the unnamed register can be confusing and annoying for some.
The unamed register is frequently modified more than the clipboard is used.

# Enter Ecliptic

Ecliptic maps the power of ```"+``` to a more natural interface.
All of its mapping start with the ```c``` prefix (mneumonic for clipboard).

By default ```c``` is just an operator, so many ```c-letter``` bindings are unmapped.
Ecliptic's mappings do not clobber default vim functionality.
#Usage

##Yank Proxies

<table>
  <tbody>
    <tr>
      <td><code> cy{motion} </code></td>
      <td>y yank</td>
    </tr>
    <tr>
      <td><code> cyy </code></td>
      <td>yy</td>
    </tr>
    <tr>
      <td><code> cY </code></td>
      <td>Y</td>
    </tr>
    <tr>
      <td><code> {Visual}cy </code></td>
      <td>v_y</td>
    </tr>
    <tr>
      <td><code> {Visual}cY </code></td>
      <td>v_Y</td>
    </tr>
  </tbody>
</table>


##Delete Proxies

<table>
  <tbody>
    <tr>
      <td><code> cd{motion} </code></td>
      <td>d</td>
    </tr>
    <tr>
      <td><code> cdd </code></td>
      <td>dd</td>
    </tr>
    <tr>
      <td><code> cD </code></td>
      <td>D</td>
    </tr>
    <tr>
      <td><code> {Visual}cd </code></td>
      <td>v_d</td>
    </tr>
    <tr>
      <td><code> {Visual}cD </code></td>
      <td>v_D</td>
    </tr>
  </tbody>
</table>

##Put Proxies

<table>
<tr>
  <td><code> cp </code></td>
  <td>p put</td>
</tr>
<tr>
  <td><code> cP </code></td>
  <td>P</td>
</tr>
<tr>
  <td><code> cgp </code></td>
  <td>gp</td>
</tr>
<tr>
  <td><code> cgP </code></td>
  <td>gp</td>
</tr>
<tr>
  <td><code> {Visual}cp </code></td>
  <td>replace visual selection with clipboard</td>
</tr>
</table>

## Custom Prefix

By default Ecliptic sets the prefix to ```c``` as a mneumonic for clipboard.
This can be changed by setting the ```g:ecliptic_prefix``` variable in your .vimrc.

Here is an exampe remapping the prefix to the ```-``` key:

```
let g:ecliptic_prefix = '-'
```

Now commands like ```-yy```, and ```-p``` will invoke Ecliptic commands.

#Examples

\* *cursor position represented by [ ]*

<table>
  <thead> <tr> <td> Before </td> <td> Command </td> <td> Result </td> </tr> <thead>
  <tbody>
    <tr>
      <td>
        buffer:<i>"[A]nd, you ask why I don't live here?"</i><br>
        clipboard: <i>foobar</i><br>
        unnamed: <i>baz</i>
      </td>
      <td>
        <code>dW cyy </code>
      </td>
      <td>
        vim line:<i>"And, [y]ou ask why I don't live here?"</i><br>
        clipboard: <i>"you ask why I don't live here?"</i><br>
        unnamed: <i>And,</i>
      </td>
    </tr>

    <tr>
      <td>
        cursor at start of line:<i>"[H]oney how come you don't move"</i><br>
        clipboard: <i>Babe</i><br>
        unnamed: <i>baz</i>
      </td>
      <td>
        <code>dw cp</code>
      </td>
      <td>
        vim line:<i>"Babe[ ]how come you don't move"</i><br>
        clipboard: <i>Babe</i><br>
        unnamed: <i>Honey</i>
      </td>
    </tr>
  </tbody>
</table>


# Installation


## +Cliboard Requirement

Ecliptic makes use of the ```"+``` register, which gets enabled during installation.

The plugin will not work without the ```+clipboard``` option which exposes the ```"+``` register.

Run the following command to check for ```+clipboard``` flag:

```
$ vim --version | grep +clipboard || echo 'Ecliptic requires +clipboard'
```

If it does not return *'Ecliptic requires +clipboard'*, then you are good to go.

If you are missing the flag, then you need to reinstall vim.
Installation varies system to system.
Heres an example of how to do it on Mac OS X with homebrew.

```
$ brew install macvim --override-system-vim
```

A google search can help you get a proper vim installation on other systems.

## Vundle Users

Add the following line to your .vimrc

```
Bundle "richsoni/vim-ecliptic"
```

## Pathogen Users

```
$ cd ~/.vim/bundle
$ git clone git://github.com/richsoni/vim-ecliptic.git
```


