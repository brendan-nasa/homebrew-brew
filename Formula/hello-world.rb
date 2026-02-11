class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.1.tar.gz"
  sha256 "9350d8d8bba408dbd3f4b80160daf116b0235f4627d32845bc14dd519b5356ff"
  license "MIT"
  revision 1

  bottle do
    root_url "https://github.com/brendan-nasa/homebrew-brew/releases/download/hello-world-0.1_1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "08097f5b41f189ef396691040a3eca8dd9b02ebb8ee1ec405b91f9ca965c8bdc"
    sha256 cellar: :any_skip_relocation, sequoia:      "390660da984279951431ae7f4d2a47d66d678f2443d4f044bd3f8f79f10fca8b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "476a7d274806fd563ed725393794b0a24dc79eb21761a3e0ee41bde70d9a6bb3"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_equal "Hello, World!\n", shell_output("#{bin}/hello")
  end
end
