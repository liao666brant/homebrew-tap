class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.22.tar.gz"
  sha256 "ac1da80f90e46579dec0b1542cdac3fff3742003aeeed00a8e70d274272f05bb"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.22/CC-Switch-v4.0.22-Linux-arm64.deb", using: :nounzip
      sha256 "b2bb866503bfc2c974ce2d646bb6e7ceda233e6f28b79d70253504c0c1e1755d"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.22/CC-Switch-v4.0.22-Linux-x86_64.deb", using: :nounzip
      sha256 "6e6a43e0f48bfa1120867e4ba2959aa45b553332d9fec4213a1f5e5dbadcb3c5"
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
