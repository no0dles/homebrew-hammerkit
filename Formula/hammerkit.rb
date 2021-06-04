class Hammerkit < Formula
  desc "Build tool with support for containerization and caching"
  homepage "https://no0dles.gitbook.io/hammerkit/"
  license "MIT"
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/{{undefined}}/hammerkit-macos-arm64"
      sha256 "{{undefined}}"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/{{undefined}}/hammerkit-macos-x64"
      sha256 "{{undefined}}"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/{{undefined}}/hammerkit-linux-arm64"
      sha256 "{{undefined}}"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/{{undefined}}/hammerkit-linux-x64"
      sha256 "{{undefined}}"
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
    assert_match "{{undefined}}", shell_output("#{bin}/hammerkit -V")
  end
end
