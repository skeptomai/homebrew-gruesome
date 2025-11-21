class Gruesome < Formula
  desc "Z-Machine interpreter and compiler for Infocom text adventures like Zork"
  homepage "https://github.com/skeptomai/gruesome"
  url "https://github.com/skeptomai/gruesome/archive/v2.11.0.tar.gz"
  sha256 "2838f5b1dff79f41ed013c2096b1a54e38dbaeeaa7c2f5248986208872adcd6d"
  license "MIT"

  depends_on "rust" => :build

  def install
    # Build the main interpreter
    system "cargo", "install", "--bin", "gruesome", "--path", ".", *std_cargo_args

    # Build the compiler
    system "cargo", "install", "--bin", "grue-compiler", "--path", ".", *std_cargo_args

    # Build the disassembler (if available)
    system "cargo", "install", "--bin", "gruedasm-txd", "--path", ".", *std_cargo_args
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

      Example Zork I gameplay:
        Download a Z-Machine game file and run:
        gruesome ZORK1.DAT

      For more information, visit:
      https://github.com/skeptomai/gruesome
    EOS
  end
end