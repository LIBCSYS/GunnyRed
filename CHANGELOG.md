# Changelog

All notable changes to this project are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/), and this project aims for
[Semantic Versioning](https://semver.org/).

## [1.0.0] - 2026-06-14

### Added
- Initial release of **GunnyRed** — a single-file .NET 10 CLI that answers in the
  voice of Gunny Red, a Marine drill instructor, via the Anthropic API.
- Prompt input from command-line args, piped stdin, or a default
  ("USMC Word of the day").
- File-based app: `#:package Anthropic@12.24.1` — no `.csproj` required.
- Companion zsh one-liner in `extras/gunny.zsh`.
- GitHub Actions build check, issue templates, contributing guide, and code of conduct.
