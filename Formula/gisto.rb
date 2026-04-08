class Gisto < Formula
  desc "Cross-platform snippets management desktop application"
  homepage "https://github.com/Gisto/Gisto"
  version ""

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gisto/Gisto/releases/download/v/Gisto_aarch64.app.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
      url "https://github.com/Gisto/Gisto/releases/download/v/Gisto_x64.app.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
