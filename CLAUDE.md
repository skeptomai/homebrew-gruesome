# Homebrew Gruesome Tap

## Purpose

This repository provides a Homebrew tap for easy installation of the Gruesome Z-Machine interpreter toolkit on macOS.

## Base Project

**Main Repository**: [skeptomai/gruesome](https://github.com/skeptomai/gruesome)

Gruesome is a complete Z-Machine ecosystem including:
- Z-Machine interpreter for classic Infocom games (Zork, Planetfall, etc.)
- Grue language compiler targeting Z-Machine bytecode
- Advanced disassembler with enhanced analysis capabilities
- Comprehensive testing with commercial game verification

## What This Tap Provides

**Installation Command**: `brew install skeptomai/gruesome/gruesome`

**Installed Tools**:
- `gruesome` - Z-Machine interpreter
- `grue-compiler` - Compile Grue language to Z3/Z5 files
- `gruedasm-txd` - Enhanced Z-Machine disassembler

## macOS Security Solution

This tap solves macOS Gatekeeper issues that affect unsigned binaries:
- Eliminates "cannot be opened" security warnings
- No manual `xattr -d com.apple.quarantine` commands needed
- Professional distribution channel for macOS users
- Automatic updates via `brew upgrade`

## Command Structure Explanation

The command `brew install skeptomai/gruesome/gruesome` breaks down as:
- `skeptomai` = GitHub username
- `gruesome` = Tap name (from repository `homebrew-gruesome`)
- `gruesome` = Formula name (from `Formula/gruesome.rb`)

The apparent redundancy exists because:
1. Tap name derives from repository (`homebrew-gruesome` → `gruesome`)
2. Formula name is chosen independently (`gruesome.rb`)
3. They happen to match because the formula is named after the main tool

## Maintenance

Formula automatically builds from source using the latest tagged release.
Updates are published by updating the URL and SHA256 hash in Formula/gruesome.rb.

When updating for new releases:
1. Calculate new SHA256: `curl -sL "https://github.com/skeptomai/gruesome/archive/vX.Y.Z.tar.gz" | shasum -a 256`
2. Update `url` and `sha256` in `Formula/gruesome.rb`
3. Commit and push changes
4. Users get updates automatically with `brew upgrade`

## Links

- **Source Code**: [github.com/skeptomai/gruesome](https://github.com/skeptomai/gruesome)
- **Documentation**: [Homebrew Tap Setup Guide](https://github.com/skeptomai/gruesome/blob/main/docs/HOMEBREW_TAP_SETUP.md)
- **Issues**: Report bugs to main repository

## Repository Structure

```
homebrew-gruesome/
├── README.md           # User installation guide
├── LICENSE             # MIT license for the tap
├── CLAUDE.md           # This documentation file
└── Formula/
    └── gruesome.rb     # Homebrew formula
```

This tap provides a professional distribution channel that eliminates macOS security friction while maintaining the full functionality of the Gruesome Z-Machine toolkit.