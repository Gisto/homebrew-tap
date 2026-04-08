cask "gisto" do
  arch arm: "aarch64", intel: "x64"

  version "2.7.0"
  sha256 arm:   "c1578cde1ef5c572de7e198884fcadabca20d3424f3120dd26b352de1945ccea",
         intel: "de4c04c0df7a6c59833c59406be522860eebdb26681ff19472437a25a94d722f"

  url do
    base_url = "https://github.com/Gisto/Gisto/releases/download/v2.7.0/Gisto_2.7.0_<arch>.dmg"
    base_url.gsub("<arch>", Hardware::CPU.arch == :arm ? "aarch64" : "x64")
  end
  name "Gisto"
  desc "Cross-platform snippets management desktop application"
  homepage "https://www.gisto.org/"

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
