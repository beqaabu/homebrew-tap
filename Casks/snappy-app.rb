cask "snappy-app" do
  version "1.3.0"
  sha256 "28720e84955c6b4069603d901bcf4d34eeaca7f608c2157fb7a2df304b5e0e06"

  url "https://github.com/beqaabu/Snappy/releases/download/v#{version}/Snappy-#{version}.zip"
  name "Snappy"
  desc "Ubuntu-style screenshot tool for selections, windows and the full screen"
  homepage "https://github.com/beqaabu/Snappy"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :sonoma

  app "Snappy.app"

  uninstall quit: "com.beqa.Snappy"

  zap trash: "~/Library/Preferences/com.beqa.Snappy.plist"

  caveats <<~EOS
    Snappy is not notarized by Apple, so macOS blocks it the first time you open it.
    Open System Settings -> Privacy & Security and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/Snappy.app"

    Snappy also needs Screen Recording access to take screenshots:
    System Settings -> Privacy & Security -> Screen & System Audio Recording.
    Press Cmd+Shift+2 to take a screenshot.
  EOS
end
