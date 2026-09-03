class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.2.0.tar.gz"
  sha256 "ad5b73238ef81f7048085957d292ba29a99184b26c1ce039309a18808819d413"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.2.0/bsk-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e894e5a725a12fd0bd43a3b1bfc972d9ccfee00a8203d41f7b5b91019478bfc5"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.2.0/bsk-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d1b7120c2ea81d981a8472f5a4491fd50df62a349881a790ee7f0225cecec841"
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
