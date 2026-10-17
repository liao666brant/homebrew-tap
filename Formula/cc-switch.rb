class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.15.tar.gz"
  sha256 "6fc370f341c517922aa03dd5693451437e67aea45ce91026a1d296f19e02cfa8"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.15/CC-Switch-v4.0.15-Linux-arm64.deb", using: :nounzip
      sha256 "73c0892ce2e9102f46be783f13d947206d66c37d43b93f5d5eff4e1270e55823"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.15/CC-Switch-v4.0.15-Linux-x86_64.deb", using: :nounzip
      sha256 "16f0241a6d25b8eb2e7d6d4e441a6e8da6e5b37b638f57fc6c8cda37e5e3957f"
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
