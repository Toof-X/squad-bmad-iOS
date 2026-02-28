#!/bin/bash
# tmux-send.sh — Gửi text tới một tmux pane đáng tin cậy.
#
# CÁCH DÙNG:
#   ./tmux-send.sh <pane-target> <message> [wait-seconds]
#
# THAM SỐ:
#   pane-target   — tmux target, ví dụ: gemini-orchestrator:0.0
#   message       — nội dung gửi đi (đặt trong dấu ngoặc kép nếu có khoảng trắng)
#   wait-seconds  — (tùy chọn) số giây chờ giữa text và Enter, mặc định: 5
#
# VÍ DỤ:
#   ./.claude/hooks/tmux-send.sh "gemini-orchestrator:0.0" "Hello from Claude Code"
#   ./.claude/hooks/tmux-send.sh "cc-implement:0" "/dev-story" 3

set -e

PANE_TARGET="$1"
MESSAGE="$2"
WAIT_SECONDS="${3:-5}"

# Validate tham số bắt buộc
if [ -z "$PANE_TARGET" ] || [ -z "$MESSAGE" ]; then
  echo "Lỗi: Thiếu tham số." >&2
  echo "Cách dùng: $0 <pane-target> <message> [wait-seconds]" >&2
  exit 1
fi

# Kiểm tra pane tồn tại
if ! tmux has-session -t "$PANE_TARGET" 2>/dev/null; then
  echo "Lỗi: Tmux target '$PANE_TARGET' không tồn tại." >&2
  exit 1
fi

# Gửi nội dung
tmux send-keys -t "$PANE_TARGET" "$MESSAGE"

# Chờ để pane nhận và render text
sleep "$WAIT_SECONDS"

# Gửi Enter (C-m) — KHÔNG dùng 'Enter' hay '\n'
tmux send-keys -t "$PANE_TARGET" C-m

echo "✓ Đã gửi tới '$PANE_TARGET': $MESSAGE"
