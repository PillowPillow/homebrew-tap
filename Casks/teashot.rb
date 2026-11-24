cask "teashot" do
  version "1.1.1"
  sha256 "5d64820f7f0669a1d9e3a332e2e3eff97b18f31598ebc54de0fe29bfa036f1f8"

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
