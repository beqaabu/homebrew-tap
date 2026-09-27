cask "missionclose" do
  version "0.3.0"
  sha256 "a38e152f8289213ae5c7f840628f7e28b33aa08bc134b33cdc7a220f4aaebcba"

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

  zap trash: "~/Library/Preferences/com.beqa.MissionClose.plist"

  caveats <<~EOS
    MissionClose is not notarized by Apple, so macOS blocks it the first time you open it.
    Open System Settings -> Privacy & Security and click "Open Anyway", or reinstall with:
      brew install --cask --no-quarantine beqaabu/tap/missionclose

    MissionClose also needs Accessibility access to read Mission Control's thumbnails and
    press a window's buttons: System Settings -> Privacy & Security -> Accessibility.
  EOS
end
