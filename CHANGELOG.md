# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.2] - 2026-03-02

### Added

- **Slash command reminder**: After `install` and `upgrade`, the CLI now reminds users which Gemini slash command to run based on their language (`/withClaudeCodeTmux` for English, `/withClaudeCodeTmux.vi` for Vietnamese).

## [1.2.1] - 2026-03-02

### Fixed

- **`install` command**: Now always overwrites template files (hooks, scripts, TOML commands) to ensure users get the latest versions. Previously `install` skipped existing files, which left outdated hooks in place.

## [1.2.0] - 2026-03-02

### Added

- **npm package**: Squad BMAD is now installable via `npx squad-bmad install`. A single command copies all hook scripts, tmux utilities, and Gemini slash commands into the user's project.
- **CLI** (`bin/cli.js`): New CLI with `install` and `upgrade` commands. Handles smart-merging of `.claude/settings.json` hooks and checks for BMAD Method dependency.
- **`template/` directory**: All distributable files are now bundled under `template/` for clean npm packaging.

### Fixed

- **`notify-gemini.sh`**: Replaced hardcoded session target (`gemini-orchestrator:0.0`) with dynamic resolution using `$PWD`, consistent with `wakeup-gemini.sh`.

### Changed

- **`README.md`** and **`README.vi.md`**: Rewrote Setup section — installation is now a single `npx squad-bmad install` command (Step 1), with existing steps renumbered accordingly. Added npm badge.

## [1.1.0] - 2026-03-02

### Added

- **`setup-sessions.sh`** (`/.gemini/scripts/`): New utility script to automatically create and manage the 3 standard tmux sessions per project. Checks for existing sessions before creating, and immediately launches the correct CLI command inside each one (Gemini CLI with `--yolo`, Claude Sonnet for Implement, Claude Opus for Brainstorm).
- **Dynamic session naming convention**: All 3 sessions now follow a project-aware naming standard derived from the current working directory:
  - `gemini-orchestrator-<folder>` — Gemini Orchestrator
  - `claude-implement-<folder>` — Claude Code Implement (Sonnet)
  - `claude-brainstorm-<folder>` — Claude Code Brainstorm (Opus)
- **Zero-arg slash command**: `/withClaudeCodeTmux` no longer requires manual session name arguments. Gemini auto-detects the project folder, calls `setup-sessions.sh`, and validates all sessions automatically.

### Changed

- **`wakeup-gemini.sh`**: Refactored from a hardcoded session target (`gemini-orchestrator:0.0`) to dynamic resolution — derives the target session name from the `cwd` field in the Claude Code hook JSON payload, following the `gemini-orchestrator-<folder>` convention. Silently skips (with warning) if the target session does not exist.
- **Script organization**: Moved utility scripts (`tmux-send.sh`, `setup-sessions.sh`) from `.claude/hooks/` to `.gemini/scripts/`. The `.claude/hooks/` directory now contains only true Claude Code lifecycle hooks registered in `settings.json` (`wakeup-gemini.sh`, `notify-gemini.sh`). Updated all path references in TOML configs and documentation accordingly.
- **`withClaudeCodeTmux.toml`** and **`withClaudeCodeTmux.vi.toml`**: Updated initialization steps to reflect new auto-detect & setup flow; updated all `tmux-send.sh` and `setup-sessions.sh` path references to `.gemini/scripts/`.
- **`idea.md`**: Updated session name examples, script paths, and workflow description to match new conventions.
- **`README.md`** and **`README.vi.md`**: Updated Setup section to reflect one-command session setup via `setup-sessions.sh` instead of manual `tmux new` commands.

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

[1.2.2]: https://github.com/thientranhung/squad-bmad/compare/v1.2.1...v1.2.2
[1.2.1]: https://github.com/thientranhung/squad-bmad/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/thientranhung/squad-bmad/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/thientranhung/squad-bmad/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/thientranhung/squad-bmad/releases/tag/v1.0.0
