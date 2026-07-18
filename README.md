# Linuxbrew Tap

这个 Tap 提供适用于 Linux 的第三方 Homebrew Formula。源码仓库：[liao666brant/homebrew-tap](https://github.com/liao666brant/homebrew-tap)。

## 软件

| 软件 | Formula | 说明 | 安装 |
| --- | --- | --- | --- |
| BrowserSkill | `bsk` | 连接 AI Agent 与已登录 Chromium 浏览器 | `brew install liao666brant/homebrew-tap/bsk` |
| CC Switch | `cc-switch` | AI 编程工具的一体化桌面助手 | `brew install liao666brant/homebrew-tap/cc-switch` |

表格中的安装命令会自动注册 Tap；也可先手动注册：

```bash
brew tap liao666brant/homebrew-tap
```

## BrowserSkill

安装完成后，将 BrowserSkill skill 注册到当前用户环境：

```bash
bsk install-skill
```

BrowserSkill 还需要在 Chromium 浏览器中安装并启用配套扩展。

## CC Switch

安装后可通过以下命令启动：

```bash
cc-switch
```

## 本地开发

```bash
brew tap local/tap "file://$(pwd)"
brew install local/tap/bsk
```

## 自动更新

`.github/workflows/bump.yml` 会在每天北京时间 06:00 检查已配置 Formula 的更新，并在有新版本时创建更新 PR；也可在 GitHub Actions 页面手动运行。

启用前，在仓库的 **Settings → Secrets and variables → Actions** 中添加 `HOMEBREW_GITHUB_API_TOKEN`，其值为具备仓库写入和创建 PR 权限的 GitHub 个人访问令牌。
