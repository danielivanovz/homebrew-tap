class Mysessions < Formula
  desc "Reopen terminal coding-agent sessions in tabs after a restart"
  homepage "https://github.com/danielivanovz/mysessions"
  url "https://github.com/danielivanovz/mysessions/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "151770da332434834de17c82769acfa22ed133df29fa8cf69f31b4f484bc6adb"
  license "MIT"
  head "https://github.com/danielivanovz/mysessions.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      To capture sessions automatically, run:
        mysessions install
      The launch agent and Claude hook use #{opt_bin}/mysessions,
      so `brew upgrade` takes effect without reinstalling.

      Before `brew uninstall mysessions`, run:
        mysessions uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mysessions --version")
  end
end
