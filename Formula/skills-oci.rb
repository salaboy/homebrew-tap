class SkillsOci < Formula
  desc "CLI tool for packaging and managing AI agent skills as OCI artifacts"
  homepage "https://github.com/salaboy/skills-oci"
  version "0.0.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.11/skills-oci-darwin-arm64"
      sha256 "0dc85adac9b565dfb6ea4af635c0fb98b8502c35b7fbea6259b1a24ced2d4814"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.11/skills-oci-darwin-amd64"
      sha256 "97aa16be444e3f7fa3d986cdc5b9060bd33c5a79ede299c88eef33f08040b81b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.11/skills-oci-linux-arm64"
      sha256 "69953befced67943f158fca7c2e240e591795f0a9c0d200ae5af6533c37f7110"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.11/skills-oci-linux-amd64"
      sha256 "f5636d1843226187eb59579182d6a4e771ec7541a80ea61bab4383082fbf6a75"
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
