#!/bin/bash
# Native user installs; sign in interactively after the first desktop login.
set -euo pipefail
export PATH="$HOME/.local/bin:$PATH"

if ! command -v claude >/dev/null 2>&1; then
    curl -fsSL https://claude.ai/install.sh | bash
fi

if ! command -v codex >/dev/null 2>&1; then
    curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh
fi
