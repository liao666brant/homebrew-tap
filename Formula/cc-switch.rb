class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.32.tar.gz"
  sha256 "42d331efd97c4f40b12f67b13442c399c013617a08b38e270d3f8dbd8ec6a085"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.32/CC-Switch-v4.0.32-Linux-arm64.deb", using: :nounzip
      sha256 "92f5433e4a37f90fa7b3b1a427a1d3c0c9c156049142f3655aa276083572bd91"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.32/CC-Switch-v4.0.32-Linux-x86_64.deb", using: :nounzip
      sha256 "8827a4e5c83c48c7f21431e5ba542ac4b8d09958f212e5184b879b2616d2c34f"
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
