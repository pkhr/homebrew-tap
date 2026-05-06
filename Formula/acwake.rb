class Acwake < Formula
  desc "macOS launchd daemon to stay awake on AC, sleep on battery"
  homepage "https://github.com/pkhr/acwake"
  url "https://github.com/pkhr/acwake/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cd12d025af92c466c75684a749a4c167063c8c4ef6c000c8ebe51343bccbfd74"
  license "MIT"
  head "https://github.com/pkhr/acwake.git", branch: "main"

  depends_on :macos

  def install
    bin.install "acwake"
  end

  service do
    run [opt_bin/"acwake", "run"]
    keep_alive true
    require_root true
    log_path "/Library/Logs/acwake.log"
    error_log_path "/Library/Logs/acwake.log"
  end

  test do
    output = shell_output("#{bin}/acwake 2>&1", 2)
    assert_match "stay awake on AC", output
  end
end
