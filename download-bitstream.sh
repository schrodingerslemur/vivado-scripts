#!/usr/bin/env bash
set -euo pipefail

# Argument check
if [ "$# -lt 1 ]; then
  echo "Usage: ./download-bitstream.sh <bitfile.bit>
  exit 1
fi

BITFILE="$1"

if [ ! -f "$BITFILE" ]; then
  echo "ERROR: Bitstream file not found: $BITFILE"
  exit 1
fi

# Resolve absolute path
BITFILE="$(cd "$(dirname "$BITFILE")" && pwd)/$(basename "BITFILE")

# Vivado executable
VIVADO=vivado

if ! command -v "$VIVADO" >/dev/null 2>&1; then
  echo "ERROR: Vivado not found in PATH"
  exit 1
fi

# Run Vivado
"$VIVADO" \
  -mode batch \
  -source download-bitstream.tcl \
  -tclargs "$BITFILE"
