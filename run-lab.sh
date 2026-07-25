#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cleanup() {
  echo ""
  echo "Stopping servers..."
  kill "$PID_TRUSTED" "$PID_ATTACKER" "$PID_PHISH" "$PID_CLASSIC" 2>/dev/null || true
  exit 0
}
trap cleanup INT TERM

echo "Starting trusted-site       on http://127.0.0.1:8000 ..."
(cd "$SCRIPT_DIR/trusted-site" && python3 -m http.server 8000 >/dev/null 2>&1) &
PID_TRUSTED=$!

echo "Starting attacker-site      on http://127.0.0.1:8001 ..."
(cd "$SCRIPT_DIR/attacker-site" && python3 -m http.server 8001 >/dev/null 2>&1) &
PID_ATTACKER=$!

echo "Starting phishing-site      on http://127.0.0.1:8002 ..."
(cd "$SCRIPT_DIR/phishing-site" && python3 -m http.server 8002 >/dev/null 2>&1) &
PID_PHISH=$!

echo "Starting classic-tabnabbing on http://127.0.0.1:8003 ..."
(cd "$SCRIPT_DIR/classic-tabnabbing" && python3 -m http.server 8003 >/dev/null 2>&1) &
PID_CLASSIC=$!

sleep 1
echo ""
echo "All four servers are up. Try it:"
echo ""
echo "  Reverse tab nabbing:"
echo "    Vulnerable version: http://127.0.0.1:8000/vulnerable.html"
echo "    Fixed version:      http://127.0.0.1:8000/fixed.html"
echo ""
echo "  Classic tab nabbing:"
echo "    JS / visibilitychange variant: http://127.0.0.1:8003/inactive-tab.html"
echo "    No-JS meta refresh variant:    http://127.0.0.1:8003/meta-refresh.html"
echo ""
echo "Press Ctrl+C to stop."

wait
