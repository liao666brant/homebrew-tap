class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.4.tar.gz"
  sha256 "0aafdd7c8042f064c3696f552b5c9e37eadbc988c83e6d9c00bf28bb431c9221"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.4/CC-Switch-v4.0.4-Linux-arm64.deb", using: :nounzip
      sha256 "74994722a51ca62688c682eb17cb5a64e8b2c19d62f16c2cbb773cedb8d9fbc9"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.4/CC-Switch-v4.0.4-Linux-x86_64.deb", using: :nounzip
      sha256 "4193072133eb1c108d75f9805efba91140f18eacf831b4849d3837e2a70db9ba"
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
