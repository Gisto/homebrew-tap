class Gisto < Formula
  desc "Cross-platform snippets management desktop application"
  homepage "https://github.com/Gisto/Gisto"
  version "2.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_2.7.0_aarch64.dmg"
      sha256 "d84c9bba8d7686771c66fd14d740f7778fbe41ee25b18b0702592bc47dbb21e2"
    else
      url "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_2.7.0_x64.dmg"
      sha256 "469e8826eb8fb9bffee58b5ed9b0616eef56f6d3f6a10f291509c200dcf2db00"
    end
  end

  def install
    pkg.install
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
    EOS
  end
end
