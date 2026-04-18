class SkillsOci < Formula
  desc "CLI tool for packaging and managing AI agent skills as OCI artifacts"
  homepage "https://github.com/salaboy/skills-oci"
  version "0.0.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.8/skills-oci-darwin-arm64"
      sha256 "47b05eb2c1dbe6745de16ea7a77119333fcb9aae4bbb0ba441a3963d216273ae"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.8/skills-oci-darwin-amd64"
      sha256 "147efc54431bf4bf0fed13c10136cb1a52c9e1ac141ac13206bafff8d179db82"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.8/skills-oci-linux-arm64"
      sha256 "c72e50d6fb8479e27e6a6d425c210f3f232e45963555102697c5595c4c496c47"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.8/skills-oci-linux-amd64"
      sha256 "dca9454115d1b7143c5d354589b71ede5c0a31ac6c09c35a1bf2efafbf98b697"
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
