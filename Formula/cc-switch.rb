class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.43.tar.gz"
  sha256 "0eb797a51cd4de040572140c43316f78c8efc1bf3fe4e64f80595bd383fe546c"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.43/CC-Switch-v4.0.43-Linux-arm64.deb", using: :nounzip
      sha256 "cc530865bb5b547625e0c19cc2d953e33326302b9dd9c5f2d0894fc45669f9f1"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.43/CC-Switch-v4.0.43-Linux-x86_64.deb", using: :nounzip
      sha256 "e0b0ea1e962583ff585ff54b0cbbcf9bab7a0eb2ee3935655c742f8ae6b20d10"
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
