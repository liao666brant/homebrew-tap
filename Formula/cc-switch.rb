class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.31.tar.gz"
  sha256 "18c223327c58dd95413886de3d51add94057b8d5563dd6dbe598ec16e7194e92"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.31/CC-Switch-v4.0.31-Linux-arm64.deb", using: :nounzip
      sha256 "0e4667067934428ff0fa4d143ba699b34f66425e50acd4fa94b938c66deaba4c"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.31/CC-Switch-v4.0.31-Linux-x86_64.deb", using: :nounzip
      sha256 "749ccced0fb4185148f7917084bb5e230b1adef43313b6e7621d602bd840a7b3"
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
