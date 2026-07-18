class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.17.0.tar.gz"
  version "3.17.0"
  sha256 "8ae7c878c7de955ff9bd1f13dc22ff9b680267b889ec9b285f62aae03142ab40"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.17.0/CC-Switch-v3.17.0-Linux-arm64.AppImage"
      sha256 "9c7da2e130e4fff94c385f0a7b470e9fea3704325d1f8380f0ff2d865fc61725"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.17.0/CC-Switch-v3.17.0-Linux-x86_64.AppImage"
      sha256 "f4ee9d1dcc0015de583c9f5e3b3436c7a351f7e781dbb746fbba96525b129eb9"
    end
  end

  def install
    resource("binary").stage do
      bin.install Dir["*.AppImage"].first => "cc-switch"
    end
  end

  test do
    assert_predicate bin/"cc-switch", :executable?
  end
end
