class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.20.1.tar.gz"
  sha256 "8486e81e602c0d87729e4cda7a46631c9c1913b78ed400cd21bb50f4d63431eb"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.20.1/CC-Switch-v3.20.1-Linux-arm64.deb", using: :nounzip
      sha256 "f5c871ee0a2895dbd79acae50d9c9d6c6bc64bfb8dedd10c3f08de89494b72b6"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.20.1/CC-Switch-v3.20.1-Linux-x86_64.deb", using: :nounzip
      sha256 "aeea1f88391f007e651ff49ddb943e6535e4e76a93e97602ffa0edc758d13463"
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
