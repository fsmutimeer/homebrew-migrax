class Migrax < Formula
  desc "Database migrations generated from your JPA entities"
  homepage "https://migrax.org/"
  url "https://github.com/fsmutimeer/migrax/releases/download/v0.7.0/migrax-0.7.0.zip"
  sha256 "6f92067b05bb8ab779ffdeddce4cdab0ed3fb860639b28dc36712a62151c0057"
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
