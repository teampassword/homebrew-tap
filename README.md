# TeamPassword Homebrew tap

```bash
brew install teampassword/tap/tp
```

Upgrade with `brew update && brew upgrade tp`.

Requires macOS 15 (Sequoia) or newer on Apple Silicon, or macOS 13 (Ventura)
or newer on Intel.

## Releasing a new version

1. Bump `version` in the source repository's `shard.yml`, commit and push.
2. On an Apple Silicon Mac and on an Intel Mac, run `./scripts/build-release.sh`
   in the source repository. Each run prints the archive path
   (`dist/tp-<version>-darwin-<arch>.tar.gz`) and its SHA-256.
3. In this repository, create a GitHub release tagged `v<version>` and attach
   both archives.
4. In `Formula/tp.rb`, update `version`, both `url`s and both `sha256`s.
   If the arm64 build was made on a newer macOS, raise its `depends_on macos:`.
5. Commit and push this repository.
