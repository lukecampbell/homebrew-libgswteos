require 'formula'
class Libgswteos10 < Formula
  url 'https://github.com/lukecampbell/gsw-teos/tarball/v3.0r4'
  homepage 'http://www.teos-10.org/'
  version '3.0'
  sha1 '6ae190b7da78d6aff7859e7d1a3bb027ce6cc5f3'
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
