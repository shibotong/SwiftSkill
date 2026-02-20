# SwiftSkill

A Swift library for parsing AI skill definitions from Markdown files with YAML frontmatter. SwiftSkill reads the [Anthropic-style skill format](https://github.com/anthropics/skills) (SKILL.md) used in tools like Cursor, extracting structured metadata from YAML frontmatter.

## Requirements

- Swift 6.2+
- macOS 26+ / iOS 26+

## Installation

Add SwiftSkill as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/shibotong/SwiftSkill.git", from: "1.0.0")
]
```

Then add it to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: ["SwiftSkill"]
)
```

## Usage

### Parsing from a String

```swift
import SwiftSkill

let markdown = """
---
name: my-skill
description: A useful skill
license: MIT
metadata:
  author: shibotong
---
# Skill body here
"""

let parser = MarkdownParser()
let skill = try parser.parse(markdown)

print(skill.name)        // "my-skill"
print(skill.description) // "A useful skill"
print(skill.license)     // Optional("MIT")
```

### Parsing from a Remote URL

```swift
import SwiftSkill

let parser = MarkdownParser()
let url = URL(string: "https://raw.githubusercontent.com/anthropics/skills/.../SKILL.md")!
let skill = try await parser.parse(url: url)
```

## Skill Model

The `Skill` struct contains the following properties:

| Property | Type | Required |
|----------|------|----------|
| `name` | `String` | Yes |
| `description` | `String` | Yes |
| `license` | `String?` | No |
| `metadata` | `[String: String]?` | No |
| `allowedTools` | `[String]?` | No |

## Dependencies

- [Yams](https://github.com/jpsim/Yams) — YAML parsing
- [swift-markdown](https://github.com/swiftlang/swift-markdown) — Markdown processing

## License

This project is available under the MIT License.
