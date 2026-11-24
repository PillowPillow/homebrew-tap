cask "teashot" do
  version "1.1.0"
  sha256 "7e5ad5cbd656f9e98e95d0b41e64d5104be70a6f97a9b854fedaf8bf83ea2f3a"

  url "https://github.com/PillowPillow/tea-shot/releases/download/v#{version}/TeaShot.zip"
  name "TeaShot"
  desc "Menu bar app that keeps the computer awake"
  homepage "https://github.com/PillowPillow/tea-shot"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "TeaShot.app"

  # TeaShot is not notarized: Gatekeeper blocks the first launch while the quarantine attribute is set.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/TeaShot.app"]
  end

  uninstall quit: "io.github.pillowpillow.teashot"

  zap trash: "~/Library/Containers/io.github.pillowpillow.teashot"
end
