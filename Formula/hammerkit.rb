class Hammerkit < Formula
  desc "build tool with support for containerization, build caching for local development and ci"
  homepage "https://no0dles.gitbook.io/hammerkit/"
  license "MIT"
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-macos-arm64"
      sha256 "176ab64ad860e363428ce3e4b23e8207576f8a65a567761475281cda25887640"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-macos-x64"
      sha256 "8f67b80b697ce9ac28edd7b08c484149b28e8706ecf477f540caa2fc5adab2bb"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-linux-arm64"
      sha256 "91ac6fc353b6bf39d995572b700e37a20e119a87034eeb939a6f24356fbcd207"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-linux-x64"
      sha256 "91ac6fc353b6bf39d995572b700e37a20e119a87034eeb939a6f24356fbcd207"
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
    assert_match "1.3.16", shell_output("#{bin}/hammerkit -V")
  end
end
