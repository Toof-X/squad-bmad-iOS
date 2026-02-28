#!/bin/bash
set -e

MSG="$1"
if [ -z "$MSG" ]; then
  MSG="Claude Code đang chờ xác nhận/tương tác."
fi

# Bắn tín hiệu đánh thức session của Gemini
tmux send-keys -t gemini-orchestrator:0.0 "Claude Code Notification: $MSG . Vui lòng kiểm tra tiếp tục công việc" C-m
sleep 3
tmux send-keys -t gemini-orchestrator:0.0 C-m

exit 0