require 'formula'

class Ext2fuse < Formula
  homepage 'http://sourceforge.net/projects/ext2fuse'
  url 'http://downloads.sourceforge.net/project/ext2fuse/ext2fuse/0.8.1/ext2fuse-src-0.8.1.tar.gz'
  sha1 '6a13fce7842ead1485a4f48cb57c1272d990b5a5'

  depends_on 'osxfuse'
  depends_on 'e2fsprogs'

  def install
    ENV.append 'LIBS', "-losxfuse"
    ENV.append 'CFLAGS', "-D__FreeBSD__=10 -DENABLE_SWAPFS"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  fails_with :clang do
  # What is this number supposed to mean?
  # This is the one used in the Formula Cookbook
  build 2335
  cause <<-EOS.undent
    This formula is not compatible with the clang compiler due to a multitude of symbol conflicts.
    It is known to work with llvm.
    EOS
  end
end
