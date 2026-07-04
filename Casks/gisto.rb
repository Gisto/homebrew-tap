cask "gisto" do
  arch arm: "aarch64", intel: "x64"

  version "2.12.0"
  sha256 arm:   "4fb1f99a825a658fe8ee59281672ec15821c51286855607491b21f10962d0bfb",
         intel: "7f3fe451545b6b78a86ea3bb56a439309b4772ba27ccba88b8ed20132dd4ab45"

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
