cask "quickfolder" do
  version "1.1.1"
  sha256 "90a8290f6fd726cbd6da966b81f31c7328d6441bd8d70426943128fcab9600c7"

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
