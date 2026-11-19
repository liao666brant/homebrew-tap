class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.35.tar.gz"
  sha256 "4445addefc25a5640583423a050e6fa384417838c155efa9a39da890e891a854"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.35/CC-Switch-v4.0.35-Linux-arm64.deb", using: :nounzip
      sha256 "91a3f604feda7b16bec27ef0a7c003f19a510126625d2abc7338c7f95cf39e68"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.35/CC-Switch-v4.0.35-Linux-x86_64.deb", using: :nounzip
      sha256 "2b62cdf48b921755ace971e6e5e5d7fe5c4d39bbb120ddaca78a99b19b8cc5ad"
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
