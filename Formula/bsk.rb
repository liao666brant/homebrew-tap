class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.2.1.tar.gz"
  sha256 "96ccad1b93203c836e18d4c19757f9e6e7b494ded6879135ae4f382423826ab4"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.2.1/bsk-v0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d30f301fe64ea4784899d0cba3e8991d6b59017173bf83258a161a64c94a42f5"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.2.1/bsk-v0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a533cbf532fe9848332d72c2b92e92e0d76626765417ca5f374914385731265f"
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
