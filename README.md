# absrice
My personal dotfiles. Managed by chezmoi.

Installed automatically by [aarbs](https://github.com/askeko/aarbs). To install
on an existing machine:

```sh
chezmoi init --apply https://github.com/askeko/absrice.git
```

The HTTPS URL works without SSH keys. To push changes, switch the remote to SSH:

```sh
chezmoi git -- remote set-url origin git@github.com:askeko/absrice.git
```

The first apply also installs Claude Code and Codex CLI as the user, using
their official native installers. Tools already on PATH are skipped. Sign in
by running `claude` and `codex` after login; credentials are not tracked here.

## Credits

`pictures/wallpapers/default/archwave.png` is by rhysperry111, released under
CC0, from the [archlinux-wallpaper](https://archlinux.org/packages/extra/any/archlinux-wallpaper/)
package (1.6.1).
