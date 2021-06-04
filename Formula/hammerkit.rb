class Hammerkit < Formula
  desc "Build tool with support for containerization and caching"
  homepage "https://no0dles.gitbook.io/hammerkit/"
  license "MIT"
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-macos-arm64"
      sha256 "4f87742dc6f6fe1646142d8df60bd87efc2102c0dd102573d96a848a5642f923"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-macos-x64"
      sha256 "fc1819152dd62ddf610a697d1baba59a7caa98bba082256af89acc97b0d306e0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-linux-arm64"
      sha256 "8aede5ed66c534937b29cce78f7c3105ddad61b1b85c66676a60e7170f617f8a"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-linux-x64"
      sha256 "4db2726c657760a9ec9e61589489e241b681e9591a37020bec9cc07e1a3e12c6"
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
    assert_match "v1.3.16", shell_output("#{bin}/hammerkit -V")
  end
end
