cask "missionclose" do
  version "0.3.1"
  sha256 "dd05cc540311b39fb47a0ed9305572d4bc52e907be25f71b0be5b5eb718b83f3"

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
