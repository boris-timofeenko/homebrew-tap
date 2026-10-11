class UvcdvCapture < Formula
  desc "Lossless MiniDV capture over USB (UVC DV payload) — no FireWire needed"
  homepage "https://github.com/boris-timofeenko/uvcdv-capture"
  url "https://github.com/boris-timofeenko/uvcdv-capture/archive/refs/tags/v1.12.0.tar.gz"
  sha256 "db03d61c309e03e1a6cc17e720b6a0187cd298c055e9b561f4d876669728b2e6"
  license "GPL-3.0-or-later"

  depends_on "pkg-config" => :build
  depends_on "libusb"
  depends_on :macos

  def install
    system "make"
    bin.install "uvcdv-capture"
  end

  def caveats
    <<~EOS
      Encoding (--encode/.mp4, --youtube, --prores), image adjustments, VHS
      emulation (--vhs), recorder sound sync (--audio), the terminal preview
      (--preview) and GUI snapshots additionally need ffmpeg at runtime:
        brew install ffmpeg

      The native GUI is not installed by this formula — grab
      "UVCDV Capture.app" from the GitHub releases page, or build it from
      source with `make app`.
    EOS
  end

  test do
    assert_match "uvcdv-capture", shell_output("#{bin}/uvcdv-capture --version")
  end
end
