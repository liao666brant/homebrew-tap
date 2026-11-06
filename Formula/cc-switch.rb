class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.26.tar.gz"
  sha256 "138b0c11f991c34e04e4a12df3ee84e0caa7d20e60c88d7ecafc48e554cdadbc"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.26/CC-Switch-v4.0.26-Linux-arm64.deb", using: :nounzip
      sha256 "ae4e5cdf242e0dc1b0c0a0e36b0d967d08cfc64635e8f43fe70c409a86083b41"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.26/CC-Switch-v4.0.26-Linux-x86_64.deb", using: :nounzip
      sha256 "6d30e1f08315db59f5f7928869ad7f3442624d45580cfb7c877e54134b55ae3a"
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
