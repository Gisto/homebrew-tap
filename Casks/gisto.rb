cask "gisto" do
  arch arm: "aarch64", intel: "x64"

  version "2.7.0"
  sha256 arm:   "b97ff9f912b0e4eaa8a2e644d38616d71009dcc091f76ff12cfb7b94e83c4485",
         intel: "c0647e4e7c0bc4d4c72fcec1087137695c3cb05f29033fbe260288bff6b50d97"

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
