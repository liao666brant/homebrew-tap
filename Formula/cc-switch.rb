class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.20.4.tar.gz"
  sha256 "6d86cbafddd41299a2be364fe8ad2457941a8c33202ba252fbeeae8b6057b207"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.20.4/CC-Switch-v3.20.4-Linux-arm64.deb", using: :nounzip
      sha256 "515cfcf7dc135337510239be61096499be12a9ed3a67cd93f6b449f499cfc4a3"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.20.4/CC-Switch-v3.20.4-Linux-x86_64.deb", using: :nounzip
      sha256 "434557d3ae08b792c8138c5508f104e799f36d2ced563fb94b3a86ffbb250801"
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
