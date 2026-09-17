class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.3.0.tar.gz"
  sha256 "2b1096f6c8eff3e87e91c89d64ee4db47e133784e1d3d6a1b84079e353a17656"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.3.0/bsk-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "60c61f740ae820a085425e65e914ea0d68c21ce87f7038a29a372fd8d63896db"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.3.0/bsk-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0eb2b40aff955898d21c1adfc70a3d6c84da9730b39b6fd4d5c12457274d0260"
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
