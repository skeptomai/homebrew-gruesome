class Gruesome < Formula
  desc "Z-Machine interpreter and compiler for Infocom text adventures like Zork"
  homepage "https://github.com/skeptomai/gruesome"
  url "https://github.com/skeptomai/gruesome/archive/v2.12.0.tar.gz"
  sha256 "156e64d80c39359e53b5257def6a86418c7cc7c9e5076cfe0edb012eff98a032"
  license "MIT"

  depends_on "rust" => :build

  def install
    # Build the main interpreter
    system "cargo", "install", "--bin", "gruesome", *std_cargo_args

    # Build the compiler
    system "cargo", "install", "--bin", "grue-compiler", *std_cargo_args

    # Build the disassembler (if available)
    system "cargo", "install", "--bin", "gruedasm-txd", *std_cargo_args

    # Install example Grue source for testing and user reference
    pkgshare.install "examples/mini_zork.grue"
  end

  test do
    # Test version commands work
    assert_match "gruesome", shell_output("#{bin}/gruesome --version 2>&1")
    assert_match "grue-compiler", shell_output("#{bin}/grue-compiler --version 2>&1")
    assert_match "gruedasm-txd", shell_output("#{bin}/gruedasm-txd --version 2>&1")

    # Copy the example Grue source to test directory
    cp pkgshare/"mini_zork.grue", testpath/"mini_zork.grue"
    assert_predicate testpath/"mini_zork.grue", :exist?

    # Test 1: Compiler - compile Grue source to Z-machine bytecode
    system bin/"grue-compiler", testpath/"mini_zork.grue", "-o", testpath/"mini_zork.z3"
    assert_predicate testpath/"mini_zork.z3", :exist?
    assert_operator (testpath/"mini_zork.z3").size, :>, 0

    # Test 2: Disassembler - analyze the compiled Z-machine file
    disasm_output = shell_output("#{bin}/gruedasm-txd #{testpath}/mini_zork.z3")
    assert_match(/header|Header|HEADER/, disasm_output, "Disassembler should show Z-machine header info")

    # Test 3: Interpreter - smoke test that it can load and run the game
    # Send 'quit' command to exit cleanly
    interpreter_output = shell_output("echo 'quit' | #{bin}/gruesome #{testpath}/mini_zork.z3 2>&1")
    # Just verify it doesn't crash - any output means it loaded successfully
    assert_operator interpreter_output.length, :>, 0
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

      Finding Z-Machine Games:

      Free Games:
      • Interactive Fiction Database: https://ifdb.org
      • Infocom Cabinet: https://archive.org (search "Infocom")
      • Modern IF: https://intfiction.org/c/games

      Commercial Classics:
      • Steam: "The Zork Anthology" and other Infocom collections
      • GOG.com: Classic Infocom adventure games
      • itch.io: Independent interactive fiction

      Example gameplay:
        gruesome game.z3
        gruesome ZORK1.DAT
        grue-compiler my_story.grue -o my_game.z3

      For more information, visit:
      https://github.com/skeptomai/gruesome
    EOS
  end
end
