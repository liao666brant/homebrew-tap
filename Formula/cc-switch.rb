class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.40.tar.gz"
  sha256 "6b0ba6fec8520029db10efe12bc49d2207d7c806e5b745cc5e68c81e16d530f4"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.40/CC-Switch-v4.0.40-Linux-arm64.deb", using: :nounzip
      sha256 "e0e7db92faaec3fdc7e7091df588369e6006a8ec6d719a544ff3f8b19df288cd"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.40/CC-Switch-v4.0.40-Linux-x86_64.deb", using: :nounzip
      sha256 "e5ea595d42a2f65ab475c00ef70de0a4267d8a58dfd6c9ba8ff513c76353a6c9"
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
