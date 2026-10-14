class Hammerkit < Formula
  desc "Containerized build tool with incremental caching"
  homepage "https://hammerkit.dev"
  license "MIT"
  version_scheme 1
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.26.0/hammerkit-macos-arm64"
      sha256 "19f9a6f9e469657a17a8922674513b6109237f6a3ff743b1a273a1f75c670700"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.26.0/hammerkit-macos-x64"
      sha256 "b6dd5ffdc5817e9c2d94cdbe95b3ed87e55615a29a59ab569f6f67ca3fe69a55"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.26.0/hammerkit-linux-arm64"
      sha256 "1922cd5bec76fed2c6b9115f370d749af125c9cbc143fd15d571283b70e2b579"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.26.0/hammerkit-linux-x64"
      sha256 "86544eaa6a95b3ed1b17b9dd77d30df1ff664429409600d2236e90bba26c0d61"
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
