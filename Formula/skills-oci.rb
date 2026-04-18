class SkillsOci < Formula
  desc "CLI tool for packaging and managing AI agent skills as OCI artifacts"
  homepage "https://github.com/salaboy/skills-oci"
  version "0.0.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-darwin-arm64"
      sha256 "f569cf66f6797a2dd922f13f80775908a235270430839cad45fb1833987be7b4"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-darwin-amd64"
      sha256 "7e4c39cf0de8f5377de60b201075cad1b867b336902275824eafab91223b863b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-linux-arm64"
      sha256 "408f743ca24ec86f44aa6fc58133e12958a60f2853e8fc0379f74825a50262ff"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-linux-amd64"
      sha256 "312e5ae0d3f22fef14efd1f2e734f96a1b4075c91dcecdc58873afe3ea4fdd7f"
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
