# codex-up

Small macOS/Linux helper command for updating Codex CLI:

```sh
npm i -g @openai/codex@latest
```

## Install

With npm:

```sh
npm i -g @lampardrodgers/codex-up
```

Then run:

```sh
codex-up
```

The npm package name is scoped because the unscoped `codex-up` package name is already taken on npm.

## Manual Install

From a cloned copy of this folder:

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

Use npm on the other device:

```sh
npm i -g @lampardrodgers/codex-up
codex-up
```

Or copy this folder to the other device, then run:

```sh
sh install.sh
codex-up
```

Requirements:

- Node.js and npm are installed.
- Your npm global install location is writable, or your npm setup already handles global packages without `sudo`.

## Publish

```sh
npm login
npm publish --access public
```
