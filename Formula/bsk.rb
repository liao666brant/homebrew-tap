class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.1.10.tar.gz"
  sha256 "c9bcbc52cdfe10aba296201b12a687aab484aed74530e52b18c35dcabe6b4a37"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.1.10/bsk-v0.1.10-aarch64-unknown-linux-musl.tar.gz"
      sha256 "52b3f1c1ce4b20f1fb88d982a6e42fc625ed898c17ba377be5cfb55c5d529445"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.1.10/bsk-v0.1.10-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ff896add42b4b8d4678d0beda44ad20926847729dd7e32ae528c7aa2140d0e8e"
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
