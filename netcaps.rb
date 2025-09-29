class Netcaps < Formula
  desc "netcaps - Turn your Caps Lock LED into a network activity light"
  homepage "https://github.com/forcequitOS/netcaps"
  url "https://github.com/forcequitOS/netcaps/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "7d08e02fabf4356fe0242f4d5fce8ccae35749e372f9c46eb524077d4386ab2f"
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
