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
  depends_on macos: :ventura

  app "MissionClose.app"

  uninstall quit: "com.beqa.MissionClose"

  caveats <<~EOS
    MissionClose is not notarized by Apple, so macOS blocks it the first time you open it.
    Open System Settings -> Privacy & Security and click "Open Anyway", or reinstall with:
      brew install --cask --no-quarantine beqaabu/tap/missionclose

    MissionClose also needs Accessibility access to read Mission Control's thumbnails and
    press a window's buttons: System Settings -> Privacy & Security -> Accessibility.
  EOS

  zap trash: "~/Library/Preferences/com.beqa.MissionClose.plist"
end
