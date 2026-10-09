class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.5.tar.gz"
  sha256 "5c3a1e23f163a4626dfd56263887e97cfe8c86523347fd4569ec94bc8de034f2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.5/CC-Switch-v4.0.5-Linux-arm64.deb", using: :nounzip
      sha256 "d355cdfdc94296542e2ceacec9573770c4025648291fffb2f53004cc26c7f92d"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.5/CC-Switch-v4.0.5-Linux-x86_64.deb", using: :nounzip
      sha256 "788b9462e4496bbec542ca3446e78ae0fd029fd43a20a7e73fb171a8f378ec0c"
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
