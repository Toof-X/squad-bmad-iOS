#!/bin/bash
set -e

MSG="$1"
if [ -z "$MSG" ]; then
  MSG="Claude Code is waiting for confirmation/interaction."
fi

# --- Dynamic Gemini session target ---
# Derive the tmux session name from the current project folder.
# Convention: gemini-orchestrator-<folder-name>
FOLDER_NAME=$(basename "$PWD")
GEMINI_SESSION="gemini-orchestrator-${FOLDER_NAME}"

# Check whether the target tmux session actually exists before sending
if ! tmux has-session -t "$GEMINI_SESSION" 2>/dev/null; then
  echo "[notify-gemini] Tmux session '${GEMINI_SESSION}' not found. Skipping notification." >&2
  exit 0
fi

# Send notification to the Gemini session
tmux send-keys -t "${GEMINI_SESSION}:0.0" "Claude Code Notification: $MSG . Please check and continue the work" C-m
sleep 3
tmux send-keys -t "${GEMINI_SESSION}:0.0" C-m

exit 0