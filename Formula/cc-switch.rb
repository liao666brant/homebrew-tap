class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.2.tar.gz"
  sha256 "04b2983ab7e9e7441e16a5173812a4e46d742db077f69635bb66fe08f802ff70"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.2/CC-Switch-v4.0.2-Linux-arm64.deb", using: :nounzip
      sha256 "37681fd48130ac5dbc5d1d27748298ff4d592d7ec86aa2767c64882a835cfafc"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.2/CC-Switch-v4.0.2-Linux-x86_64.deb", using: :nounzip
      sha256 "912b3dbdab07281ac35ae4d1d97797b74412d1b754eae90db475c340d4710cd0"
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
