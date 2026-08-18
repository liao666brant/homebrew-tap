class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.20.0.tar.gz"
  sha256 "fca70ae68af06f726a49b31c7febeb19ce8f486456ef195c5953baeb035366d9"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.20.0/CC-Switch-v3.20.0-Linux-arm64.deb", using: :nounzip
      sha256 "2a8240a48c06a7f5a39ec4f555bb686fbe21ae0b07fcc75eff7961abede6da68"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.20.0/CC-Switch-v3.20.0-Linux-x86_64.deb", using: :nounzip
      sha256 "d40aee2c86e52978135c15fdf3a7cb9f9555ad7c046ad3be2dcac5edcd2a52c0"
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
