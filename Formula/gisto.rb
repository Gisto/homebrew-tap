class Gisto < Formula
  desc "Cross-platform snippets management desktop application"
  homepage "https://github.com/Gisto/Gisto"
  version "2.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_aarch64.app.tar.gz"
      sha256 "5503a126654ef3c4559ac90c90326368b653d1b3f05bc7f56dfcca6fb0a1ed73"
    else
      url "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_x64.app.tar.gz"
      sha256 "6cba1cb21deb1f3a0812e06ac3c106f648d8e2b48ef0dfdce958f11f15ebc187"
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

  def caveats
    <<~EOS
      Gisto is not code-signed. On macOS, you may need to run:
        xattr -dr com.apple.quarantine /Applications/Gisto.app
      to allow the app to launch.
    EOS
  end
end
