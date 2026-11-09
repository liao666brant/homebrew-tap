class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.28.tar.gz"
  sha256 "b1b8ffc84663dc75edd4650e28218d2f068c35f286e92ff0eaf79f17bf768674"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.28/CC-Switch-v4.0.28-Linux-arm64.deb", using: :nounzip
      sha256 "986c6fa940509ec9c676c07c0b9698152d5dab9d6f21852184f68e3e2465e15a"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.28/CC-Switch-v4.0.28-Linux-x86_64.deb", using: :nounzip
      sha256 "41df68b6171fe8cca621d7106d35cd07537a854c20bf42af2a5e5e189d15f93e"
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
