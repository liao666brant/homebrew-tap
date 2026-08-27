class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.1.11.tar.gz"
  sha256 "3b1c699b85d3160e87555a7f9338e24d7e477eeb49de02d77180d640330ac3c6"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.1.11/bsk-v0.1.11-aarch64-unknown-linux-musl.tar.gz"
      sha256 "560079f71f89ed5a0b364bdebc4713182641f3a1c5a0cc3903f09d559b41b04e"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.1.11/bsk-v0.1.11-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fc34aa4fe5214b2efb6f91ed6dfc7937531b86b02c8c246d9643d12818bcd6cc"
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
