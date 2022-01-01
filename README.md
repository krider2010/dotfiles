# krider2010 does dotfiles

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read Zach Holman's post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

Indeed, this repo was forked from Holman's dotfile repo, but has been tweaked
for my needs, including support for [Oh My Zsh](https://ohmyz.sh/) and [Homebrew](https://brew.sh/). It also makes use of an adapted [strap](https://github.com/MikeMcQuaid/strap) [script](https://macos-strap.herokuapp.com/).

**Note:** If you do use strap, don't check in any script with tokens - they have been removed from this script and the user prompted to provide them!

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

Run this:

```sh
git clone https://github.com/krider2010/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./strap.sh
```

This will install various security things, homebrew, and then symlink the appropriate files
in `.dotfiles` to your home directory. Everything is configured and tweaked within `~/.dotfiles`.

On !Mac (also !Windows - but none of this likely works on Windows), then you don't need strap so run...

```sh
git clone https://github.com/krider2010/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/install
```

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets various macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## notes

This does not include ssh config files, or pulling keys from 1Password, or vscode things, or ... These are for my own reference...

Useful things for ssh:

```sh
Host *
  StrictHostKeyChecking ask
  VerifyHostKeyDNS ask
  NoHostAuthenticationForLocalhost yes
  IdentityFile ~/.ssh/id_rsa
  UseKeychain yes
  AddKeysToAgent yes
  ControlMaster auto
  ControlPath /tmp/ssh-%r@%h:%p.socket
```

Enable `Settings Sync` via GitHub for [vscode](https://code.visualstudio.com/docs/editor/settings-sync)
