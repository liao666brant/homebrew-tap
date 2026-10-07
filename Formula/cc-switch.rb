class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.3.tar.gz"
  sha256 "4ff8c3dfeb53339bd86e30b7ac7e8424d0384adc46f0f4e8e88f6b1931d843bb"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.3/CC-Switch-v4.0.3-Linux-arm64.deb", using: :nounzip
      sha256 "27c26ee0ebeb75353495b2df1cc2c5ddf9b7a373b67268dd575c0379539a0c22"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.3/CC-Switch-v4.0.3-Linux-x86_64.deb", using: :nounzip
      sha256 "42e0e221cc3860f6d51c9523dd0a968f09fcc1bb97c077c5db1fb402933bdcda"
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
