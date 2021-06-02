require "language/node"

class Hammerkit < Formula
  desc "build tool with support for containerization, build caching for local development and ci"
  homepage "https://no0dles.gitbook.io/hammerkit/"
  url "https://github.com/no0dles/hammerkit/archive/refs/tags/v1.3.14.tar.gz"
  sha256 "07d37daeab119e6a5a1777f20262faecc9ecec567e80a4eb39e9eb7271717019"
  license "MIT"
  head "https://github.com/no0dles/hammerkit"

  depends_on "node" => :build

  #bottle do
    #sha256 cellar: :any_skip_relocation, x86_64_linux: "41de917a9f9ff33c72b2bee8f75e684822d91372e635bd2977c373feae2b1ef8"
  #end

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    system "node_modules/.bin/tsc", "-b", "tsconfig.build.json"
    system "node_modules/.bin/pkg", ".", "-t", "node14"
    bin.install 'hammerkit'
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test hammerkit`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
