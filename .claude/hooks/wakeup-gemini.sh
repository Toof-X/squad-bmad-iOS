#!/bin/bash
set -e

# Đọc toàn bộ JSON đầu vào từ Claude Code
HOOK_INPUT=$(cat)

# Ghi log tạm thời để phân tích cấu trúc JSON của Agent Teams (giúp cải thiện bộ lọc sau này)
echo "$HOOK_INPUT" >> /tmp/claude_stop_hook_debug.jsonl

# Trích xuất tên Agent (nếu có trong payload của tính năng Experimental Agent Teams)
AGENT_NAME=$(echo "$HOOK_INPUT" | jq -r '.agent // empty')

# Tạm thời log ra để xem cấu trúc thực tế. 
# Sau khi phân tích được log /tmp/claude_stop_hook_debug.jsonl, ta sẽ kích hoạt logic lọc Sub-agent ở đây.
# Ví dụ: if [ -n "$AGENT_NAME" ] && [ "$AGENT_NAME" != "root" ]; then exit 0; fi

# Bắn tín hiệu đánh thức session của Gemini (gemini-orchestrator:0.0)
# Chúng ta dùng C-m để đảm bảo gửi phím Enter một cách an toàn.
tmux send-keys -t gemini-orchestrator:0.0 "Claude Code đã phát tín hiệu Stop (Hoàn thành task hoặc Sub-agent hoàn thành). Vui lòng kiểm tra tiếp tục công việc" C-m
sleep 5
tmux send-keys -t gemini-orchestrator:0.0 C-m

exit 0
