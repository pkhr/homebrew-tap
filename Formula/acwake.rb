class Acwake < Formula
  desc "macOS launchd daemon to stay awake on AC, sleep on battery"
  homepage "https://github.com/pkhr/acwake"
  url "https://github.com/pkhr/acwake/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "048c90f6d7b185c751e1b93cfaaad356d2832a0d8677bf018df291023e1f9d8e"
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
