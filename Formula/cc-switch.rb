class CcSwitch < Formula
  desc "All-in-one desktop assistant for AI coding tools"
  homepage "https://github.com/farion1231/cc-switch"
  url "https://github.com/farion1231/cc-switch/archive/refs/tags/v4.0.9.tar.gz"
  sha256 "63b5017e93c2b234d07d23a665748ebad4092b7763ca4c66802301ac1dc48a24"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :linux

  resource "binary" do
    on_arm do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.9/CC-Switch-v4.0.9-Linux-arm64.deb", using: :nounzip
      sha256 "288809084bca33084c7d30166cf9245e8ffaebb48991bb5849232ec6b0a60477"
    end

    on_intel do
      url "https://github.com/farion1231/cc-switch/releases/download/v4.0.9/CC-Switch-v4.0.9-Linux-x86_64.deb", using: :nounzip
      sha256 "57b716d336f9a28034c6eb3329ad5f11e7e5155e8ca11fbcfdde9f47a9aba91b"
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
