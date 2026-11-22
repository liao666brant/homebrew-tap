class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.38.tar.gz"
  sha256 "7f72e42105c6239a0024f9a3a2bea9579fbc2cd4cccab106da8da6f0f9bde8c3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.38/CC-Switch-v4.0.38-Linux-arm64.deb", using: :nounzip
      sha256 "86c2d0d6f633d95bec19db45c8ef98e9539f20cb770d4caa7cd1b537b3bc25a9"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.38/CC-Switch-v4.0.38-Linux-x86_64.deb", using: :nounzip
      sha256 "7f7cda452e920d296962f4d210575436e38764d81a87eea326ce0971f3db8a1e"
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
