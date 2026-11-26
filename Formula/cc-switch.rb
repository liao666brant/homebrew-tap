class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.42.tar.gz"
  sha256 "64cef3a3cf6831e6c54c6f0ad2e1a6862b8739096b7269cd55b65ba588c60073"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.42/CC-Switch-v4.0.42-Linux-arm64.deb", using: :nounzip
      sha256 "521ba59283a94a2f72c53f963b3df50163d9ca75d668a067f6e8ab15c2bb5290"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.42/CC-Switch-v4.0.42-Linux-x86_64.deb", using: :nounzip
      sha256 "67f4efa1e1c2f41220c3a211523edcdd5efe97a646d7d7dcaca965f01f3b524c"
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
