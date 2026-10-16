class Migrax < Formula
  desc "Database migrations generated from your JPA entities"
  homepage "https://migrax.org/"
  url "https://github.com/fsmutimeer/migrax/releases/download/v0.12.0/migrax-0.12.0.zip"
  sha256 "e89e7f54c4b11bc0857ca64cc6de1df9fbbd12e0948bd6bba1e93e16564d9151"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "openjdk"

  def install
    libexec.install "bin", "lib"
    # Uses the user's JAVA_HOME when set, else Homebrew's openjdk.
    (bin/"migrax").write_env_script libexec/"bin/migrax", Language::Java.overridable_java_home_env
  end

  test do
    assert_match "migrax #{version}", shell_output("#{bin}/migrax version")
  end
end
