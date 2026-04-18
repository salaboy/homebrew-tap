class SkillsOci < Formula
  desc "CLI tool for packaging and managing AI agent skills as OCI artifacts"
  homepage "https://github.com/salaboy/skills-oci"
  version "0.0.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.10/skills-oci-darwin-arm64"
      sha256 "369a217fe7d9f4b00055b9769340607deb049f94487a69a37267f4c6fd98b707"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.10/skills-oci-darwin-amd64"
      sha256 "de69e8c81693e8cf151e84b3a396f5a4326a6e083f2488b40792eb5d2ceab67f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.10/skills-oci-linux-arm64"
      sha256 "74cd90cd90819fe7e0b503ab3ff4335be3a0cf14d9b04fbac1109d51adf5485f"
    else
      url "https://github.com/salaboy/skills-oci/releases/download/v0.0.10/skills-oci-linux-amd64"
      sha256 "649467dbb696e5427136d8e6536adb977dc95fe317d3a6f3a9f3d840c3db4033"
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
