class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.23.tar.gz"
  sha256 "27124b2b22b4657228df9eb0eeb2ca41748f80c9950a56587ba7784398c71156"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.23/CC-Switch-v4.0.23-Linux-arm64.deb", using: :nounzip
      sha256 "33c5709e39a1ffff3abf6bd8c35ccc321f001159115ecab2ac195ba438ffaf89"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.23/CC-Switch-v4.0.23-Linux-x86_64.deb", using: :nounzip
      sha256 "79d1f836376d077491c14016d61b843e5ebae8858dd8072285224697a2e47c33"
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
