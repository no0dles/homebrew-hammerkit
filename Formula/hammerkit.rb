class Hammerkit < Formula
  desc "Containerized build tool with incremental caching"
  homepage "https://no0dles.gitbook.io/hammerkit/"
  license "MIT"
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.7.0/hammerkit-macos-arm64"
      sha256 "c2843818c1d9e733fa88573611c0f5e5eaaa1631bd4151a15578997e2c6ea05f"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.7.0/hammerkit-macos-x64"
      sha256 "4ee3d9e63077867a21f958a4cd6c3c42f1ff3d89bc54fc1afad2599ebfe3ce7c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.7.0/hammerkit-linux-arm64"
      sha256 "5f7c0f32c83ed5b6084c1cce0f005e35a94a39871e7104e90d3ecf7933d47df9"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.7.0/hammerkit-linux-x64"
      sha256 "e451017be6dc384bb9396bb8b20663a3f87ef78a6f0993c6a293a07f19fef891"
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
