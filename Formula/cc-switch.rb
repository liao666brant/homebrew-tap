class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "2fdf6dd723055287302a711364629a7c65f6b5b85d9af4735273e662323ffe5c"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.0/CC-Switch-v4.0.0-Linux-arm64.deb", using: :nounzip
      sha256 "07e1e55bb43984d7de68f41b19440b53d41aac8e5c9589be15e0dfe14008d98f"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.0/CC-Switch-v4.0.0-Linux-x86_64.deb", using: :nounzip
      sha256 "906f129baa48140dc392f09df4958b83ec4251db6b611cb5640a9c744724526c"
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
