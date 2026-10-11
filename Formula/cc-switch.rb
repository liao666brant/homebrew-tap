class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.8.tar.gz"
  sha256 "6119e7c5bec84aad5356d4193358872f0cc776c56660e0ba59b5af092fbb69d3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.8/CC-Switch-v4.0.8-Linux-arm64.deb", using: :nounzip
      sha256 "eb20d50c21461a946767dc600b8d39335f8195a0d275d2d8145d677204388128"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.8/CC-Switch-v4.0.8-Linux-x86_64.deb", using: :nounzip
      sha256 "24b09830abb8bc1973a4f2bf0a43203a7fb8fdca9be09bbc5ddcf576e2bb3db5"
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
