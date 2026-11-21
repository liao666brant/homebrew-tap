class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.37.tar.gz"
  sha256 "909f30da498a28d7c9985926a84f49fcd77b10ef379afb9a8ab2d2e94ebc9458"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.37/CC-Switch-v4.0.37-Linux-arm64.deb", using: :nounzip
      sha256 "7259642611c59e9b6d2a2c05f43dc97634d744b9baf94eee226446f63055ce81"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.37/CC-Switch-v4.0.37-Linux-x86_64.deb", using: :nounzip
      sha256 "91cf04dff1b8fea5d339d5c3f9841853b2e7a04f4a1747cf869b191e74cc7109"
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
