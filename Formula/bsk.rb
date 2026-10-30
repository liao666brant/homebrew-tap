class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.4.0.tar.gz"
  sha256 "5da478a884c75cd28bf07aefb83b8d51ebc5dc04fa271632267754ae7d4f223e"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.4.0/bsk-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dcee46ef93959ed9656689803e6c013488d38c174ba201f674ca574e1f1ed99d"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.4.0/bsk-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d8a37ec49505e8bbac15cf3335c832d12c77118de276f8164dcad9323cafabc5"
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
