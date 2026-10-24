class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.20.tar.gz"
  sha256 "920766586f820c55bdfb66cec45b9953787c4611771b26257c02722691b47e07"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.20/CC-Switch-v4.0.20-Linux-arm64.deb", using: :nounzip
      sha256 "ae7a8c7d48f98ad23790104831274b966c99da2607de1ca8e363e655df8cc09b"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.20/CC-Switch-v4.0.20-Linux-x86_64.deb", using: :nounzip
      sha256 "138f3c8d7c222da15d4e4e6ada0206b9847b3bb5d23659ea6da0faf2157d88e8"
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
