class Vsearch < Formula
  desc "USEARCH-compatible metagenomic sequence tool"
  homepage "https://github.com/torognes/vsearch"
  url "https://github.com/torognes/vsearch/archive/v2.3.3.tar.gz"
  sha256 "e2b25d89466172e6736c3a3ef19334ea75176938f83a406862257879153866b4"
  head "https://github.com/torognes/vsearch.git"
  # doi "10.5281/zenodo.31443"
  # tag "bioinformatics"

  bottle do
    cellar :any_skip_relocation
    sha256 "36f333bd68c10a8beec38551d4f979aefd9bdf8132ce3503e50cac948950101d" => :sierra
    sha256 "36f333bd68c10a8beec38551d4f979aefd9bdf8132ce3503e50cac948950101d" => :el_capitan
    sha256 "e957e27351df20bded562671ff728d6e47d3380e258dea6259f23c853c88e23b" => :yosemite
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "homebrew/dupes/zlib" unless OS.mac?
  depends_on "bzip2" unless OS.mac?

  def install
    system "./autogen.sh"
    system "./configure",
      "--disable-dependency-tracking",
      "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match "allpairs_global", shell_output("#{bin}/vsearch --help 2>&1")
  end
end
