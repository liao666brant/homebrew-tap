class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v3.19.1.tar.gz"
  sha256 "254657bca62e5e65305f88dcf0f3babd074cf4d4dccb6e7587f1096075cf0517"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.19.1/CC-Switch-v3.19.1-Linux-arm64.deb", using: :nounzip
      sha256 "4ad46000fa589b91c3dc5a85fdc4fa75d28ec4d74329fb1bcf54c6fc12b93178"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v3.19.1/CC-Switch-v3.19.1-Linux-x86_64.deb", using: :nounzip
      sha256 "3d52bc01034077ce37a126c7fa8e3a7e8a53d178e92d8f3dc04f180344f37d87"
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
