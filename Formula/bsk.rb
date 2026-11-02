class Bsk < Formula
  desc "Connect AI agents to a real, logged-in Chromium browser"
  homepage "https://github.com/Tencent/BrowserSkill"
  url "https://github.com/Tencent/BrowserSkill/archive/refs/tags/cli-v0.4.1.tar.gz"
  sha256 "61ba14e2ecda617bc1978d7a5a91a08cd74abfd77b9e27fe4d8b06f24da5dbc3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^cli-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.4.1/bsk-v0.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c54a6af6ca9eb3abaee523427796817deb139b847cb76e8335da6804f35c441c"
    end

    on_intel do
      url "https://github.com/Tencent/BrowserSkill/releases/download/cli-v0.4.1/bsk-v0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8a6d503a07748fc8f5f4a9d262564dea011bf860c8294032f9fb84b10c006d8a"
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
