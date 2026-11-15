class Hammerkit < Formula
  desc "Containerized build tool with incremental caching"
  homepage "https://hammerkit.dev"
  license "MIT"
  version_scheme 1
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v2.0.0/hammerkit-macos-arm64"
      sha256 "ffb6cd4fc21736dd1fbaddadab05bfe741f40219a88c0ff185eb05ff303d14eb"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v2.0.0/hammerkit-macos-x64"
      sha256 "180a997365ec094bde3dbf988fff96edc749dcbf9fab99ffb3f35eb4ec627058"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v2.0.0/hammerkit-linux-arm64"
      sha256 "57cb0761f77491d58caf993ec5df9dcd7d90de5f9827a67943e6153c39f187df"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v2.0.0/hammerkit-linux-x64"
      sha256 "f5d30cd32aba4eafc0f909d921dd5e6aa833b81884da9e8a86c90bda45ba5ad8"
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
