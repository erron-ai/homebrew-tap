class Lurpax < Formula
  desc "Encrypted snapshot vault CLI — zstd + XChaCha20-Poly1305 + Reed-Solomon"
  homepage "https://github.com/erron-ai/lurpax"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "60c988c7b74b1f497514cffccb904fb561681cc744b0fe7406e6fe35fc622819"
    end

    on_arm do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "81b8ac60db0ced80bac529363e6e1d7b34a5c2b1a0fbafc72a5196e69dbcd5bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "425fe3e08b636a89333b645dcee6583fecb116a8dce27a11c67fc5ae397ededc"
    end

    on_arm do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1684e350d03d57f10ad5d61f922209c33c86fc081e949a7a690f1c743baadccb"
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
