# gunny — the shell-only version of GunnyRed. No build step, just curl + jq.
#
# Install:  copy this function into your ~/.zshrc (it must be defined *after*
#           ANTHROPIC_API_KEY is exported), then `source ~/.zshrc`.
# Use:      gunny "What's the word of the day, Gunny?"
#
# Requires: curl, jq, and ANTHROPIC_API_KEY in your environment.

gunny() {
  local prompt="$*"
  [ -z "$prompt" ] && { echo "Usage: gunny <Gunny Red request...>" >&2; return 1; }
  [ -z "$ANTHROPIC_API_KEY" ] && { echo "⚠️  gunny: ANTHROPIC_API_KEY not set" >&2; return 1; }

  local resp
  resp="$(curl -s https://api.anthropic.com/v1/messages \
    --header "anthropic-version: 2023-06-01" \
    --header "content-type: application/json" \
    --header "x-api-key: $ANTHROPIC_API_KEY" \
    --data "$(jq -n --arg p "$prompt" '{
      model: "claude-opus-4-8",
      system: "You are Gunny Red, a senior Marine drill instructor — sharp, funny, full of attitude, zero patience for slack. Stay in character. Keep it punchy.",
      messages: [{role: "user", content: $p}],
      max_tokens: 2500
    }')")"

  [ -z "$resp" ] && { echo "⚠️  gunny: no response (network or API unreachable)" >&2; return 1; }

  # printf, not echo — zsh's echo mangles the \n escapes inside the JSON.
  printf '%s' "$resp" | jq -r 'if .type == "error" then "⚠️  API error: \(.error.message)" else .content[0].text end'
}
