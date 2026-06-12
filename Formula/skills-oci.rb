class SkillsOci < Formula
  desc "CLI tool for packaging and managing AI agent skills as OCI artifacts"
  homepage "https://github.com/salaboy/skills-oci"
  version "0.0.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.12/skills-oci-darwin-arm64"
      sha256 "6ea1c6737e9f1ae1e7fc00fc73fdd73a97bdcb2e3c1a0febe28d83ded5a799c6"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.12/skills-oci-darwin-amd64"
      sha256 "2206d26952ed4b0ecf25399319e54d2152b893889350d4db99b3e8b9b0376804"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.12/skills-oci-linux-arm64"
      sha256 "289446d23c28d146a96f44c6942f8d1867afa482775262c7e271d09932c36ee9"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.12/skills-oci-linux-amd64"
      sha256 "15b0889495320b4c1b4af9b1d17fe71e4be6a75fece4cbd32d2d25e402b9fe72"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "skills-oci"
  end

  test do
    assert_match "Manage agent skills as OCI artifacts", shell_output("#{bin}/skills-oci --help")
  end
end
