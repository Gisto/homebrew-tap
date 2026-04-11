cask "gisto" do
  arch arm: "aarch64", intel: "x64"

  version "2.7.1"
  sha256 arm:   "451dff2c66f32425625eeb39ab236c046dfb831cc12549e2788a9ee5ce16b427",
         intel: "a2ab332982d66fa14d0ef9578232b30e04b28a25bd1a226c86f0a14e17b2d662"

  url "https://github.com/Gisto/Gisto/releases/download/v#{version}/Gisto_#{version}_#{arch}.dmg"
  name "Gisto"
  desc "Cross-platform snippets management desktop application"
  homepage "https://www.gisto.org/"

  caveats do
    <<~EOS
      This app is signed with a self-signed certificate and is not notarized.

      macOS may block it on first launch. To open:
  
        - Right-click the app and choose "Open", or
        - Open System Settings → Privacy & Security and click "Open Anyway"
  
      You can also remove the quarantine flag:
  
        xattr -dr com.apple.quarantine /Applications/Gisto.app
  
      Only run this app if you trust the source.
    EOS
  end

  app "Gisto.app"

  zap trash: [
    "~/Library/Application Support/Gisto",
    "~/Library/Caches/com.gistoapp.gisto2",
    "~/Library/Logs/Gisto",
    "~/Library/Preferences/com.gistoapp.gisto2.helper.plist",
    "~/Library/Preferences/com.gistoapp.gisto2.plist",
    "~/Library/Saved Application State/com.gistoapp.gisto2.savedState",
  ]
end
