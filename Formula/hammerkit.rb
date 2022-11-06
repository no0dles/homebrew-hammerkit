class Hammerkit < Formula
  desc "Build tool with support for containerization and caching"
  homepage "https://no0dles.gitbook.io/hammerkit/"
  license "MIT"
  head "https://github.com/no0dles/hammerkit"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.5.0-alpha.0/hammerkit-macos-arm64"
      sha256 "579109597f0fff978b7e7995f521e8fe2fae7006f69ef1b85eb28fc04fefbb72"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.5.0-alpha.0/hammerkit-macos-x64"
      sha256 "9fee5b4478baa9d5c5f8610a2e5308eaf714c996293577390aeb3acdb04d2a57"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/no0dles/hammerkit/releases/download/v1.5.0-alpha.0/hammerkit-linux-arm64"
      sha256 "cfddce9f68366c25e253d26601af7639eea7b464bc74df9d31d5f271534aa9db"
    else
      url "https://github.com/no0dles/hammerkit/releases/download/v1.5.0-alpha.0/hammerkit-linux-x64"
      sha256 "99e42f3f2f7aafdf9389e9cb7e2dd7ce361b27fd95dfa9dd3f0ac9be78bbd7e7"
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
    assert_match "v1.5.0-alpha.0", shell_output("#{bin}/hammerkit -V")
  end
end
