class Netcaps < Formula
  desc "netcaps - Turn your Caps Lock LED into a network activity light"
  homepage "https://github.com/forcequitOS/netcaps"
  url "https://github.com/forcequitOS/netcaps/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "f78ff37c1bd64f91920f8012863d8e86f6d82b2f15a53a78251d727d2f96cfd0"
  license "MIT"
  version "1.6.0"

  depends_on macos: :catalina # I have no clue if it even works on anything lower than Tahoe, but YOLO I guess. 

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

      - To run netcaps as a global background service, run:
          sudo brew services start netcaps
      - To run netcaps as a background service for this user only, run:
          brew services start netcaps
      
Grant Input Monitoring permissions after enabling the service, then run:
    (sudo) brew services restart netcaps
to load the service
  	EOS
  end

  test do
    system "#{bin}/netcaps", "--version"
  end
end
