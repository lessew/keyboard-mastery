---
name: check-symlink-tmux
description: Checks whether ~/.tmux.conf is correctly symlinked to this repo and fixes it if not.
---

Check the tmux symlink:

- **Link:** `~/.tmux.conf`
- **Expected target:** `/Users/wesselheringa/dmmhp/sync/github/keyboard-mastery/tmux/.tmux.conf`

Steps:
1. Run `readlink ~/.tmux.conf` to get the current target.
2. If it is missing, broken, or points elsewhere — fix it with `ln -sf <target> <link>`.
3. Report: OK or fixed (with what changed).
