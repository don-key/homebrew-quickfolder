cask "quickfolder" do
  version "1.0.5"
  sha256 "3c6188941569648ac464b1154796797f4371dd9adce8b3ce9464da0de515cd0c"

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
