class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.3.3.tar.gz"
  sha256 "84895c640ce5909cb9e4660156e4ce7293ad6ffbf4e21e17d3ae8b17958c9c4e"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.3.3/bsk-v0.3.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "747e4c416da46650c7d8127a47dd8f08e813e0f69366c4db1af226d0b63a575d"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.3.3/bsk-v0.3.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "141b73489bec99d768cf18042919f0e054c9f614e6ecdfd754028d2b606e9106"
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
