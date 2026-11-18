class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.34.tar.gz"
  sha256 "483ffc4f2cee52e76920036c6458b40110960ca057d6adc293ffe24db27e597a"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.34/CC-Switch-v4.0.34-Linux-arm64.deb", using: :nounzip
      sha256 "013317b1e8277cefec191e564fc69fb41e682d77f2d35635c775d3fd6300efc0"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.34/CC-Switch-v4.0.34-Linux-x86_64.deb", using: :nounzip
      sha256 "68a2cd5c3741a6d89c9c9c7423bd7e9d80b675c564529a1890847ff7d3a9059b"
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
