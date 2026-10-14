# Pinned for Macs below macOS 14, which the current protonvpn cask requires.
# Copied from homebrew-cask fd732d3, the last version that allowed macOS 13.
cask "protonvpn@ventura" do
  version "5.1.0"
  sha256 "93310a95e01749e77ca224197341e63c057a56f46f5d4b102945fbcb17d5dd22"

  url "https://vpn.protondownload.com/download/macos/#{version}/ProtonVPN_mac_v#{version}.dmg"
  name "ProtonVPN"
  desc "VPN client focusing on security"
  homepage "https://protonvpn.com/"

  auto_updates true
  conflicts_with cask: "protonvpn"
  depends_on macos: :ventura

  app "ProtonVPN.app"

  uninstall launchctl: "ch.protonvpn.ProtonVPNStarter",
            quit:      "ch.protonvpn.mac"

  zap trash: [
    "~/Library/Application Scripts/*.group.ch.protonvpn.mac",
    "~/Library/Application Scripts/ch.protonvpn.*",
    "~/Library/Application Support/CrashReporter/ProtonVPN*",
    "~/Library/Application Support/ProtonVPN",
    "~/Library/Caches/ch.protonvpn.mac",
    "~/Library/Caches/com.apple.nsurlsessiond/Downloads/ch.protonvpn.mac",
    "~/Library/Caches/SentryCrash/ProtonVPN",
    "~/Library/Containers/ch.protonvpn.*",
    "~/Library/Cookies/ch.protonvpn.mac.binarycookies",
    "~/Library/Group Containers/*.group.ch.protonvpn.mac",
    "~/Library/Logs/ProtonVPN.log",
    "~/Library/Preferences/ch.protonvpn.mac.plist",
    "~/Library/WebKit/ch.protonvpn.mac",
  ]
end
