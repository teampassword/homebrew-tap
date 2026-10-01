# TeamPassword Homebrew tap (private)

Requires read access to the `teampassword` GitHub organization: both this
tap and the formula's source repository are private and are cloned with
your own GitHub credentials.

## Before you install: GitHub access

The formula downloads the private source over **SSH**, so you need an SSH
key registered with GitHub that can read the `teampassword` repos. Check:

```bash
ssh -T git@github.com
```

- **You use SSH with GitHub**: tap over SSH, since `brew tap` defaults to HTTPS:
  ```bash
  brew tap teampassword/tap git@github.com:teampassword/homebrew-tap.git
  ```
- **You only use HTTPS** (saved credentials or `gh auth login`): send the
  SSH source URL over HTTPS instead, then tap normally:
  ```bash
  git config --global url."https://github.com/teampassword/".insteadOf "ssh://git@github.com/teampassword/"
  ```

```bash
brew tap teampassword/tap https://github.com/teampassword/homebrew-tap.git
brew install teampassword/tap/tp
```

Upgrade with `brew update && brew upgrade tp`.

## Releasing a new version

1. Tag the source repo (`git tag v0.2.0 && git push origin v0.2.0`).
2. In `Formula/tp.rb`, update `tag:` and `revision:` (the tagged commit's full SHA).
3. Commit and push this repo.
