class Gisto < Formula
  desc "Cross-platform snippets management desktop application"
  homepage "https://github.com/Gisto/Gisto"
  version "2.6.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gisto/Gisto/releases/download/v2.6.2/Gisto_aarch64.app.tar.gz"
      sha256 "a6e2d3fb8ac358faab2246c91c3ba2928ab725fb229c827f289fca8340ad10c5"
    else
      url "https://github.com/Gisto/Gisto/releases/download/v2.6.2/Gisto_x64.app.tar.gz"
      sha256 "386c6a15db13f8f0cc98b80efb316fe2d7ccdda3ca05a78ad3a45b06bb6d9958"
    end
  end

  def install
    prefix.install "Gisto.app"
  end

  def post_install
    return unless OS.mac?

    appdir = HOMEBREW_PREFIX/"Applications"
    appdir.mkpath unless appdir.exist?
    return if (appdir/"Gisto.app").exist?

    cp_r "#{prefix}/Gisto.app", appdir
  end

  def caveats
    <<~EOS
      Gisto is not code-signed. On macOS, you may need to run:
        xattr -dr com.apple.quarantine /Applications/Gisto.app
      to allow the app to launch.
    EOS
  end
end
