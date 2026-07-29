class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.1.9.tar.gz"
  sha256 "7ec59655e554f4106c98eb5e6375c5196d7a1a91a4262aa750fe050d5d112ebc"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.1.9/bsk-v0.1.9-aarch64-unknown-linux-musl.tar.gz"
      sha256 "198162fb185673f56ace1f083eff46719ae1f4aac95bc4052a6f51897a8e2cfa"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.1.9/bsk-v0.1.9-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1d452756b8a8acc2e685909e30b2a0b52bdbd0cf96cd0887c9334c06f04a630b"
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
