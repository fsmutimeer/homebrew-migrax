class Migrax < Formula
  desc "Database migrations generated from your JPA entities"
  homepage "https://migrax.org/"
  url "https://github.com/fsmutimeer/migrax/releases/download/v0.15.0/migrax-0.15.0.zip"
  sha256 "a62acd87aa0b3ed0c84c6dfd345c3a73f01ae3a2abe9b62a4e2dea0ad2a3865c"
  license "Apache-2.0"

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
