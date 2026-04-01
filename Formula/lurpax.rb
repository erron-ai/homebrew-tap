class Lurpax < Formula
  desc "Encrypted snapshot vault CLI — zstd + XChaCha20-Poly1305 + Reed-Solomon"
  homepage "https://github.com/erron-ai/lurpax"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bdbe3157e5a4368c9b113735c058a3e02ba68318668a8b5342649e1040d93a91"
    end

    on_arm do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2e51c0de86c0388f7763bc9bf81b26a12c6c58c4dc7bd6964c0a4b5e97258307"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8cc6a86c838ffbad3dd1f42fd68c502f31cc1e9d5fe4fff4ca6af6a6a468a2ba"
    end

    on_arm do
      url "https://github.com/erron-ai/lurpax/releases/download/v#{version}/lurpax-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "182b1686fe0ccdc777f6b7ba0597d39d88a9bec85b6002cb87a0cc36ad413f64"
    end
  end

  def install
    path = File.exist?("lurpax") ? "lurpax" : Dir["lurpax-*/lurpax"].first
    odie "lurpax binary not found (expected lurpax or lurpax-*/lurpax in archive)" if path.nil?
    bin.install path => "lurpax"
  end

  test do
    assert_match "lurpax", shell_output("#{bin}/lurpax --help")
  end
end
