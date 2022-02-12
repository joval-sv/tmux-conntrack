# tmux-conntrack

TMUX show net.netfilter.nf_conntrack connections active

## Installation

### Installation with Tmux Plugin Manager (recommended)

Add plugin to the list of TPM plugins in .tmux.conf:

```bash
set -g @plugin 'joval-sv/tmux-conntrack'
```

Hit prefix + I to fetch the plugin and source it.

If format strings are added to status-right, they should now be visible.

Manual Installation
Clone the repo:

```bash
git clone https://github.com/joval-sv/tmux-conntrack ~/clone/path
```

Add this line to the bottom of .tmux.conf:

```bash
run-shell ~/clone/path/tmux-conntrack.tmux
```

Reload TMUX environment:

```bash
# type this in terminal
tmux source-file ~/.tmux.conf
```

If format strings are added to status-right, they should now be visible.
