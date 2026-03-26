cask "quickfolder" do
  version "1.0.3"
  sha256 "09b9d2bbbd59b3805073887ee4872a7fc375c7dcdc01fcae91b8a2679d688e6d"

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
