class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.10.tar.gz"
  sha256 "573f3dce82ce5bf648d2b667588b3e1e845371b2e6032b0976ff4a7d7e10dba1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.10/CC-Switch-v4.0.10-Linux-arm64.deb", using: :nounzip
      sha256 "eef296673bae21adcf1072277eb3e338d7d1041a218b1dc2d74923104e3b7fa7"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.10/CC-Switch-v4.0.10-Linux-x86_64.deb", using: :nounzip
      sha256 "1f7cdae1e13d7db2f29eae5e0f977dc8baa320ae06f54959b7013c99519f5b01"
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
