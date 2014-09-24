## Ecliptic.vim: Amicable Clipboard Integration

#Motivation
<a https://github.com/richsoni/vim-ecliptic>View Github Repo</a>

Juggling between vim's local clipboard and the system clipboard is a headache.
Accessing the plus register (e.g. ```"+yy```,  ```"+p```) is awkward and unintuitive.
It is a hinderance in workflows that require even moderate amounts of clipboard usage.

### What Happens In Vim Stays In Vim

Vim's builtin solution:  ```:set clipboard=unamedplus``` is unnatural.
The system clipboard gets polluted with the text of every yank and delete command.
This gets confusing, and annoying.
Any seasoned vimmer is accustomed to keeping their clipboard private.

**Getting and setting the clipboard should is a special case in a vim workflow.**

# Enter Ecliptic


Ecliptic maps the power of ```"+``` to a more natural interface.
Namely, through the ```c``` prefix (mneumonic for clipboard).

By default ```c``` is just an operator, so many ```c-letter``` bindings are unmapped.
As such, Ecliptic exposes bindings that will not clobber default vim functionality.

#Examples

>  1|  Even the butler hes got something to prove.  
>  2|  And, you ask why I don't live here?  
>  3|  Honey how come you don't move

For each assume the following:
  <ul class='default'>
    <li> We are working with the above buffer </li>
    <li> initial clipboard="foobar" </li>
    <li> initial unnamed(```""```) register=*"baz"*
  </ul>

After ```cyy``` on line 2: clipboard = *"And, you ask why I don't live here?"*

After ```cyaw``` on line 1 over *something*: clipboard =  *"something "*

Assume Visual Line on line 3; After ```cy```: clipboard = *"Honey how come you don't move"*

After ```cP``` on line 2, line 2 = *"foobarAnd, you ask why I don't live here?"*

After ```cp``` on line 2, line 2 = *"Afoobarnd, you ask why I don't live here?"*

Assume visually selected *And* on line 2;  After ```cp``` line 2 = *"foobar, you ask why I don't live here?"*

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

# Installation

<a https://github.com/richsoni/vim-ecliptic>View Github Repo</a>

## +Cliboard is required

Ecliptic makes use of the ```"+``` register, which is not always available.

Check to make sure your version is compiled with clipboard by running this command in the terminal.

```
vim --version | grep +clipboard || echo 'Ecliptic requires +clipboard'
```

Vim installation varies system to system, but heres an example of how to get +clipboard on Mac OS X with homebrew.

```
brew install macvim --override-system-vim
```

A google search can help you get a proper vim installation on other systems.

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


