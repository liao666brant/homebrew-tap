class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.13.tar.gz"
  sha256 "10d8b4cfcacb4954b9f5b03d8decad0a0bfb8d4a43f3df0acf7b0a3b83ea44e2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.13/CC-Switch-v4.0.13-Linux-arm64.deb", using: :nounzip
      sha256 "f0c55009b38053556f3f1bd7f376884850d806e89d39261e8fa458dd1f338769"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.13/CC-Switch-v4.0.13-Linux-x86_64.deb", using: :nounzip
      sha256 "8c956546e3a614c928402c60f07cffcd07fc775ed1c5e66b183f92753004aa00"
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
