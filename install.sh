#!/usr/bin/env bash
set -euo pipefail
RAW="https://raw.githubusercontent.com/tavishm/agents-alert/master"
TOPIC="${ALERT_TOPIC:-the-x20-agents}"
mkdir -p "$HOME/.local/bin"
curl -fsSL "$RAW/agents-alert" -o "$HOME/.local/bin/agents-alert"
chmod +x "$HOME/.local/bin/agents-alert"
"$HOME/.local/bin/agents-alert" setup "$TOPIC"
echo
echo "Installed agents-alert (topic: $TOPIC)"
echo "Test it now:  ~/.local/bin/agents-alert test"
echo "Real alert:   ~/.local/bin/agents-alert push "training crashed, GPU idle""
echo
echo "For true phone calls, export these first:"
echo "  TWILIO_ACCOUNT_SID / TWILIO_AUTH_TOKEN / TWILIO_FROM / ALERT_PHONE"
echo "then run:  ~/.local/bin/agents-alert call "need you now""
