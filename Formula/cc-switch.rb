class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.18.0.tar.gz"
  sha256 "0dee76840b8e36ce143c31d74471b60fb1b11607bce51ae0bce1b276aad6f38f"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.18.0/CC-Switch-v3.18.0-Linux-arm64.deb", using: :nounzip
      sha256 "5c549027e87adf27bd8c6d7b1ff17d5c12fe0e74fa2757d902bb5b06f073c66a"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.18.0/CC-Switch-v3.18.0-Linux-x86_64.deb", using: :nounzip
      sha256 "3c8aaaa21bdb57e6a4e9ed6f9e84f36f486aed5c5520bfaa31498207abe8f141"
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
