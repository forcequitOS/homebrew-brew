class Netcaps < Formula
  desc "netcaps - Turn your Caps Lock LED into a network activity light"
  homepage "https://github.com/forcequitOS/netcaps"
  url "https://github.com/forcequitOS/netcaps/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "2c7d1f0242246e3b0316bf8a9709900172f3720c3ccad81f818baf78c6b713c7"
  license "MIT"

  depends_on :xcode => :build

  def install
    system "swift", "build", "-c", "release"
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