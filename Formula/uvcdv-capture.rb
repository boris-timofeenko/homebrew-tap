class UvcdvCapture < Formula
  desc "Lossless MiniDV capture over USB (UVC DV payload) — no FireWire needed"
  homepage "https://github.com/boris-timofeenko/uvcdv-capture"
  url "https://github.com/boris-timofeenko/uvcdv-capture/archive/refs/tags/v1.12.1.tar.gz"
  sha256 "bd485cba92a088e06dff59b236d7b47aa97a7977007af228956c1e896c3361d6"
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
