class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.33.tar.gz"
  sha256 "3aa553b17952d9cdbad970953173a358130a72d49410686a6243800ba7a36e26"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.33/CC-Switch-v4.0.33-Linux-arm64.deb", using: :nounzip
      sha256 "5539e9464534b09806365468c41dbc620ba527a20bfee790fee83d8a54008ab9"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.33/CC-Switch-v4.0.33-Linux-x86_64.deb", using: :nounzip
      sha256 "479b94435ec1f62ee1c73f301c9eeba84f6ce62ea56dc1ee16e7c237056b13ec"
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
