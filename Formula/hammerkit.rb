class Hammerkit < Formula
  desc "Containerized build tool with incremental caching"
  homepage "https://hammerkit.dev"
  license "MIT"
  version_scheme 1
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.25.0/hammerkit-macos-arm64"
      sha256 "ce3602b685a2b44ed4179bdded962585f979673ca1f5a16b0080e789623da4fc"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.25.0/hammerkit-macos-x64"
      sha256 "38c9b5087664048f6ded2fcba43b5c4da1d233000a7764f62c89d24681212326"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.25.0/hammerkit-linux-arm64"
      sha256 "e81bc9c8499a3bea6917e4dfe83c4b821cc1163ac9a1bc413f4c8c39a51c2420"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.25.0/hammerkit-linux-x64"
      sha256 "d23f8431dd2d9829b2aacec4a243728f21e64eeaa1fb303943a3b9ea57e3ede3"
    end
  end

  def install
    os = OS.mac? ? "macos" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "hammerkit-#{os}-#{arch}" => "hammerkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hammerkit --version")
  end
end
