class Envctl < Formula
  desc "Environment files from a template and SOPS/age-encrypted secrets"
  homepage "https://github.com/PillowPillow/envctl"
  version "2.1.0"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/PillowPillow/envctl/releases/download/v#{version}/envctl_darwin_arm64.tar.gz"
      sha256 "7ab87d5f1219db895b2f3dc15338d7698f1ac6ae0ebbad875a5b2a0837bfd5e9"
    end
    on_intel do
      url "https://github.com/PillowPillow/envctl/releases/download/v#{version}/envctl_darwin_amd64.tar.gz"
      sha256 "54e8a1e74e57f6218a00b2bd731ad9e1e1015a29983eeb00f5b40b4429781b3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PillowPillow/envctl/releases/download/v#{version}/envctl_linux_arm64.tar.gz"
      sha256 "d5f7a727c695c5437d51113d09d64664842b6cd1c8cc2e21a5e0aa329d3fae7d"
    end
    on_intel do
      url "https://github.com/PillowPillow/envctl/releases/download/v#{version}/envctl_linux_amd64.tar.gz"
      sha256 "0e1447c3343aa884de6fd1923debffe92ada1130d0cbfe2b1c49d5283d0f996e"
    end
  end

  depends_on "age"
  depends_on "sops"

  def install
    bin.install "envctl"
    generate_completions_from_executable(bin/"envctl", "completion")
  end

  test do
    assert_match "envctl #{version}", shell_output("#{bin}/envctl version")
  end
end
