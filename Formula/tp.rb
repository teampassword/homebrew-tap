class Tp < Formula
  desc "TeamPassword CLI for AI agents and automated tools"
  homepage "https://github.com/teampassword/teampassword_cli_crystal"
  # Private repo: cloned with the installer's own GitHub credentials.
  url "https://github.com/teampassword/teampassword_cli_crystal.git",
      tag:      "v0.1.0",
      revision: "37af81d3824d3bd91add7fd98c7a5b2e14079748"

  depends_on "crystal" => :build
  depends_on "bdw-gc"
  depends_on "gmp"
  depends_on "libevent"
  depends_on :macos
  depends_on "openssl@3"
  depends_on "pcre2"

  def install
    system "shards", "install", "--production"
    system "crystal", "build", "src/tp.cr", "-o", "tp", "--release", "--no-debug"
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
