cask "missionclose" do
  version "0.4.1"
  sha256 "e7d1996d46bb745a5cd9c398688f77957281941558d7bdb40bb957e3ad3af555"

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
    Open System Settings -> Privacy & Security and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/MissionClose.app"

    MissionClose also needs Accessibility access to read Mission Control's thumbnails and
    press a window's buttons: System Settings -> Privacy & Security -> Accessibility.
  EOS
end
