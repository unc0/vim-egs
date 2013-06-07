This project adds [egs] templating system support to the vim editor.

[egs]: http://ckknight.github.io/egs/

### Install with Unbundle

Since this plugin has rolling versions based on git commits, using unbundle and
git is the preferred way to install. The plugin ends up contained in its own
directory and updates are just a `git pull` away.

1. Git clone sunaku's [unbundle] into `~/.vim/bundle/` and add this line to your
   `vimrc`:

        runtime bundle/vim-unbundle/unbundle.vim

    To get the all the features of this plugin, make sure you also have a
    `filetype plugin indent on` line in there.

[unbundle]: https://github.com/sunaku/vim-unbundle

2. Make sure you installed [vim-gorilla-script] first.

[vim-gorilla-script]: https://github.com/unc0/vim-gorilla-script

3. Create and change into `~/.vim/ftbundle/egs`:

        $ mkdir -p ~/.vim/ftbundle/egs
        $ cd ~/.vim/ftbundle/egs

4. Make a clone of the `vim-egs` repository:

        $ git clone https://github.com/unc0/vim-egs.git

5. Link or copy `vim-gorilla-script` to `ftbundle/egs`

        $ cd ~/.vim/ftbundle/egs
        $ ln -s ~/.vim/ftbundle/gorilla/vim-gorilla-script

#### Updating

1. Change into `~/.vim/ftbundle/egs/vim-egs/`:

        $ cd ~/.vim/ftbundle/egs/vim-egs

2. Pull in the latest changes:

        $ git pull

### Template subtype

[vim-egs] uses subtype to highlight the targeting filetype's code.

[vim-egs]: https://github.com/unc0/vim-egs

You may specify the subtype in two way:

1. Using special annotation in first 5 lines or the last line in your egs file.

        <%= title %>
        ==========
        
        <%= desc %>
        
        <!-- egs_subtype=markdown -->

2. Using two extension name in your egs filename.

        package.json.egs
        config.xml.egs
        readme.md.egs

    index.egs will using html as subtype.
