class Lurpax < Formula
  desc "Encrypted snapshot vault CLI — zstd + XChaCha20-Poly1305 + Reed-Solomon"
  homepage "https://github.com/erron-ai/lurpax"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "57dca8dab94c6ecfef5cd2e73fef1be332d400fe022b0f1ae83a990e313fb932"
    end

    on_arm do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c55f8e64e0a8868de7f3a9b214e37083ed36a3b0ecb7ceff3dc36cf155b701db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dbb1528fb49d251b1f89a1406d52c1963c1cd013cf16c96bdf2c07908d6c49b2"
    end

    on_arm do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a2a7c702d26a8de79b44dd581c13043f45f4ba4b5a4d510058b3af5a8a2fcc52"
    end
  end

  def install
    bin.install Dir["lurpax-v*/lurpax"].first
  end

  test do
    assert_match "lurpax", shell_output("#{bin}/lurpax --help")
  end
end
