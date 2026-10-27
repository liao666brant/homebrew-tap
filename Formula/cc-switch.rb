class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.21.tar.gz"
  sha256 "f2a9fc072bedb8529e8378057f0f120b1aa521427385f959b7f057550a75e113"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.21/CC-Switch-v4.0.21-Linux-arm64.deb", using: :nounzip
      sha256 "5dce53662d87df22a7818aeb96c229fe2752248b47f7f7fac166ff70fb3d05c1"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.21/CC-Switch-v4.0.21-Linux-x86_64.deb", using: :nounzip
      sha256 "ea2f6ca82da004820e09e0c473ca7254bf9291282f00272e9e2adf8f114e3e61"
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
