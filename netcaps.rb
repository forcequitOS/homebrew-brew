class Netcaps < Formula
  desc "netcaps - Turn your Caps Lock LED into a network activity light"
  homepage "https://github.com/forcequitOS/netcaps"
  url "https://github.com/forcequitOS/netcaps/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "4c2e35ffc6b1660b23651851b2b753cd2c6e81130fda1b762f27df60035fa695"
  license "MIT"

  depends_on :xcode => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/netcaps"
  end
  
  service do
    run [opt_bin/"netcaps", "--silent"]
    keep_alive true
  end
  
  def caveats
  	<<~EOS
  	Thanks for trying netcaps!
    To run netcaps as a global background service, run: sudo brew services start netcaps
    To run netcaps as a background service for this user only, run: brew services start netcaps
  	EOS
  end

  test do
    system "#{bin}/netcaps", "--version"
  end
end
