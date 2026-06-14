<div align="center">

# 🎖️ GunnyRed

### A no-nonsense Marine drill instructor in your terminal.

*Ask a question. Get barked at. Walk away a better recruit.*

[![.NET](https://img.shields.io/badge/.NET-10-512BD4?logo=dotnet&logoColor=white)](https://dotnet.microsoft.com/)
[![Powered by Claude](https://img.shields.io/badge/powered%20by-Claude%20Opus%204.8-D4A27F)](https://www.anthropic.com/)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
![Single-file C#](https://img.shields.io/badge/single--file-no%20.csproj-blue)

</div>

---

**GunnyRed** is a tiny command-line app that channels *Gunny Red* — a senior Marine drill instructor who is sharp, funny, full of attitude, and has zero patience for slack. Ask it anything; it answers in character.

It's a single C# file. No project, no boilerplate, no ceremony — thanks to **.NET 10 file-based apps**, the whole thing is `GunnyRed.cs` and the package reference lives right at the top of the file.

## 🪖 Sample bark

```text
$ dotnet run GunnyRed.cs "Gunny, the function is fixed for real this time. Final word?"

OH, "FOR REAL THIS TIME"?!

Listen up, recruit. You know how many times I've heard "final word" before the
next bug came crawlin' outta your code like a sand flea at chow time? FOUR TIMES today!

So here's MY final word: I don't take YOUR word for nothin'. You wanna call it fixed?
PROVE IT.
  - Did you RUN the tests? ALL of 'em?
  - Did you check the EDGE CASES, or did you tuck 'em in bed and hope they stay asleep?
  - Did you hit it with bad input, or are you assumin' the universe is gonna be POLITE?

You do all that, it passes clean, and THEN — and ONLY then — you got your final word.
Now stop yappin' and go EARN it. MOVE!
```

## ✅ Requirements

- [.NET 10 SDK](https://dotnet.microsoft.com/download) or newer (`dotnet --version` → `10.x`)
- An Anthropic API key in the `ANTHROPIC_API_KEY` environment variable
  ([get one here](https://console.anthropic.com/settings/keys))

## 🚀 Quick start

```bash
# 1. Set your key (add to your shell profile to make it stick)
export ANTHROPIC_API_KEY="sk-ant-..."

# 2. Run it — the package restores automatically on first run
dotnet run GunnyRed.cs "What's the USMC word of the day?"
```

That's it. No `dotnet new`, no `.csproj`, no `dotnet add package`. The `#:package` directive at the top of `GunnyRed.cs` tells .NET what to pull.

## 🎯 Usage

GunnyRed takes its prompt three ways — command-line args, piped stdin, or a default:

```bash
# From arguments
dotnet run GunnyRed.cs "Motivate me before leg day."

# From a pipe
echo "Explain discipline in one sentence." | dotnet run GunnyRed.cs

# No input? You get the USMC Word of the Day.
dotnet run GunnyRed.cs
```

Want a real command instead of typing `dotnet run` every time? Publish it:

```bash
dotnet publish GunnyRed.cs -o ./bin
./bin/GunnyRed "Permission to speak freely, Gunny?"
```

## 🔧 How it works

The whole app is ~25 lines. The interesting parts:

| Piece | What it does |
|---|---|
| `#:package Anthropic@12.24.1` | File-based package reference — no project file needed |
| `new AnthropicClient()` | Reads `ANTHROPIC_API_KEY` straight from the environment |
| `Model = "claude-opus-4-8"` | Talks to Claude Opus 4.8 |
| `System = "...drill instructor..."` | The system prompt that *is* Gunny Red |
| `block.TryPickText(out var text)` | Pulls the text out of the response — the C# answer to `jq -r '.content[0].text'` |

## 🐚 Prefer a shell one-liner?

There's a pure-zsh version in [`extras/gunny.zsh`](extras/gunny.zsh) — same personality, just `curl` + `jq`, no build step. Drop it in your `~/.zshrc` and run `gunny "your question"`.

## 💵 A note on cost

Every run makes a real API call against **your** key and spends a few tokens. It's cheap, but it's not free — Gunny Red works for tokens, not for love.

## 🤝 Contributing

PRs welcome — see [CONTRIBUTING.md](CONTRIBUTING.md). New personalities, output polish, packaging improvements, all fair game. Just keep it in good taste (see the [Code of Conduct](CODE_OF_CONDUCT.md)).

## 📜 License

[MIT](LICENSE) © John Elia. Built for fun, shared to help people.

<div align="center">
<sub>Semper Fi. 🇺🇸 · Part of the LIBCSYS open-source toolbox.</sub>
</div>
