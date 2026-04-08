class Gisto < Formula
  desc "Cross-platform snippets management desktop application"
  homepage "https://github.com/Gisto/Gisto"
  version "2.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_aarch64.app.tar.gz"
      sha256 "e862dab8a19d82d99cbc8ffee5128f02657f78470dffc280208a75489fa507a1"
    else
      url "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_x64.app.tar.gz"
      sha256 "58c646e2ba101fdc93b549f1f01c309cdb5521aeb8533cd06bb6f551752fe4d4"
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
      Gisto has been installed to:
        /opt/homebrew/Cellar/gisto/#{version}/Gisto.app
      
      To use Gisto, you can:
        - Open /Applications/Gisto.app (you may need to copy it first)
        - Or run directly from Cellar: open /opt/homebrew/Cellar/gisto/#{version}/Gisto.app
      
      Note: Gisto is not code-signed. On macOS, you may need to run:
        xattr -dr com.apple.quarantine /Applications/Gisto.app
      to allow the app to launch.
    EOS
  end
end
