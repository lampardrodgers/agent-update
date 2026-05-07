# codex-up

Small macOS/Linux helper command for updating Codex CLI:

```sh
npm i -g @openai/codex@latest
```

## Install

From this folder:

```sh
sh install.sh
```

Then run:

```sh
codex-up
```

If your shell cannot find `codex-up`, add this to `~/.zshrc`, `~/.bashrc`, or the equivalent shell config:

```sh
export PATH="$HOME/.local/bin:$PATH"
```

## Move To Another Mac Or Linux Device

Copy this folder to the other device, then run:

```sh
sh install.sh
codex-up
```

Requirements:

- Node.js and npm are installed.
- Your npm global install location is writable, or your npm setup already handles global packages without `sudo`.
