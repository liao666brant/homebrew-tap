class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.12.tar.gz"
  sha256 "9b24c14f80253f59ff243f927a0664bb9a53a8c5a13202be0863d57aedb569b0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.12/CC-Switch-v4.0.12-Linux-arm64.deb", using: :nounzip
      sha256 "89e43e74401747e9d4cdb87e8057b87e66450c083fd3375f168c385722ed0530"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.12/CC-Switch-v4.0.12-Linux-x86_64.deb", using: :nounzip
      sha256 "cb412da443c7f2eff2fa95ab9b3189de570a0aa9148134f18c5fa14a9214bf56"
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
