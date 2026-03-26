cask "quickfolder" do
  version "1.0.1"
  sha256 "0e70f7e8de452fa21cde0a32dbae520fea18e6bb6ae064dae39ed5a1a1420a4e"

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
