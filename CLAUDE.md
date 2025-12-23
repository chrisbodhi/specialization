# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A Zola static site called "A Boy's Guide to Human Competence" - a skills guide inspired by the Heinlein quote about specialization. Uses the "Tomorrow's Horizon" retrofuturist design system.

## Commands

```bash
nix-shell          # Enter dev environment (provides zola)
zola serve         # Development server with hot reload
zola build         # Build to /public
```

## Architecture

**Content Structure:**
- `content/_index.md` - Homepage intro text
- `content/skills/_index.md` - Skills section (sorted by weight)
- `content/skills/XX-name.md` - Individual skills with frontmatter:
  ```toml
  [extra]
  number = 1
  slug = "diaper"           # Used for URL hash navigation
  quote_text = "change a diaper"  # Text shown in Heinlein quote
  ```

**Templates:**
- `templates/base.html` - Master layout with hero header, navigation, and skill-switching JS
- `templates/index.html` - Loads skills section via `get_section()`, renders quote with skill links
- `templates/skill.html` - Individual skill display (included in loop)
- `templates/shortcodes/sidenote.html` - Margin notes (collapsible on mobile)
- `templates/shortcodes/warning.html` - Warning boxes

**Styling:**
- `static/main.css` - Tomorrow's Horizon design system with CSS custom properties
- Design guide reference: `style-guide.html` (not part of build)

**Key Design Tokens (in main.css :root):**
- Colors: `--cream`, `--midnight`, `--atomic-orange`, `--stellar-teal`
- Fonts: `--font-display` (Anybody), `--font-body` (Source Serif 4)
- Spacing: `--space-sm` through `--space-2xl`

## Shortcode Usage

```markdown
{% sidenote(id="unique-id") %}
Sidenote content here.
{% end %}

{% warning(title="Title") %}
Warning content here.
{% end %}
```
