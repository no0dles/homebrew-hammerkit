class Hammerkit < Formula
  desc "build tool with support for containerization, build caching for local development and ci"
  homepage "https://no0dles.gitbook.io/hammerkit/"
  license "MIT"
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/{{VERSION}}/hammerkit-macos-arm64"
      sha256 "{{MACOS-ARM64-SHA256}}"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/{{VERSION}}/hammerkit-macos-x64"
      sha256 "{{MACOS-AMD64-SHA256}}"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/{{VERSION}}/hammerkit-linux-arm64"
      sha256 "{{LINUX-ARM64-SHA256}}"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/{{VERSION}}/hammerkit-linux-x64"
      sha256 "{{LINUX-AMD64-SHA256}}"
    end
  end

  def install
    on_macos do
      if Hardware::CPU.arm?
        bin.install "hammerkit-macos-arm64" => 'hammerkit'
      else
        bin.install "hammerkit-macos-x64" => 'hammerkit'
      end
    end
    on_linux do
      if Hardware::CPU.arm?
        bin.install "hammerkit-linux-arm64" => 'hammerkit'
      else
        bin.install "hammerkit-linux-x64" => 'hammerkit'
      end
    end
  end

  test do
    assert_match "{{VERSION}}", shell_output("#{bin}/hammerkit -V")
  end
end
