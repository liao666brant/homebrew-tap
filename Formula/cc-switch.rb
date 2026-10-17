class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.14.tar.gz"
  sha256 "6ac1d1b5b85f211258e41f6d6b539def4e4993bad1b927d04b5515beb74d6a30"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.14/CC-Switch-v4.0.14-Linux-arm64.deb", using: :nounzip
      sha256 "fa8e0f8a9c0f64d75da2d7adaa1cd03f90bd870efee160629fd68ad94ba02768"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.14/CC-Switch-v4.0.14-Linux-x86_64.deb", using: :nounzip
      sha256 "42c6e54ac4f2cec162e8257110227883c2b99402df225146c412950effe57f7e"
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
