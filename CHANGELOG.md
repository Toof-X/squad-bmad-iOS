# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-03-02

### Added

- Initial project setup — automated BMAD methodology orchestration using Gemini CLI and Claude Code via Tmux.
- Multi-language README support (English and Vietnamese).
- English translation of `withClaudeCodeTmux.toml` configuration.
- PRE-FLIGHT block and sync upgrades from Vietnamese to English TOML config.
- Explicit model flags (`--model gemini-3-pro-preview`, `--model sonnet`, `--model opus`) in launch commands.

### Changed

- Updated hook scripts for improved workflow.
- Updated docs to support Gemini and Claude YOLO/dangerous mode.
- Updated Claude Code launch command in READMEs.
- Set Claude notification matcher to `permission_prompt`.

### Removed

- Removed `idea.md` from git tracking.

[1.0.0]: https://github.com/thientranhung/squad-bmad/releases/tag/v1.0.0
