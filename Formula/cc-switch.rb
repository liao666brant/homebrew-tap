class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.27.tar.gz"
  sha256 "ce71b69bc12b9b30266d6eaf7422207035930a3f05987e5a5a94d5959c682e21"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.27/CC-Switch-v4.0.27-Linux-arm64.deb", using: :nounzip
      sha256 "8181477566c5b6ecb83883b456cb4bd86e5cf734afe2f42b6addc3d2635d94c7"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.27/CC-Switch-v4.0.27-Linux-x86_64.deb", using: :nounzip
      sha256 "e353be9181a92b83682fbf7e2eda02fb05d1135c27c6dd2a54c5b7fd63fa80ac"
    end
  end

  def install
    resource("binary").stage do
      system "ar", "x", Dir["*.deb"].first
      system "tar", "-xzf", "data.tar.gz"
      bin.install "usr/bin/cc-switch"
    end
  end

  test do
    assert_predicate bin/"cc-switch", :executable?
  end
end
