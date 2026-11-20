class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.36.tar.gz"
  sha256 "3e2c9546cf8f1726e49dcfbd3108fdcbcc296c46b5bb1ddec05def3165ad4924"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.36/CC-Switch-v4.0.36-Linux-arm64.deb", using: :nounzip
      sha256 "ea68e32ed01c498a4f15a3c4cb8ca6d9237f2df3343b64b10df01cf4a1cae3f3"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.36/CC-Switch-v4.0.36-Linux-x86_64.deb", using: :nounzip
      sha256 "e178801c2e33dfe12166868b5ae804f884b495c5fcec66c2a4dbfd91560471da"
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
