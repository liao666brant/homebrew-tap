class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.19.tar.gz"
  sha256 "dcf11040628cae673dde462ef8b060584ea80900ed42d5c6c8a9e8db496d4473"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.19/CC-Switch-v4.0.19-Linux-arm64.deb", using: :nounzip
      sha256 "2de78fb1d3c1cd06a17310c3c21c804a8900797a28ebed3cb9558acd50232076"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.19/CC-Switch-v4.0.19-Linux-x86_64.deb", using: :nounzip
      sha256 "1a0e22dadc1358b889e94cc344f3c2ad319a421345892af4cefc837901626525"
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
