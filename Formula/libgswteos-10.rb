require 'formula'
class Libgswteos10 < Formula
  url 'https://github.com/lukecampbell/gsw-teos/tarball/v3.0r4'
  homepage 'http://www.teos-10.org/'
  version '3.0'
  sha256 '0e0b902dc90a1c38cecc84090618a61be538df876fd7b10b92776574d7223edd'
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  def install
    system "bash ./autogen.sh"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install" 
  end
  def test
    system "#{bin}/gsw_check_functions"
  end
end
