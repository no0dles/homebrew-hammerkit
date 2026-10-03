class Hammerkit < Formula
  desc "Containerized build tool with incremental caching"
  homepage "https://hammerkit.dev"
  license "MIT"
  version_scheme 1
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.8.0/hammerkit-macos-arm64"
      sha256 "f8eadeff18433983bdf207a176d0376c4c63f788fbe3df6319f0016ae01dc097"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.8.0/hammerkit-macos-x64"
      sha256 "087242c7a7e2085c0bfd5acfb7f2fce389b8fa260ea9518d62bece5a6347fa8f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.8.0/hammerkit-linux-arm64"
      sha256 "efaea818766bb2f524b998c4db60d933ab3d58760e83d328859724fc93f540d3"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.8.0/hammerkit-linux-x64"
      sha256 "42518a9bed62be8c28f393f92ddf773cfe9e2788990039ed7bd3a7236d9a1956"
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
