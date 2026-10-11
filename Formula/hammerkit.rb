class Hammerkit < Formula
  desc "Containerized build tool with incremental caching"
  homepage "https://hammerkit.dev"
  license "MIT"
  version_scheme 1
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.24.0/hammerkit-macos-arm64"
      sha256 "5cf8baa3379b297143e5f4d317241ce3a880af80adc3344db7369f757f7d6318"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.24.0/hammerkit-macos-x64"
      sha256 "da2ce1314d25f5ab7c86f02a23d33d3ae925c7aebcb89eaaf146dc6030bc2b84"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.24.0/hammerkit-linux-arm64"
      sha256 "834b07b3ab28eca759e38c4a3c62c9c1ac239332895fbf84c61bdc57edfca122"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.24.0/hammerkit-linux-x64"
      sha256 "49d72e747fd19a0df3e48f2eff964219a8dffa3f5fadf5e7b7c7deb1386d16b2"
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
