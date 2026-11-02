class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.24.tar.gz"
  sha256 "df71eb10aa9770a0bc5b88dc7c6ce34b71c357f4229e982ac07c868728e0442a"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.24/CC-Switch-v4.0.24-Linux-arm64.deb", using: :nounzip
      sha256 "2b33db1c9b74b91b502bb06bdd3e437a857e063eab12c17cf56d9cbc155ae2a0"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.24/CC-Switch-v4.0.24-Linux-x86_64.deb", using: :nounzip
      sha256 "74d9d37b1c7b0ca63f9fac987297020c991f6ce1db1b38d92c46e99aafab9d8b"
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
