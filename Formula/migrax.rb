class Migrax < Formula
  desc "Database migrations generated from your JPA entities"
  homepage "https://migrax.org/"
  url "https://github.com/fsmutimeer/migrax/releases/download/v0.8.0/migrax-0.8.0.zip"
  sha256 "81f624582cc70c68390466d7ab91caf0e953d4e8d9e9a729753fd9563bea9056"
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
