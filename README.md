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
