cask "quickfolder" do
  version "1.0.4"
  sha256 "cfd651de2c1c4247fcc342f39547704690f62adf23c055d8367c4c9fcb40783a"

  url "https://github.com/don-key/quickfolder/releases/download/v#{version}/QuickFolder-#{version}-arm64.dmg"
  name "QuickFolder"
  desc "macOS 폴더 관리 유틸리티 - 빠른 폴더 접근"
  homepage "https://github.com/don-key/quickfolder"

  app "QuickFolder.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/QuickFolder.app"],
                   sudo: true
  end

  zap trash: [
    "~/Library/Application Support/quickfolder",
  ]
end
