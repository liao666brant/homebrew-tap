class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.20.3.tar.gz"
  sha256 "545e6ac0dc6d65547ac493846000aed0ee6407bee0de6d485303d14028503726"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.20.3/CC-Switch-v3.20.3-Linux-arm64.deb", using: :nounzip
      sha256 "c7f0dfe8108438662231eb343e7e29cada1cda8aef3dcd10c640bd0287190d18"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.20.3/CC-Switch-v3.20.3-Linux-x86_64.deb", using: :nounzip
      sha256 "22cfe75f1205570545b66c482b567e54f85993cc8b1045c05c609749c41dd6c5"
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
