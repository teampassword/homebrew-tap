class Tp < Formula
  desc "TeamPassword CLI for AI agents and automated tools"
  homepage "https://teampassword.com"
  version "0.1.1"

  # Prebuilt, self-contained binaries attached to this tap's GitHub releases
  # (built with scripts/build-release.sh in the source repository).
  on_arm do
    # The arm64 build was made for macOS 15.0 and won't start on older systems.
    depends_on macos: :sequoia
    url "https://github.com/teampassword/homebrew-tap/releases/download/v0.1.1/tp-0.1.1-darwin-arm64.tar.gz"
    sha256 "831fde633a9c2c354a7ac9d18b566ad9b72d5b7574507db7bbc05fcbe23c8437"
  end
  on_intel do
    depends_on macos: :ventura
    url "https://github.com/teampassword/homebrew-tap/releases/download/v0.1.1/tp-0.1.1-darwin-x86_64.tar.gz"
    sha256 "27db1c0907b33dc069e368d4b9e7b3afe3d0b6754c961ed14b37cd75ff352100"
  end

  depends_on :macos

  def install
    bin.install "tp"
  end

  def caveats
    <<~EOS
      Touch ID approval needs the Xcode Command Line Tools (installed with
      Homebrew); tp compiles its small Swift helpers on first use.
    EOS
  end

  test do
    ENV["TP_CONFIG_DIR"] = testpath.to_s
    assert_match "Not authenticated.", shell_output("#{bin}/tp whoami")
    assert_match "minimal CLI for TeamPassword Agents", shell_output("#{bin}/tp")
  end
end
