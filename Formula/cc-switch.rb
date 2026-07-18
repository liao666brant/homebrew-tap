class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.17.0.tar.gz"
  version "3.17.0"
  sha256 "8ae7c878c7de955ff9bd1f13dc22ff9b680267b889ec9b285f62aae03142ab40"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.17.0/CC-Switch-v3.17.0-Linux-arm64.deb", using: :nounzip
      sha256 "8b1b2ba9cca007d0b5070670b7d8904d45789402f5ab915ba9d619cad3621052"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.17.0/CC-Switch-v3.17.0-Linux-x86_64.deb", using: :nounzip
      sha256 "1d457532c5bc39fd0189b47c159e7d4b596c3244ceb38bdc89b1f6cdc9f51e7a"
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
