class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.3.2.tar.gz"
  sha256 "9419c06bece0c99655db15613768f218113114798d969cc835fdfdd86960338f"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.3.2/bsk-v0.3.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "625de29561a98b245ef712d13c273c5de744e4610a7bbf1999ff3b279d2220cf"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.3.2/bsk-v0.3.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "73e3948ad2232111661729c25e6c762eda7bd5c2320fa2593fe55c9855790631"
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
