---
name: market-analyst
description: Conduct product market analysis, competitive intelligence, and feature benchmarking. Use when the user asks for market research, competitor comparison, product teardown, TAM/SAM/SOM estimation, or executive-ready analysis reports. Generates structured Markdown preview first, then exports PDF/DOCX on request. Do NOT use for financial trading, stock picks, or investment advice.
homepage: https://github.com/z22811584/market-analyst-skill
metadata: {"openclaw":{"emoji":"📊","requires":{"bins":["curl","jq"],"anyBins":["pandoc","wkhtmltopdf"],"env":[]},"primaryEnv":"SIMILARWEB_API_KEY","install":[{"id":"jq-brew","kind":"brew","formula":"jq","bins":["jq"],"label":"Install jq (brew)"},{"id":"pandoc-brew","kind":"brew","formula":"pandoc","bins":["pandoc"],"label":"Install pandoc (brew)"}]}}
---

# Market Analyst — 產品市場分析 & 競品報告

Generate executive-ready market analysis reports covering product positioning, competitive landscape, and feature benchmarking. Output a Markdown preview in chat first, then export PDF or DOCX on user request.

## When to Trigger

Activate on any of these intents:
- "分析 XX 產品的市場" / "market analysis for XX"
- "XX 跟 YY 的競品比較" / "competitor comparison"
- "XX 的功能分析" / "product feature teardown"
- "TAM SAM SOM" / "市場規模估算"
- "產品報告" / "executive report" / "簡報型分析"

## Workflow (5 Steps)

### Step 1 — Scope Definition

Collect from user (ask if missing):
1. **Target product** — the product or company to analyze
2. **Competitors** — list of 2-5 competitors (or ask agent to identify top 3-5)
3. **Focus areas** — pick from: market sizing, competitive landscape, feature comparison, pricing, SWOT, go-to-market strategy
4. **Audience** — default: executive summary for C-level / 高管簡報

Store answers as variables for subsequent steps.

### Step 2 — Data Collection (Multi-Source)

Execute data gathering in parallel where possible. Use the strategies below in priority order.

#### 2a. Web Research (always available)
Use the browser tool or web search to collect:
- Company "About" pages, press releases, blog announcements
- Crunchbase / PitchBook profiles (funding, valuation, headcount)
- G2 / Capterra / TrustRadius reviews and ratings
- Industry analyst reports (Gartner, Forrester, IDC — summaries only)
- News articles from last 12 months
- App store listings and changelogs

Search queries to run (replace `{product}` with target):
```
{product} market share 2025
{product} vs {competitor} comparison
{product} pricing plans
{product} series funding valuation
{product} G2 reviews rating
{product} product roadmap announcements
{industry} TAM SAM SOM market size
```

#### 2b. API Data (when keys configured)
If `SIMILARWEB_API_KEY` is set in env or config:
```bash
bash {baseDir}/scripts/fetch_similarweb.sh "{domain}" "$SIMILARWEB_API_KEY"
```
Returns: monthly visits, traffic sources, geo distribution, top referrals.

If `CRUNCHBASE_API_KEY` is set:
```bash
bash {baseDir}/scripts/fetch_crunchbase.sh "{company_name}" "$CRUNCHBASE_API_KEY"
```
Returns: funding rounds, investors, employee count, categories.

If no API keys configured — skip gracefully, rely on web research only. Do NOT ask user for API keys unless they mention wanting API-sourced data.

#### 2c. User-Uploaded Documents
If user provides files (PDF, Excel, CSV, PPTX):
1. Read the file using appropriate tool (file read / pdf extraction)
2. Extract relevant data points: revenue figures, user counts, feature lists, internal metrics
3. Integrate into analysis — label as "internal data" in the report

### Step 3 — Analysis & Structuring

Process collected data through these analysis frameworks. See `{baseDir}/references/analysis-frameworks.md` for detailed methodology.

Run each applicable framework:
1. **Market Sizing** — TAM → SAM → SOM with sources and assumptions
2. **Competitive Positioning** — 2x2 matrix (pick relevant axes per industry)
3. **Feature Comparison** — normalized scoring table (1-5 scale)
4. **SWOT Analysis** — for target product relative to market
5. **Pricing Intelligence** — tier comparison table with value-per-dollar notes
6. **Key Findings** — 3-5 bullet executive takeaways

### Step 4 — Report Generation (Chat Preview)

Output the report in Markdown directly in chat using this structure. See `{baseDir}/references/report-template.md` for the full template.

**Report Structure:**
```
# {Product} 市場分析報告
> 報告日期: {date} | 分析師: OpenClaw Market Analyst

## TL;DR — 執行摘要
(3-5 bullet points, each ≤2 sentences)

## 1. 市場概覽
### 1.1 市場規模 (TAM/SAM/SOM)
### 1.2 市場趨勢與驅動力

## 2. 競品格局
### 2.1 競品定位矩陣
### 2.2 競品概覽表
(table: 公司 | 成立年份 | 融資 | 估值 | 員工數 | 核心產品)

## 3. 功能對比分析
### 3.1 功能評分矩陣
(table: 功能 | {product} | {comp1} | {comp2} | ... scored 1-5)
### 3.2 差異化亮點

## 4. 定價分析
(table: 方案 | {product} | {comp1} | {comp2} | ...)

## 5. SWOT 分析
(2x2 grid: Strengths | Weaknesses | Opportunities | Threats)

## 6. 關鍵發現與建議
(numbered list, 3-5 actionable items)

## 附錄
### 資料來源
### 方法論說明
### 免責聲明
```

**Formatting rules for executive readability:**
- Use tables for any comparison data — executives scan tables, not paragraphs
- Bold the single most important number in each section
- Keep body text ≤3 sentences per paragraph
- Use 🟢🟡🔴 indicators in feature matrices for quick scanning
- Chinese (zh-TW) as default language; switch to English if user writes in English

### Step 5 — Export (On Request)

When user asks to export ("匯出", "下載", "export", "PDF", "DOCX"):

**PDF export (preferred for executives):**
```bash
bash {baseDir}/scripts/export_report.sh pdf "{report_path}" "{output_path}"
```

**DOCX export:**
```bash
bash {baseDir}/scripts/export_report.sh docx "{report_path}" "{output_path}"
```

Save output to `~/.openclaw/workspace/outputs/market-analyst/` with filename pattern:
`{product}-market-analysis-{YYYY-MM-DD}.{ext}`

After export, send the file to the user in the current chat channel.

## Guardrails

- NEVER present estimates as facts — always label assumptions and confidence level
- NEVER fabricate data points — if data is unavailable, state "data not available" explicitly
- ALWAYS include source attribution in the appendix
- ALWAYS add disclaimer: "本報告基於公開資訊分析，不構成投資建議"
- If user asks for stock/investment recommendations, decline and suggest consulting a financial advisor
- Rate-limit API calls: max 5 requests per source per analysis run

## Failure Handling

- API key missing → skip that data source, note in report: "（{source} 數據未取得，因未設定 API 金鑰）"
- API rate limited → retry once after 30s, then skip with note
- No competitors found → ask user to provide 2-3 competitor names
- Insufficient data for a section → include section header with note: "數據不足，建議補充內部資料"
- Export tool missing → fall back to raw Markdown file output
