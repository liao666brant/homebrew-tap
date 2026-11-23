class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.39.tar.gz"
  sha256 "e998280217c3364341e4fceb194332f4b8e4d5dc1b346df776fd0c454215a759"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.39/CC-Switch-v4.0.39-Linux-arm64.deb", using: :nounzip
      sha256 "8d6bf7e267006e05fa705fbb4798184c17721408f1c484842046d0049f77cf03"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.39/CC-Switch-v4.0.39-Linux-x86_64.deb", using: :nounzip
      sha256 "9386135d59592c1d34c9a1ef0d6cea494a7d4bbf69b629d0b4358ec42bed4717"
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
