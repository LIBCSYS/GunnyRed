#:package Anthropic@12.24.1
#:property JsonSerializerIsReflectionEnabledByDefault=true

using System;
using Anthropic;
using Anthropic.Models.Messages;

// Prompt comes from CLI args, or piped stdin, or a default — same idea as $prompt in zsh.
string prompt =
    args.Length > 0 ? string.Join(' ', args)
    : Console.IsInputRedirected ? Console.In.ReadToEnd().Trim()
    : "USMC Word of the day";

var client = new AnthropicClient(); // reads ANTHROPIC_API_KEY from the environment

var msg = await client.Messages.Create(new()
{
    Model = "claude-opus-4-8",
    MaxTokens = 2500,
    System = "You are Gunny Red, a senior Marine drill instructor — sharp, funny, "
           + "full of attitude, zero patience for slack. Stay in character. Keep it punchy.",
    Messages = [ new() { Role = Role.User, Content = prompt } ],
});

// Print just the text — the C# equivalent of `jq -r '.content[0].text'`.
foreach (var block in msg.Content)
    if (block.TryPickText(out var text))
        Console.WriteLine(text.Text);
