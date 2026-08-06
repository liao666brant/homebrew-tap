class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.19.2.tar.gz"
  sha256 "0255c2476a6bfd9156c5e4b12c8a8e3ea752f12e036e5d6a2b66ab944cb62cd1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.19.2/CC-Switch-v3.19.2-Linux-arm64.deb", using: :nounzip
      sha256 "d54607c408ca430a627d0df52f3f10a41b55df2a420dc312be29ed84a031a9a3"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.19.2/CC-Switch-v3.19.2-Linux-x86_64.deb", using: :nounzip
      sha256 "e530f35b129e3de34daa4be9a06e587642e58d0a6874f755913d34d0142677f2"
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
