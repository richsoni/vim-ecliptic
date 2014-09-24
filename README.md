## Ecliptic.vim: Amicable Clipboard Integration

#Motivation

A big painpoint during vim usage is jumping between its local clipboard, and the global system clipboard.
The desired effect can often be achieved, but solutions are often complicated.
This is especially true when attempting to address both yank and put commands.
Adding visual mode into the mix creates even more ambiguity around the strategy.

It is possible to blindly link the clipboard to the default register: ```:set clipboard=unamedplus```.
However, this does not feel natural because the system clipboard gets polluted with every yank, and delete.
Additionally, when a string of text is loaded to be pasted in vim, the user has to remember to use a seperate register for all command preceding the paste.

Without doing anything, vim users can access the clipboard through the "+ register if it is available.
Doing "+yy, or "+p is not only awkward, but not intuitive.
Still, this approach seems more user friendly than the unamedplus clipboard method which often leaves the user guessing the state of the registers and clipboard.

This plugin attempts to exposes a natural set of mappings that give the user the power of the "+, but with a more intuitive interface.
Namely, the *c* character (mneumonic for clipboard).

#Examples

#Usage
##YANK PROXIES

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

##PUT PROXIES

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

# Installation

## Vundle

Add the following line to your .vimrc

```
Bundle "richsoni/vim-ecliptic"
```

## Pathogen

```
cd ~/.vim/bundle
git clone git://github.com/richsoni/vim-ecliptic.git
```

## License

Copyright © Rich Soni.  Distributed under the same terms as Vim itself.
See `:help license`.
