cask "gisto" do
  arch arm: "aarch64", intel: "x64"

  version "2.8.0"
  sha256 arm:   "f7603ce42a98153c7aa788608b8bc642b830bf4212948d6e9df919c88c86cb5e",
         intel: "9a129326fb0e12d70dd1515503a7d8a77596da5468c12c6d9134aea80eec62f3"

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
