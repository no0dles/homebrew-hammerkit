class Hammerkit < Formula
  desc "Build tool with support for containerization and caching"
  homepage "https://no0dles.gitbook.io/hammerkit/"
  license "MIT"
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.4.0/hammerkit-macos-arm64"
      sha256 "4ffe5bbc7179b7b14f7d58e656c30ff1d9a2e090825afeb6db2016ffbb8aa69a"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.4.0/hammerkit-macos-x64"
      sha256 "a5e42614b90932c7c091356a4d517106bef8d5c8d39b26e30ed18a66990104c3"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.4.0/hammerkit-linux-arm64"
      sha256 "7f0829d23e5b63c130380af6f4693731280fdd5d40a8721e0a05c2d12c6097d4"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.4.0/hammerkit-linux-x64"
      sha256 "04ed0df461bb41f69a02f291e2e1db0eab37b449d3635e980ddad4f08477cc90"
    end
  end

  def install
    on_macos do
      if Hardware::CPU.arm?
        bin.install "hammerkit-macos-arm64" => "hammerkit"
      else
        bin.install "hammerkit-macos-x64" => "hammerkit"
      end
    end
    on_linux do
      if Hardware::CPU.arm?
        bin.install "hammerkit-linux-arm64" => "hammerkit"
      else
        bin.install "hammerkit-linux-x64" => "hammerkit"
      end
    end
  end

  test do
    assert_match "v1.4.0", shell_output("#{bin}/hammerkit -V")
  end
end
