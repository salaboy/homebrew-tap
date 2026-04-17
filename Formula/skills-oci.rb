class SkillsOci < Formula
  desc "CLI tool for packaging and managing AI agent skills as OCI artifacts"
  homepage "https://github.com/salaboy/skills-oci"
  version "0.0.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-darwin-arm64"
      sha256 "6634bf2ea12dad15aa64ee6c456d57c4bd96de72e818990e553c8e797b8238a8"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-darwin-amd64"
      sha256 "dfe9dbcf3c2409961911708622a32a629a819ace243fcede60e76d4201887991"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-linux-arm64"
      sha256 "a6bc305e1c6f74148fc582910c62f9d722cc79af336704098e45fd8c3a149b19"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-linux-amd64"
      sha256 "c31e9505fcb12874e4d6496eae22444b19570f2171f954806b2a254bae66cf55"
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
