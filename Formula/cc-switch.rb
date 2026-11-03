class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.25.tar.gz"
  sha256 "fc22d2eaf51c508d3dfa720e894b65ceb2e8e3b2cabf1b919fbffed152764e6a"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.25/CC-Switch-v4.0.25-Linux-arm64.deb", using: :nounzip
      sha256 "2873cac35a3305378da8723fc3d97fd25340e42bfad48929c45ecf660c13c6a3"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.25/CC-Switch-v4.0.25-Linux-x86_64.deb", using: :nounzip
      sha256 "13b377c505ce8f2511a614bb1e01bc5566ecabad119bb0b087ac3781c6d88108"
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
