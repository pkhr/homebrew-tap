cask "mf4700-print-scan" do
  version "2.6.1"
  sha256 "26f9d0b89e67e889866c2d401cbd8e433195fe1c196b7dbc4d078e796868dc8c"

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
    An upgrade quits Canon MF4780w Print & Scan: open it again afterwards.
  EOS
end
