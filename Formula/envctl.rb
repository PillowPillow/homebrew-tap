class Envctl < Formula
  desc "Environment files from a template and SOPS/age-encrypted secrets"
  homepage "https://github.com/PillowPillow/envctl"
  version "2.1.1"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/PillowPillow/envctl/releases/download/v#{version}/envctl_darwin_arm64.tar.gz"
      sha256 "1b1ef42e1b3e52fdb79cb1f44cec568bf00c3a6148a5a1e8db3dbe1321bc85c0"
    end
    on_intel do
      url "https://github.com/PillowPillow/envctl/releases/download/v#{version}/envctl_darwin_amd64.tar.gz"
      sha256 "c1ce825caa77b0145ca8210d2d4d8909ad6ac04ff2acb1e65895bbbf0ec7d94f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PillowPillow/envctl/releases/download/v#{version}/envctl_linux_arm64.tar.gz"
      sha256 "3f99a2fea14f713c4ec6f5f1ca544aad17c8cad829841d6a29a5fa4f444d0daa"
    end
    on_intel do
      url "https://github.com/PillowPillow/envctl/releases/download/v#{version}/envctl_linux_amd64.tar.gz"
      sha256 "8a46052af52a83d21ddc65a977329741973b3e66ea9c2bb33830c76b5705813a"
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
