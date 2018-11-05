class Libtiff < Formula
  desc "TIFF library and utilities"
  homepage "http://libtiff.maptools.org/"
  url "https://download.osgeo.org/libtiff/tiff-4.0.9.tar.gz"
  mirror "https://fossies.org/linux/misc/tiff-4.0.9.tar.gz"
  sha256 "6e7bdeec2c310734e734d19aae3a71ebe37a4d842e0e23dbb1b8921c0026cfcd"
  revision 4

  bottle do
    cellar :any
    sha256 "619d93542a46b0b4782f0cc39e4ea568b1e05e353e6e27296cd4d2ad54a7e9d6" => :mojave
    sha256 "783fdbfa2a938c172bdb98e1a32c4b93de640eb8481f008edcf3473bef9e3ef7" => :high_sierra
    sha256 "08213b94b648c48f3561dfe459e38a90cccac68742e65283eaf57c7fb6073ee3" => :sierra
    sha256 "abe583a7e362db26f47e87864ca26bb69c69e83bdbd3b3a32b2e73bea107d0ea" => :el_capitan
  end

  option "with-xz", "Include support for LZMA compression"

  depends_on "jpeg"
  depends_on "xz" => :optional


  def install
    ENV['CFLAGS']=ENV['CXXFLAGS']="-mmacosx-version-min=10.8 -march=nocona -mno-sse3 -mtune=generic"
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --without-x
      --with-jpeg-include-dir=#{Formula["jpeg"].opt_include}
      --with-jpeg-lib-dir=#{Formula["jpeg"].opt_lib}
    ]
    if build.with? "xz"
      args << "--with-lzma-include-dir=#{Formula["xz"].opt_include}"
      args << "--with-lzma-lib-dir=#{Formula["xz"].opt_lib}"
    else
      args << "--disable-lzma"
    end
    system "./configure", *args
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <tiffio.h>

      int main(int argc, char* argv[])
      {
        TIFF *out = TIFFOpen(argv[1], "w");
        TIFFSetField(out, TIFFTAG_IMAGEWIDTH, (uint32) 10);
        TIFFClose(out);
        return 0;
      }
    EOS
    system ENV.cc, "test.c", "-L#{lib}", "-ltiff", "-o", "test"
    system "./test", "test.tif"
    assert_match(/ImageWidth.*10/, shell_output("#{bin}/tiffdump test.tif"))
  end
end
