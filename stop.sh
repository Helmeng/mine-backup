#!/bin/bash
echo "=== Stopping Mine Services ==="
fuser -k 8080/tcp 2>/dev/null && echo "  Backend stopped" || echo "  Backend not running"
fuser -k 5173/tcp 2>/dev/null && echo "  Frontend stopped" || echo "  Frontend not running"
echo "=== Done ==="
