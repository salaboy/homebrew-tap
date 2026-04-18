class SkillsOci < Formula
  desc "CLI tool for packaging and managing AI agent skills as OCI artifacts"
  homepage "https://github.com/salaboy/skills-oci"
  version "0.0.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.9/skills-oci-darwin-arm64"
      sha256 "a57730a68133da11a0b3ffb7a770f2871da2929ec15d96c7ab1b2cd72519f9d4"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.9/skills-oci-darwin-amd64"
      sha256 "7c04a3875d1212f11f3db4eff64848d4b6050f122ae114986502b6efdae1675f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.9/skills-oci-linux-arm64"
      sha256 "1b85140a6152d38030b5eb4808cbea4a752101ee996ea78509e15571e833ceee"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.9/skills-oci-linux-amd64"
      sha256 "1dd3f62936589f75b2d7cf8d961c4e792ad1b82dd1d1ba96e3f820504143ea92"
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
