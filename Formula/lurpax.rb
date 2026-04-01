class Lurpax < Formula
  desc "Encrypted snapshot vault CLI — zstd + XChaCha20-Poly1305 + Reed-Solomon"
  homepage "https://github.com/erron-ai/lurpax"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e8b85ab2995edc59a64a870c5748bcd4a75fe3a7b66a5f7225b51b0f1c4e7200"
    end

    on_arm do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d581ab6dc9a576896fdaa384b6dddf484f2c4f114d647ad705763fbd0b6cd8a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a078b0978e11a300ff2a61f4ededabe4940150bebbae8799e75eb7f5e91f5908"
    end

    on_arm do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bfe0798d16135698182e626b28b18a3661204f8a32261aff0e8efd65af1fa441"
    end
  end

  def install
    # Release tarballs are lurpax-<tag>-<triple>/lurpax (erron-ai/lurpax release workflow).
    nested = Dir["lurpax-*/lurpax"].first
    odie "lurpax binary not found (expected lurpax-*/lurpax in archive)" if nested.nil?

    bin.install nested => "lurpax"
  end

  test do
    assert_match "lurpax", shell_output("#{bin}/lurpax --help")
  end
end
