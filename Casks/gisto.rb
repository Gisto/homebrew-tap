cask "gisto" do
  arch arm: "aarch64", intel: "x64"

  version "2.13.0"
  sha256 arm:   "c0af498e201afeb0a970efe30b9bf1e9ef6b0bd79318f17641717274efd815a3",
         intel: "070e064a410010914aa62c09ea02409723af4dadb55bf0e2ed2ef1f6b69ce703"

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
