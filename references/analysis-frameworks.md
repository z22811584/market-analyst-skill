# Analysis Frameworks Reference

Detailed methodology for each analysis framework. Load this file on-demand during Step 3.

## 1. Market Sizing (TAM/SAM/SOM)

### Top-Down Approach
1. Find total industry revenue from analyst reports (Gartner, IDC, Statista)
2. TAM = Total industry revenue for the broadest relevant market
3. SAM = TAM × (% of market segments the product can serve)
4. SOM = SAM × (realistic market share based on current traction)

### Bottom-Up Approach
1. Estimate number of potential customers in target segment
2. Multiply by average annual contract value (ACV)
3. Cross-reference with top-down for sanity check

### Output Format
```
| 指標 | 金額 | 方法 | 信心度 |
|------|------|------|--------|
| TAM  | $XXB | Top-down: {source} | 🟢高/🟡中/🔴低 |
| SAM  | $XXB | Segment filter: {criteria} | 🟢/🟡/🔴 |
| SOM  | $XXM | Bottom-up: {assumptions} | 🟢/🟡/🔴 |
```

Always state:
- Year of data
- Currency (default USD)
- Growth rate (CAGR) if available
- Key assumptions

## 2. Competitive Positioning Matrix

### Axis Selection
Pick 2 axes most relevant to the industry:
- Enterprise vs SMB focus
- Price vs Feature richness
- Horizontal platform vs Vertical solution
- Self-serve vs Sales-led
- AI-native vs Traditional
- Global vs Regional focus

### Scoring
- Place each competitor on a 1-10 scale for each axis
- Use collected data (pricing tiers, customer segments, feature count) as evidence
- Present as a text-based 2x2 quadrant

### Output Format
```
                    ↑ Enterprise
                    |
         {comp_A}  |  {comp_B}
                    |
   ─────────────────┼──────────────── →
     Low Price      |         High Price
                    |
         {comp_C}  |  {target}
                    |
                    ↓ SMB
```

## 3. Feature Comparison Matrix

### Scoring Rules
- **5** = Best-in-class, industry-leading implementation
- **4** = Strong, covers all common use cases
- **3** = Adequate, basic implementation
- **2** = Weak, significant gaps
- **1** = Missing or unusable
- **N/A** = Not applicable to this product

### Feature Categories (select relevant ones)
- Core functionality
- Integrations & ecosystem
- Analytics & reporting
- Security & compliance
- UX & design quality
- API & extensibility
- Mobile support
- Pricing flexibility
- Documentation & support
- AI/ML capabilities

### Output Format
```
| 功能類別 | {target} | {comp1} | {comp2} | {comp3} |
|----------|----------|---------|---------|---------|
| 核心功能 | 🟢 4/5   | 🟢 5/5  | 🟡 3/5  | 🟡 3/5  |
| 整合生態 | 🟢 4/5   | 🟡 3/5  | 🟢 4/5  | 🔴 2/5  |
| ...      | ...      | ...     | ...     | ...     |
| **平均** | **X.X**  | **X.X** | **X.X** | **X.X** |
```

## 4. SWOT Analysis

### Collection Rules
- **Strengths**: Internal, positive — what does the product do better than competitors?
- **Weaknesses**: Internal, negative — where does it fall short?
- **Opportunities**: External, positive — market trends, unmet needs, expansion areas
- **Threats**: External, negative — competitor moves, regulation, market shifts

### Quality Checks
- Each quadrant: 3-5 items
- Each item: 1 sentence + evidence source
- Prioritize by impact (high → low)

### Output Format
```
| 優勢 Strengths | 劣勢 Weaknesses |
|----------------|-----------------|
| • ... | • ... |
| • ... | • ... |

| 機會 Opportunities | 威脅 Threats |
|--------------------|-------------|
| • ... | • ... |
| • ... | • ... |
```

## 5. Pricing Intelligence

### Data Points to Collect
- Tier names and pricing (monthly/annual)
- Feature gates per tier
- Per-seat vs flat-rate vs usage-based model
- Free tier / freemium limits
- Enterprise pricing (if public)
- Recent pricing changes

### Value Analysis
- Calculate cost per user at 10, 100, 1000 seats
- Identify which features are gated at higher tiers
- Flag any hidden costs (implementation, support, add-ons)

### Output Format
```
| 方案 | {target} | {comp1} | {comp2} |
|------|----------|---------|---------|
| 免費方案 | ✅ 5 users | ✅ 3 users | ❌ 無 |
| 入門 | $XX/mo/user | $XX/mo/user | $XX/mo/user |
| 專業 | $XX/mo/user | $XX/mo/user | $XX/mo/user |
| 企業 | 洽詢 | $XX/mo/user | 洽詢 |
| 計費模式 | Per-seat | Usage-based | Per-seat |
```
