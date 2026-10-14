class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.11.tar.gz"
  sha256 "0425fb5fef7498f41c01a068a7a64df7afb76b4802a37385e8b6305894dbf7aa"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.11/CC-Switch-v4.0.11-Linux-arm64.deb", using: :nounzip
      sha256 "7317fb755e72034fb52c9b12a038292892d3c9ed3f89caea744c7c427de94bbc"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.11/CC-Switch-v4.0.11-Linux-x86_64.deb", using: :nounzip
      sha256 "4b0028e02e775e776eade4f861be7721d95c25e4762c8c91be552ca674fcce23"
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
