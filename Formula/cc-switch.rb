class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.44.tar.gz"
  sha256 "35d417fec18a6facc41d5e73a0e54612edf28247b279aeefac6ba88ccb5323fb"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.44/CC-Switch-v4.0.44-Linux-arm64.deb", using: :nounzip
      sha256 "5c75b5e797dc94462aee74eba0aeb4a92f4e3aa2027139f24376b87b68ca7061"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.44/CC-Switch-v4.0.44-Linux-x86_64.deb", using: :nounzip
      sha256 "8726b13239e5204b12e8fefe7b9583b34e407d22b172c6eb8fe87b4228080c65"
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
