class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.19.0.tar.gz"
  sha256 "203e14a76741bd20807003e408d362adaa26b134ad248928ee20af5b36c30274"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.19.0/CC-Switch-v3.19.0-Linux-arm64.deb", using: :nounzip
      sha256 "a7d462c6f1d3f4b1bb266ac68c781e57c6a619667a4f2c831ae27659d1bc5a07"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.19.0/CC-Switch-v3.19.0-Linux-x86_64.deb", using: :nounzip
      sha256 "60c0ba7a6535e3571b67a27512299df757a9a7693e94e38074f5152fa57d36af"
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
