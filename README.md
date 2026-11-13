# agent-up

One command to update your AI coding CLI agents (`codex`, `claude`, `grok`, `agy`) **in parallel** on macOS and Linux.

一条命令并发更新常用 AI 编程 CLI 工具（`codex`、`claude`、`grok`、`agy`），自动汇总各工具更新结果与最新版本号。

## Features / 特性

- **Parallel Updates / 四路并发更新**：同时运行 `codex update`、`claude update`、`grok update`、`agy update`，大幅缩短等待时间
- **Clean Prefixed Output / 清晰日志前缀**：自动清理终端进度条回车符（`\r`），按工具名称着色区分输出
- **Graceful Skip / 自动跳过未安装项**：某台机器未安装其中某个 CLI 时自动跳过，不影响其余工具更新
- **Safe Signal Handling / 安全中断**：`Ctrl+C` 自动清理全部后台子进程与临时目录
- **Version Summary / 版本汇总**：结束后自动输出每个 CLI 的最新版本号与状态

## Quick Install / 快速安装

### Option 1: One-line Install (Recommended / 推荐)

```sh
curl -fsSL https://raw.githubusercontent.com/lampardrodgers/agent-update/main/install.sh | sh
```

### Option 2: Clone & Install / 克隆安装

```sh
git clone https://github.com/lampardrodgers/agent-update.git
cd agent-update
sh install.sh
```

### Option 3: Install via npm

```sh
npm i -g @sunjiehao/agent-up
```

> Make sure `~/.local/bin` is in your `PATH` (for `install.sh`):
>
> ```sh
> export PATH="$HOME/.local/bin:$PATH"
> ```

## Usage / 使用方法

Update all default agents (`codex`, `claude`, `grok`, `agy`) in parallel:

```sh
agent-up
```

Example output:

```text
==> Updating 4 agent(s) in parallel: codex claude grok agy
[codex ] starting 'codex update'...
[claude] starting 'claude update'...
[grok  ] starting 'grok update'...
[agy   ] starting 'agy update'...
...
==> Summary
  ✓ codex   updated  (codex-cli 0.167.2)
  ✓ claude  updated  (2.1.323 (Claude Code))
  ✓ grok    updated  (grok 1.0.77)
  ✓ agy     updated  (1.5.7)
```

Update specific agents only / 仅并发更新指定工具：

```sh
agent-up codex claude
```

Check version or help / 查看版本与帮助：

```sh
agent-up --version
agent-up --help
```

## Deploy to Another Machine via SSH / 远程机器一键部署

```sh
ssh <your-host> 'curl -fsSL https://raw.githubusercontent.com/lampardrodgers/agent-update/main/install.sh | sh'
```

## License

MIT
