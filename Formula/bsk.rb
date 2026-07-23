class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.1.8.tar.gz"
  sha256 "a1a3132e6cb3a00958f1564382565e72d47dcf209669c285a0b4b960c7e8fd30"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.1.8/bsk-v0.1.8-aarch64-unknown-linux-musl.tar.gz"
      sha256 "55a4c90e6ddc96ee084c90339995d4c2ee87eb6bc5aec515668a447dce126fd2"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.1.8/bsk-v0.1.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9e06dbfcac9517e6d8fd6a8b9c829a9c077303b18e02962faf5ce04a7ea7aa3e"
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
