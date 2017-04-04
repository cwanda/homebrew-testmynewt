class Newt < Formula
  desc "Package, build and installation management system for Mynewt OS embedded applications"
  homepage "https://github.com/cwanda/incubator-mynewt-newt"
  url "https://github.com/apache/incubator-mynewt-newt.git"


  bottle :uneeded

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = system "pwd"
    system "go", "install"
  end

end
