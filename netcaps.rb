class Netcaps < Formula
  desc "netcaps - Turn your Caps Lock LED into a network activity light"
  homepage "https://github.com/forcequitOS/netcaps"
  url "https://github.com/forcequitOS/netcaps/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "0f4db267f1a325db644babb1171c417c7cc9fcfe95fbb5dc077629a192ff768d"
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
