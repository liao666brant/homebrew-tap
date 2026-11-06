class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.4.2.tar.gz"
  sha256 "87305618a28bc1560e59e093abe37de17f19d9d897acb6bf9a21e821100ef0f9"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.4.2/bsk-v0.4.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f965474d8ad61cfb819b5123f4355135ee2afa9c4f742bbbe9e4f463dc7d5fa3"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.4.2/bsk-v0.4.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5286ccdc104e52200c47b4a492c6e043069e5bf1e638db8fdbde62a9d4939979"
    end
  end

  def install
    resource("binary").stage do
      bin.install "bsk"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bsk --version")
  end
end
