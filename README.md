# TeamPassword Homebrew tap (private)

Requires read access to the `teampassword` GitHub organization: both this
tap and the formula's source repository are private and are cloned with
your own GitHub credentials.

```bash
brew tap teampassword/tap https://github.com/teampassword/homebrew-tap.git
brew install teampassword/tap/tp
```

Upgrade with `brew update && brew upgrade tp`.

## Releasing a new version

1. Tag the source repo (`git tag v0.2.0 && git push origin v0.2.0`).
2. In `Formula/tp.rb`, update `tag:` and `revision:` (the tagged commit's full SHA).
3. Commit and push this repo.
