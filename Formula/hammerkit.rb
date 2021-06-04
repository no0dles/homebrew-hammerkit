class Hammerkit < Formula
  desc "Build tool with support for containerization and caching"
  homepage "https://no0dles.gitbook.io/hammerkit/"
  license "MIT"
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-macos-arm64"
      sha256 "4ab23a23bed43c5c05c7d2ef7ebc3adccb7a1aed666f6b0bb8c17be212b4aaaa"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-macos-x64"
      sha256 "8f67b80b697ce9ac28edd7b08c484149b28e8706ecf477f540caa2fc5adab2bb"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-linux-arm64"
      sha256 "cc6e4e3a5811e3c3a760fa99d709334905668b9c53f9a413c1c07df8ed11486e"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.3.16/hammerkit-linux-x64"
      sha256 "80ee0688e5ead0c65edc9774b4b05cf5b859e4d91ca6863ddd1147fa417eec20"
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
