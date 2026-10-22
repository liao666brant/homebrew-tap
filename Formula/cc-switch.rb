class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.18.tar.gz"
  sha256 "b19f10206ae1f731f94234cb63d12833ed2a9044bc4962c00757356e78af8826"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.18/CC-Switch-v4.0.18-Linux-arm64.deb", using: :nounzip
      sha256 "ec1dbcc5640cc499737e77b8bd82cec61429fcb393f07be2347795963f5dc45d"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.18/CC-Switch-v4.0.18-Linux-x86_64.deb", using: :nounzip
      sha256 "7ef345e0a106a818cccd3ab730fde8feeb54642439a96877c2d0698cb7bf4768"
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
