# Contributing to GunnyRed

So you want to make the Gunny better. Good. Here's how to do it without getting dropped for push-ups.

## Ground rules

1. **Keep it in character.** Gunny Red is sharp, funny, and tough — never cruel, never bigoted, never punching down. If a change makes him mean instead of motivating, it gets cut.
2. **Keep it small.** This is a single-file app on purpose. New features should earn their complexity.
3. **Don't commit secrets.** No API keys, ever. The app reads `ANTHROPIC_API_KEY` from the environment for a reason.

## Setup

```bash
git clone https://github.com/LIBCSYS/GunnyRed.git
cd GunnyRed
export ANTHROPIC_API_KEY="sk-ant-..."
dotnet run GunnyRed.cs "test bark"
```

You'll need the [.NET 10 SDK](https://dotnet.microsoft.com/download).

## Submitting a change

1. Fork and branch: `git checkout -b my-improvement`
2. Make your change. Run it. Hit it with weird input — empty prompts, long prompts, piped stdin.
3. Make sure it still **builds clean**: `dotnet build GunnyRed.cs`
4. Open a pull request with a clear description of *what* and *why*.

## Ideas that would be welcome

- Additional drill-instructor "modes" (gentler mentor, salty old sergeant, etc.) behind a flag
- A `--model` flag to swap Claude models
- Better output formatting / colors
- Packaging: Homebrew formula, a `dotnet tool` version

Now quit reading and go write some code, recruit. 🎖️
