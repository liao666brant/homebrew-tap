class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.30.tar.gz"
  sha256 "8542febbab2d5ccff298945a79ae609594aa50506465b6e482771838c7216424"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.30/CC-Switch-v4.0.30-Linux-arm64.deb", using: :nounzip
      sha256 "12dadabf83425195dbab479ede210472e8c8f7cc8140e164224a4b3879c5a267"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.30/CC-Switch-v4.0.30-Linux-x86_64.deb", using: :nounzip
      sha256 "4109442a102f797cd9b531bb4bd856a9ef0ced2d79524d22757537cbbd157fee"
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
