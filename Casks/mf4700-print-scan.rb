cask "mf4700-print-scan" do
  version "2.6"
  sha256 "c7fdef750e8e993ac49247f40c7efd7392a2ba06ed0701293d3126b2850af507"

  url "https://github.com/pkhr/mf4700-print-scan/releases/download/v#{version}/Canon-MF4780w-Print-and-Scan-#{version}.dmg"
  name "Canon MF4780w Print & Scan"
  desc "Driverless printing and scanning for Canon MF4700-series printers"
  homepage "https://github.com/pkhr/mf4700-print-scan"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Canon MF4780w Print & Scan.app"

  uninstall quit: "local.mf4700-airprint"

  zap trash: [
    "~/Library/Application Support/Canon MF4780w Print & Scan",
    "~/Library/Logs/Canon MF4780w Print & Scan.log*",
    "~/Library/Preferences/local.mf4700-airprint.plist",
  ]

  caveats <<~EOS
    #{token} is not notarized by Apple, so macOS blocks its first launch:
    open it once, then click Open Anyway in System Settings > Privacy & Security.
    After an upgrade, open the app again.
  EOS
end
