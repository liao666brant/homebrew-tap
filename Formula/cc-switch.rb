class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.17.tar.gz"
  sha256 "15307eabf19828e33107cbd14cf37684d3760b5c7ea951dce77a2ce0304165fa"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.17/CC-Switch-v4.0.17-Linux-arm64.deb", using: :nounzip
      sha256 "89f9075367613c41d640a1601cda46f9179acd68d7add5a9654cc410ba279a83"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.17/CC-Switch-v4.0.17-Linux-x86_64.deb", using: :nounzip
      sha256 "f22b582327b847c38515348cfe2e0768efa447431912df9a3b8ac08868a92cbb"
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
