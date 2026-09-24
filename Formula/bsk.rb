class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.3.1.tar.gz"
  sha256 "958ca67e8cf1e59e036d4efa4023db2197fbca489731e9d6f13fc186c3b1a685"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.3.1/bsk-v0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "67ffdeb8c90cea1e037c81df1e28bacc9582e6a91fe61b9eb3eb03d951fe6fa5"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.3.1/bsk-v0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a3011c97cc39ff859c595691f86f28f5d24d61c363d598cc06ff0bbb8315c8db"
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
