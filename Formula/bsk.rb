class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.5.0.tar.gz"
  sha256 "641451a4221f1d8563517c642bbd94506761e690ac0970d1554a8a490581ec0a"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.5.0/bsk-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7db0665a2bdc0c9287f8806ab572a257ffcfb849e27291b1140bd46e21a6a34a"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.5.0/bsk-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4e4f14183511f8d03487cad93549c9db8ea10360ac01a9aa35876b184bc3ea07"
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
