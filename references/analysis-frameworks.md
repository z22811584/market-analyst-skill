# Analysis Frameworks Reference

Detailed methodology for each analysis framework. Load this file on-demand during Step 3.

## PDF Compatibility Rule

**NEVER use emoji (🟢🟡🔴⭐ etc.) in any output that may be exported to PDF.**
Use text-safe alternatives: `[H]` `[M]` `[L]` or `★` or letter grades.

---

## 1. Market Sizing (TAM/SAM/SOM)

### Top-Down Approach
1. Find total industry revenue from analyst reports (Gartner, IDC, Statista)
2. TAM = Total industry revenue for the broadest relevant market
3. SAM = TAM x (% of market segments the product can serve)
4. SOM = SAM x (realistic market share based on current traction)

### Bottom-Up Approach
1. Estimate number of potential customers in target segment
2. Multiply by average annual contract value (ACV)
3. Cross-reference with top-down for sanity check

### Output Format
```
| 指標 | 金額 | 方法 | 信心度 |
|------|------|------|--------|
| TAM  | $XXB | Top-down: {source} | [H]/[M]/[L] |
| SAM  | $XXB | Segment filter: {criteria} | [H]/[M]/[L] |
| SOM  | $XXM | Bottom-up: {assumptions} | [H]/[M]/[L] |
```

Always state:
- Year of data
- Currency (default USD)
- Growth rate (CAGR) if available
- Key assumptions

---

## 2. Traffic & User Analysis (NEW)

### 2a. Top N Player Traffic Ranking

**Data sources (priority order):**
1. SimilarWeb (API if key available; otherwise web search for public snippets)
2. SEMrush public data
3. Alexa/Tranco ranking lists
4. Official company disclosures (earnings, press releases)
5. Industry reports (Statista, eMarketer, Comscore)

**Search queries:**
```
{site} traffic similarweb
{site} monthly visits 2025
{industry} top websites traffic ranking
site:similarweb.com {site}
{site} DAU MAU active users
```

**Metrics to collect per site:**
- Monthly visits (unique + total)
- Daily average visits
- DAU (Daily Active Users) — official or estimated
- MAU (Monthly Active Users) — official or estimated
- Average visit duration
- Pages per visit
- Bounce rate
- YoY traffic change

**DAU/MAU estimation when not officially disclosed:**
```
DAU (est.) = Monthly Visits / 30 x Return Rate Multiplier
MAU (est.) = Monthly Unique Visitors x (1 + Repeat Visit Factor)
```
- High-engagement platforms (social, gaming, adult): Return Rate ~0.3-0.5
- Content/media sites: Return Rate ~0.15-0.25
- SaaS/tools: Return Rate ~0.5-0.8
- Always label as "estimate" and state the method

### 2b. Traffic Ceiling Estimation

**Method: TAM User Base x Penetration x Frequency**

Three scenarios:

| Scenario | Penetration Rate | Frequency Assumption |
|----------|-----------------|---------------------|
| Optimistic | Top performer benchmark | High engagement |
| Base | Industry median | Average engagement |
| Conservative | New entrant reality | Low engagement |

**Calculation:**
```
Monthly Traffic Ceiling = Target User Population x Penetration Rate x Monthly Visit Frequency
Daily Traffic Ceiling = Monthly / 30
DAU Ceiling = Daily Traffic x Return Rate
```

**Output Format:**
```
| 場景 | 潛在用戶基數 | 滲透率 | 月均頻次 | 月流量估算 | DAU 估算 |
|------|------------|--------|---------|----------|---------|
| 樂觀 | XXM | XX% | X.X | XXM | XXK |
| 基準 | XXM | XX% | X.X | XXM | XXK |
| 保守 | XXM | XX% | X.X | XXM | XXK |
```

### 2c. Traffic Source Structure

Collect for the target market or top players:

```
| 來源 | 佔比 | 說明 |
|------|------|------|
| Direct | XX% | Brand strength indicator |
| Search (Organic) | XX% | SEO dependency |
| Search (Paid) | XX% | Paid acquisition cost |
| Social | XX% | Viral/community potential |
| Referral | XX% | Partnership ecosystem |
| Display/Paid | XX% | Ad spend dependency |
```

Also collect: geo distribution (top 5 countries), device split (mobile/desktop/tablet).

---

## 3. Competitive Positioning Matrix

### Axis Selection
Pick 2 axes most relevant to the industry:
- Enterprise vs SMB focus
- Price vs Feature richness
- Horizontal platform vs Vertical solution
- Self-serve vs Sales-led
- AI-native vs Traditional
- Global vs Regional focus
- Traffic volume vs Engagement depth

### Scoring
- Place each competitor on a 1-10 scale for each axis
- Use collected data (pricing tiers, customer segments, feature count, traffic) as evidence
- Present as a text-based 2x2 quadrant

### Output Format
```
                    ^ Enterprise / High Traffic
                    |
         {comp_A}  |  {comp_B}
                    |
   -----------------+------------------ >
     Low Price      |         High Price
                    |
         {comp_C}  |  {target}
                    |
                    v SMB / Low Traffic
```

---

## 4. Feature Comparison Matrix

### Scoring Rules
- **5** = Best-in-class, industry-leading implementation
- **4** = Strong, covers all common use cases
- **3** = Adequate, basic implementation
- **2** = Weak, significant gaps
- **1** = Missing or unusable
- **N/A** = Not applicable to this product

### Output Format
```
| 功能類別 | {target} | {comp1} | {comp2} | {comp3} |
|----------|----------|---------|---------|---------|
| 核心功能 | [H] 4/5  | [H] 5/5 | [M] 3/5 | [M] 3/5 |
| 整合生態 | [H] 4/5  | [M] 3/5 | [H] 4/5 | [L] 2/5 |
| ...      | ...      | ...     | ...     | ...     |
| **平均** | **X.X**  | **X.X** | **X.X** | **X.X** |
```

---

## 5. SWOT Analysis

### Collection Rules
- **Strengths**: Internal, positive
- **Weaknesses**: Internal, negative
- **Opportunities**: External, positive
- **Threats**: External, negative

### Quality Checks
- Each quadrant: 3-5 items
- Each item: 1 sentence + evidence source
- Prioritize by impact (high to low)

### Output Format
```
| [+] Strengths | [-] Weaknesses |
|---------------|----------------|
| * ... | * ... |

| [+] Opportunities | [-] Threats |
|--------------------|-------------|
| * ... | * ... |
```

---

## 6. Pricing Intelligence

### Data Points to Collect
- Tier names and pricing (monthly/annual)
- Feature gates per tier
- Per-seat vs flat-rate vs usage-based model
- Free tier / freemium limits
- Enterprise pricing (if public)
- Recent pricing changes

### Output Format
```
| 方案 | {target} | {comp1} | {comp2} |
|------|----------|---------|---------|
| 免費方案 | Yes (5 users) | Yes (3 users) | No |
| 入門 | $XX/mo/user | $XX/mo/user | $XX/mo/user |
| 專業 | $XX/mo/user | $XX/mo/user | $XX/mo/user |
| 企業 | Contact | $XX/mo/user | Contact |
| 計費模式 | Per-seat | Usage-based | Per-seat |
```
