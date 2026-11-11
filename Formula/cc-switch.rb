class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.29.tar.gz"
  sha256 "51885f0e63e452ff61380934c468347e46982fcbe00e5f4d7b97a5cd013f82cd"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.29/CC-Switch-v4.0.29-Linux-arm64.deb", using: :nounzip
      sha256 "067f02150a6d9120738e0a4a1332e86bfb93fcda9ccd188e2bd23f398073faa8"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.29/CC-Switch-v4.0.29-Linux-x86_64.deb", using: :nounzip
      sha256 "f0eeec9c3e892099c457dee79746af01023d3eabb41e357e6ca4bbbc6178e38a"
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
