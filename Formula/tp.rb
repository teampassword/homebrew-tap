class Tp < Formula
  desc "TeamPassword CLI for AI agents and automated tools"
  homepage "https://teampassword.com"
  version "0.1.0"

  # Prebuilt, self-contained binaries attached to this tap's GitHub releases
  # (built with scripts/build-release.sh in the source repository).
  on_arm do
    # The arm64 build was made on macOS 15.2 and won't start on older systems.
    depends_on macos: :sequoia
    url "https://github.com/teampassword/homebrew-tap/releases/download/v0.1.0/tp-0.1.0-darwin-arm64.tar.gz"
    sha256 "6debcdf3ccc9008429e75650fac2454a5c2cdabad9df568a4df35562a3f80263"
  end
  on_intel do
    depends_on macos: :ventura
    url "https://github.com/teampassword/homebrew-tap/releases/download/v0.1.0/tp-0.1.0-darwin-x86_64.tar.gz"
    sha256 "f6c0db2384b87797f67425aca2dbae09ef5e9de7da3e2fdded3f53f131bb7ed1"
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
