
class Newt < Formula
  desc "Package, build and installation system for Mynewt OS applications"
  homepage "https://github.com/cwanda/incubator-mynewt-newt"
  url "https://github.com/apache/incubator-mynewt-newt.git",
      :tag => "mynewt_1_0_0_tag"

  version "1.0.0"

  head "https://github.com/apache/incubator-mynewt-newt.git"

  bottle :unneeded

  depends_on "go" => :build
  depends_on "gdb" => [:build, "with-python"]
  depends_on "PX4/homebrew-px4/gcc-arm-none-eabi-49" => :build

  def install
    contents = Dir["{*,.git,.gitignore}"]

    gopath = buildpath/"gopath"
    (gopath/"src/mynewt.apache.org/newt").install contents
    ENV["GOPATH"] = gopath
    ENV.prepend_create_path "PATH", gopath/"bin"

    cd gopath/"src/mynewt.apache.org/newt/newt" do
      system "go", "install"
      bin.install gopath/"bin/newt"
    end

    cd gopath/"src/mynewt.apache.org/newt/newtmgr" do
      system "go", "install"
      bin.install gopath/"bin/newtmgr"
    end

    cd gopath/"src/mynewt.apache.org/newt/newtvm" do
      system "go", "install"
      bin.install gopath/"bin/newtvm"
    end
  end

  test do
    system bin/"newt", "version"
  end
end
