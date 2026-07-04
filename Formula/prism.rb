# typed: strict
# frozen_string_literal: true

# Prism: an effect-typed functional language with a call-by-push-value core that
# compiles to native code through LLVM. The release workflow in sdiehl/prism
# rewrites url, sha256, and version below on every tagged release.
class Prism < Formula
  desc "Effect-typed functional language with a call-by-push-value core, via LLVM"
  homepage "https://github.com/sdiehl/prism"
  url "https://github.com/sdiehl/prism/releases/download/v0.6.0/prism-0.6.0-aarch64-apple-darwin.tar.gz"
  version "0.6.0"
  sha256 "b256e7f8387e9362c8be4878e78c34ef9a72250285670a769bd2eeaa0c7b2cc5"
  license "MIT"

  # Ships an Apple Silicon binary only for now.
  depends_on arch: :arm64
  # LLVM 22 supplies the z3 and zstd dylibs the binary links, plus the clang it
  # shells out to when compiling a program to native code. Keep the major in
  # sync with the inkwell feature (llvm22-1) the compiler is built against.
  depends_on "llvm@22"
  depends_on :macos

  def install
    bin.install "prism"
  end

  test do
    (testpath/"hello.pr").write <<~PRISM
      fn main() : !{IO} Unit =
        println(42)
    PRISM
    assert_match "42", shell_output("#{bin}/prism run #{testpath}/hello.pr")
  end
end
