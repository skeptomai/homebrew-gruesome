class Gruesome < Formula
  desc "Z-Machine interpreter and compiler for Infocom text adventures like Zork"
  homepage "https://github.com/skeptomai/gruesome"
  url "https://github.com/skeptomai/gruesome/archive/v2.11.1.tar.gz"
  sha256 "2d75570f9530c143cd1bdf4220bee8ec5e2e98fdbd9c8b7f6ea976811f0b3ace"
  license "MIT"

  depends_on "rust" => :build

  def install
    # Build the main interpreter
    system "cargo", "install", "--bin", "gruesome", *std_cargo_args

    # Build the compiler
    system "cargo", "install", "--bin", "grue-compiler", *std_cargo_args

    # Build the disassembler (if available)
    system "cargo", "install", "--bin", "gruedasm-txd", *std_cargo_args
  end

  test do
    # Test the interpreter
    assert_match "gruesome", shell_output("#{bin}/gruesome --version 2>&1")

    # Test the compiler
    assert_match "grue-compiler", shell_output("#{bin}/grue-compiler --version 2>&1")

    # Test basic functionality with a minimal Z3 file (if available)
    # This could be enhanced to test with a simple compiled game
  end

  def caveats
    <<~EOS
      Gruesome Z-Machine Tools installed:

      • gruesome: Z-Machine interpreter for playing Infocom games
        Usage: gruesome game.z3

      • grue-compiler: Compile Grue language to Z-Machine bytecode
        Usage: grue-compiler source.grue -o game.z3

      • gruedasm-txd: Enhanced Z-Machine disassembler
        Usage: gruedasm-txd game.z3

      Security Note: These tools were built from source on your machine,
      so they will not trigger macOS Gatekeeper warnings.

      Example Zork I gameplay:
        Download a Z-Machine game file and run:
        gruesome ZORK1.DAT

      For more information, visit:
      https://github.com/skeptomai/gruesome
    EOS
  end
end
