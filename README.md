# Market Analyst Skill for OpenClaw

An OpenClaw skill that generates executive-ready market analysis reports covering product positioning, competitive landscape, and feature benchmarking.

## Features

- Product market sizing (TAM/SAM/SOM)
- Competitive landscape analysis with positioning matrix
- Feature comparison scoring (1-5 scale)
- SWOT analysis
- Pricing intelligence
- PDF/DOCX export with styled formatting

## Installation

```bash
# Via ClawHub
clawhub install market-analyst

# Or manually
git clone https://github.com/z22811584/market-analyst-skill.git ~/.openclaw/workspace/skills/market-analyst
```

## Optional API Keys

Set these in your OpenClaw config for enhanced data collection:

- `SIMILARWEB_API_KEY` - Website traffic and analytics data
- `CRUNCHBASE_API_KEY` - Company funding and profile data

Without API keys, the skill relies on web research only.

## Dependencies

**Required:** `curl`, `jq`

**Optional (for export):** `pandoc`, `wkhtmltopdf`

```bash
brew install jq pandoc
```

## Usage

Ask your OpenClaw agent:

- "分析 Notion 的市場"
- "Slack vs Teams 競品比較"
- "Figma 的 TAM SAM SOM"
- "幫我做一份 Stripe 的產品報告"

## File Structure

```
market-analyst-skill/
├── SKILL.md              # Skill definition & agent instructions
├── scripts/
│   ├── export_report.sh      # PDF/DOCX export
│   ├── fetch_crunchbase.sh   # Crunchbase API client
│   └── fetch_similarweb.sh   # SimilarWeb API client
├── references/
│   ├── analysis-frameworks.md # Analysis methodology
│   └── report-template.md    # Report template
└── assets/
    └── report-style.css      # PDF export styling
```

## License

MIT
