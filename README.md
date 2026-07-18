# Linuxbrew Tap

这个 Tap 提供适用于 Linux 的第三方 Homebrew Formula。

## BrowserSkill

将仓库发布到 GitHub 时，仓库名应为 `homebrew-linuxbrew-tap`。安装命令中的
`<github-user>` 需要替换为实际的 GitHub 用户名：

```bash
brew install <github-user>/linuxbrew-tap/bsk
```

本地开发时，仓库至少有一次提交后，可通过文件 URL 注册临时 Tap：

```bash
brew tap local/linuxbrew-tap "file://$(pwd)"
brew install local/linuxbrew-tap/bsk
```

安装完成后，将 BrowserSkill skill 注册到当前用户环境：

```bash
bsk install-skill
```

BrowserSkill 还需要在 Chromium 浏览器中安装并启用配套扩展。
