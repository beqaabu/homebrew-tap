cask "missionclose" do
  version "0.2.1"
  sha256 "5064eba645111238c05d1e47782581c2dcdb104fe4fd2541aceebe591d455e60"

  url "https://github.com/beqaabu/MissionClose/releases/download/v#{version}/MissionClose-#{version}.zip"
  name "MissionClose"
  desc "Close, minimize and full-screen buttons for windows in Mission Control"
  homepage "https://github.com/beqaabu/MissionClose"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :ventura"

  app "MissionClose.app"

  uninstall quit: "com.beqa.MissionClose"

  zap trash: [
    "~/Library/Preferences/com.beqa.MissionClose.plist",
  ]
end
