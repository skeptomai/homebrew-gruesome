# Homebrew Gruesome

![Homebrew Tap](https://img.shields.io/badge/Homebrew-Tap-orange)
![License](https://img.shields.io/badge/License-MIT-blue)

Homebrew tap for [Gruesome](https://github.com/skeptomai/gruesome) - a Z-Machine interpreter and compiler for Infocom text adventures.

## Quick Install

```bash
brew install skeptomai/gruesome/gruesome
```

This installs all three tools:
- **gruesome** - Z-Machine interpreter for playing Infocom games
- **grue-compiler** - Compile Grue language to Z-Machine bytecode
- **gruedasm-txd** - Enhanced Z-Machine disassembler

## Usage Examples

### Playing Classic Games
```bash
# Download a Z-Machine game (like Zork I) and play:
gruesome ZORK1.DAT
```

### Compiling Grue Code
```bash
# Compile your own text adventure:
grue-compiler my-game.grue -o my-game.z3
gruesome my-game.z3
```

### Disassembling Z-Machine Files
```bash
# Analyze existing Z-Machine files:
gruedasm-txd game.z3
```

## What is Gruesome?

Gruesome is a complete Z-Machine ecosystem that includes:

- **🎮 Full Z-Machine Interpreter**: Plays Infocom classics (Zork, Planetfall, etc.)
- **🛠️ Grue Compiler**: Modern language compiling to Z-Machine bytecode
- **🔍 Advanced Disassembler**: Enhanced analysis tools for Z-Machine files
- **📚 Comprehensive Testing**: Verified with commercial Infocom games

## Security Benefits

**No macOS security warnings!** This Homebrew tap builds tools from source on your machine, which means:

- ✅ No Gatekeeper "cannot be opened" warnings
- ✅ No quarantine attributes or manual xattr commands needed
- ✅ No unsigned binary security concerns
- ✅ Locally compiled binaries are automatically trusted by macOS

## Alternative Installation

If you prefer manual installation, download binaries from [GitHub Releases](https://github.com/skeptomai/gruesome/releases).

## Links

- **Main Repository**: [skeptomai/gruesome](https://github.com/skeptomai/gruesome)
- **Documentation**: [Project README](https://github.com/skeptomai/gruesome#readme)
- **Releases**: [GitHub Releases](https://github.com/skeptomai/gruesome/releases)
- **Issues**: [Report Bugs](https://github.com/skeptomai/gruesome/issues)

## License

This tap is licensed under MIT. The Gruesome project has its own license.