class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.6.tar.gz"
  sha256 "92a8d59a75b8f34376298f502357ab6a8469cee02d9f7ff99c76ef5336e5ec20"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.6/CC-Switch-v4.0.6-Linux-arm64.deb", using: :nounzip
      sha256 "4959fe321507c8b3e9d98eb2b78aa5dfb418bf6fffb9f3667306377cbf231890"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.6/CC-Switch-v4.0.6-Linux-x86_64.deb", using: :nounzip
      sha256 "01229013a69007a2366a90f5bff702e0df9cf0533b8ae90c8cbf2497aa2cc80e"
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
