class Skills < Formula
  desc "CLI tool for packaging and managing AI agent skills as OCI artifacts"
  homepage "https://github.com/salaboy/skills-oci"
  version "0.0.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-darwin-arm64"
      sha256 "71f4ffaa750475fab74ded7b0a36ad2889e7a0fc73a645d81fec94be01755a66"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-darwin-amd64"
      sha256 "5fa68d11ab70f4480eedadce44d09e559bd003435eccdd9939ce55e67b8fd17e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-linux-arm64"
      sha256 "46275ef4833e0318201076850abfb4523fb86d96bf463391ec7cb1d3d68bcfcc"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-linux-amd64"
      sha256 "6fc275850bb320608fc3745a085447b8787299d6830a675351f43a078f951001"
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
