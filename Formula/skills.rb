class Skills < Formula
  desc "CLI tool for packaging and managing AI agent skills as OCI artifacts"
  homepage "https://github.com/salaboy/skills-cli"
  version "0.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-cli/releases/download/v#{version}/skills-darwin-arm64"
      sha256 "d03c08a024601b40c206a875002cadf3d77d96265dac9dadcb48ba29c92b3e6e"
    else
      url "https://github.com/salaboy/skills-cli/releases/download/v#{version}/skills-darwin-amd64"
      sha256 "a130cf50320d87bdb58288ac53d8d5aad30cea13fe9bd5d19c762bb8a857bb46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-cli/releases/download/v#{version}/skills-linux-arm64"
      sha256 "cb5ac42b6d40528fb229b57f8d23f30d7a5ce01d43b7c74e467396c00afe3626"
    else
      url "https://github.com/salaboy/skills-cli/releases/download/v#{version}/skills-linux-amd64"
      sha256 "ea0328eb413b84fa930908855c9349365ef2f570159c0484e2ad3c7b26d9920c"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "skills"
  end

  test do
    assert_match "Manage agent skills as OCI artifacts", shell_output("#{bin}/skills --help")
  end
end
