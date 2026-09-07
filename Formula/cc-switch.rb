class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.20.2.tar.gz"
  sha256 "4a82224e52f042f7cfcd8831ce82cc6243c6d409fb8853633ffb552a95afd285"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.20.2/CC-Switch-v3.20.2-Linux-arm64.deb", using: :nounzip
      sha256 "02e34865b657604403ec6e2153672115e5cdd9de2cbaa418d4b9c40bfa8b7689"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.20.2/CC-Switch-v3.20.2-Linux-x86_64.deb", using: :nounzip
      sha256 "ef0261bd9e84d7b79b0393fcc5dbc91664ab1b771d22fd108dbc9ada0f7b3fc7"
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
