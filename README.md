# Homebrew Tap for Gisto

This directory contains the formula for installing Gisto via Homebrew tap.

## Installation

```bash
brew install Gisto/tap/gisto
```

## For Maintainers

The `homebrew-tap.yml` workflow in the main Gisto repository will automatically:
1. Trigger when a new release is published
2. Download the macOS tarball and calculate SHA256
3. Create a PR to update the formula in `Gisto/homebrew-tap`

Merge the PR to make the new version available.

## Note on Code Signing

Gisto is not code-signed. Users may need to run:
```bash
xattr -dr com.apple.quarantine /Applications/Gisto.app
```
