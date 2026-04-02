class Skills < Formula
  desc "CLI tool for packaging and managing AI agent skills as OCI artifacts"
  homepage "https://github.com/salaboy/skills-oci"
  version "0.0.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-darwin-arm64"
      sha256 "e256819cc9f21239dc8399a775c23eb3c51937a0fec0ddefc948558eb92e01ac"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-darwin-amd64"
      sha256 "e0363391ec2e4e6175f7707304c8cc606906f8f22dd673e125dd92aac19d6315"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-linux-arm64"
      sha256 "d76c0df87e94dbee784d0345fdf50833535e0ff84f46c0f3e8b7ed954e5ae969"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v#{version}/skills-oci-linux-amd64"
      sha256 "77313afb81d088153702c666d9fca4a80f0e487100fd59279893375bfee120f2"
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
