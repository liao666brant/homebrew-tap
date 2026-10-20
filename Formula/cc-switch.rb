class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.16.tar.gz"
  sha256 "7f5c0ccceaa657a29da7a8542f78c3cee2c09dc781c71e4cc39c1e78a8db221f"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.16/CC-Switch-v4.0.16-Linux-arm64.deb", using: :nounzip
      sha256 "31edbe99dc13bdf9fa62bfad53c645f89db1ac0b0c6aa4c0630fbfa4ee5d9536"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.16/CC-Switch-v4.0.16-Linux-x86_64.deb", using: :nounzip
      sha256 "d86b9a889e7b81ed7e3430a27d31f055697a29330c993219273c7e3f954f639b"
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
