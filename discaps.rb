class Discaps < Formula
  desc "discaps - Turn your Caps Lock LED into a disk activity light"
  homepage "https://github.com/forcequitOS/discaps"
  url "https://github.com/forcequitOS/discaps/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "898543b322ed7e45417cdb69bb80cd2aa96ed5efe1a819faa5cd731e68c4a915"
  license "MIT"
  version "1.0.0"

  depends_on macos: :catalina # I still have no clue if THIS even works on anything lower than Tahoe, but YOLO I guess. 

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/discaps"
  end
  
  service do
    run [opt_bin/"discaps", "--silent"]
    keep_alive true
  end
  
  def caveats
  	<<~EOS
Thanks for trying discaps!

      - To run netcaps as a global background service, run:
          sudo brew services start discaps
      - To run netcaps as a background service for this user only, run:
          brew services start discaps
      
Grant Input Monitoring permissions after enabling the service, then run:
    (sudo) brew services restart discaps
to load the service
  	EOS
  end

  test do
    system "#{bin}/discaps", "--version"
  end
end
