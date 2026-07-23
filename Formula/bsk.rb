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
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.1.7/bsk-v0.1.7-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b7f117644a4f018824ccb0c1ebf414c1985febfef0c0b58e453dcfcce37ad766"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.1.7/bsk-v0.1.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "da9f9cedbd7d1010887143760cf24cf960fd4a5a8536ac59ec50c546c1c532ac"
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
