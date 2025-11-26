#!/bin/sh
cursor-agent update
npm install -g @github/copilot@latest
npm install -g @openai/codex@latest
npm install -g @google/gemini-cli@latest
opencode upgrade
~/.claude/local/claude update
