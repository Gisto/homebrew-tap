class Gisto < Formula
  desc "Cross-platform snippets management desktop application"
  homepage "https://github.com/Gisto/Gisto"
  version "2.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_aarch64.app.tar.gz"
      sha256 "3564d29b36510b0f24e1b4c66eca4ff6d36b1456d74b62cf2afd8ae1fdf0a89a"
    else
      url "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_x64.app.tar.gz"
      sha256 "046c13715da5baec845ae564b5b6cf9ab4aa0feec1a9d812d8c7aa08f35e74a0"
    end
  end

  def install
    system "/usr/bin/tar", "-xzf", cached_download, "-C", buildpath
    
    extracted_items = Dir.entries(buildpath) - ['.', '..']
    
    if extracted_items.include?("Gisto.app")
      FileUtils.mv buildpath/"Gisto.app", prefix
    elsif extracted_items.include?("Contents")
      (prefix/"Gisto.app").mkpath
      FileUtils.mv buildpath/"Contents", prefix/"Gisto.app/Contents"
    end
  end

  def post_install
    return unless OS.mac?

    # Copy to /Applications (standard macOS location)
    appdir = Pathname.new("/Applications")
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
