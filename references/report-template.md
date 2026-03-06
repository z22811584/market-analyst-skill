# Report Template Reference

Full Markdown template for the executive analysis report. Agent fills in `{placeholders}` with collected data.

## PDF Compatibility Notes

**IMPORTANT:** Do NOT use emoji (🟢🟡🔴⭐ etc.) in tables or any content that will be exported to PDF.
`wkhtmltopdf` cannot render emoji — they will appear as blank cells.

Use these PDF-safe alternatives instead:
- Indicators: `[H]` = High/Good, `[M]` = Medium, `[L]` = Low/Weak
- Scores: `★` (U+2605) works in most fonts; or use `4/5`, `A/B/C/S` grades
- SWOT headers: use text labels `[+]` `[-]` instead of colored emoji

---

```markdown
# {product_name} 市場分析報告

> 報告日期: {report_date}
> 分析師: OpenClaw Market Analyst
> 分析範圍: {scope_summary}
> 版本: v1.0

---

## TL;DR — 執行摘要

> **一句話結論**: {one_line_conclusion}

- {key_finding_1}
- {key_finding_2}
- {key_finding_3}
- {key_finding_4_if_applicable}

---

## 1. 市場概覽

### 1.1 市場規模

| 指標 | 金額 | 來源 | 信心度 |
|------|------|------|--------|
| TAM（總潛在市場） | ${tam} | {tam_source} | [H]/[M]/[L] |
| SAM（可服務市場） | ${sam} | {sam_methodology} | [H]/[M]/[L] |
| SOM（可獲取市場） | ${som} | {som_assumptions} | [H]/[M]/[L] |

**年複合成長率 (CAGR):** {cagr}%（{cagr_period}）

### 1.2 市場趨勢與驅動力

| 趨勢 | 影響程度 | 時間軸 |
|------|----------|--------|
| {trend_1} | [H] 高 | {timeframe} |
| {trend_2} | [M] 中 | {timeframe} |
| {trend_3} | [M] 中 | {timeframe} |

---

## 2. 流量與用戶分析

### 2.1 市場 Top N 玩家流量排名

| 排名 | 網站/平台 | 月訪問量 | 日均訪問量 | DAU (估) | MAU (估) | 主要流量來源 | YoY 變化 |
|------|----------|---------|-----------|---------|---------|------------|---------|
| 1 | {site_1} | {monthly_visits} | {daily_visits} | {dau} | {mau} | {top_source} | {yoy} |
| 2 | {site_2} | {monthly_visits} | {daily_visits} | {dau} | {mau} | {top_source} | {yoy} |
| 3 | {site_3} | {monthly_visits} | {daily_visits} | {dau} | {mau} | {top_source} | {yoy} |

> 數據來源: SimilarWeb / SEMrush / 公開報告。DAU/MAU 如無直接數據，基於月訪問量與回訪率估算。

### 2.2 流量天花板估算

**方法: TAM 用戶基數 × 滲透率 × 使用頻率**

| 場景 | 潛在用戶基數 | 滲透率 | 月均訪問頻次 | 估算月流量 | 估算 DAU |
|------|------------|--------|------------|----------|---------|
| 樂觀 | {user_base} | {rate_high}% | {freq_high} | {monthly_high} | {dau_high} |
| 基準 | {user_base} | {rate_mid}% | {freq_mid} | {monthly_mid} | {dau_mid} |
| 保守 | {user_base} | {rate_low}% | {freq_low} | {monthly_low} | {dau_low} |

**假設與說明:**
- 潛在用戶基數: {how_derived}
- 滲透率參考: {benchmark_source}
- 頻次參考: {frequency_source}

### 2.3 流量結構分析

**流量來源分布（行業平均）:**

| 來源 | 佔比 | 說明 |
|------|------|------|
| 直接訪問 (Direct) | {pct}% | {note} |
| 搜尋引擎 (Search) | {pct}% | {note} |
| 社交媒體 (Social) | {pct}% | {note} |
| 推薦連結 (Referral) | {pct}% | {note} |
| 廣告 (Paid) | {pct}% | {note} |

**地理分布 Top 5:**

| 排名 | 國家/地區 | 流量佔比 |
|------|----------|---------|
| 1 | {country} | {pct}% |
| 2 | {country} | {pct}% |
| 3 | {country} | {pct}% |

**區域市場細分（如適用，例如華人市場、東南亞等）:**

若目標市場涉及特定區域用戶群，應單獨列出該區域的 Top N 平台和用戶特徵：

| 地區 | 預估 MAU | 偏好特色 | 監管環境 |
|------|---------|---------|---------|
| {region_1} | {mau} | {preference} | {regulation} |
| {region_2} | {mau} | {preference} | {regulation} |

**裝置分布:**

| 裝置 | 佔比 |
|------|------|
| 行動裝置 (Mobile) | {pct}% |
| 桌面 (Desktop) | {pct}% |
| 平板 (Tablet) | {pct}% |

---

## 3. 競品格局

### 3.1 競品定位矩陣

**IMPORTANT:** Do NOT use ASCII art charts — they render poorly in PDF.
Use a table-based matrix instead, with clear axis labels:

**X 軸: {x_axis_label} | Y 軸: {y_axis_label}**

| {x_label} / {y_label} | {y_high} | {y_mid} | {y_low} |
|------------------------|----------|---------|---------|
| **{x_category_1}** | {players} | {players} | {players} |
| **{x_category_2}** | {players} | {players} | {players} |
| **{x_category_3}** | {players} | {players} | {players} |

### 3.2 競品概覽

| 公司 | 成立 | 總部 | 融資總額 | 估值 | 員工數 | 核心產品 |
|------|------|------|----------|------|--------|----------|
| **{target}** | {year} | {hq} | {funding} | {valuation} | {headcount} | {product} |
| {comp1} | {year} | {hq} | {funding} | {valuation} | {headcount} | {product} |
| {comp2} | {year} | {hq} | {funding} | {valuation} | {headcount} | {product} |

### 3.3 流量與用戶對比

| 指標 | {target} | {comp1} | {comp2} | {comp3} |
|------|----------|---------|---------|---------|
| 月訪問量 | {visits} | {visits} | {visits} | {visits} |
| DAU (估) | {dau} | {dau} | {dau} | {dau} |
| MAU (估) | {mau} | {mau} | {mau} | {mau} |
| 平均停留時間 | {duration} | {duration} | {duration} | {duration} |
| 跳出率 | {bounce}% | {bounce}% | {bounce}% | {bounce}% |
| 主要流量來源 | {source} | {source} | {source} | {source} |
| G2/評論評分 | {rating} | {rating} | {rating} | {rating} |

---

## 4. 功能對比分析

### 4.1 功能評分矩陣

| 功能類別 | {target} | {comp1} | {comp2} | {comp3} |
|----------|----------|---------|---------|---------|
| 核心功能 | {score}/5 | {score}/5 | {score}/5 | {score}/5 |
| 整合生態 | {score}/5 | {score}/5 | {score}/5 | {score}/5 |
| 分析報表 | {score}/5 | {score}/5 | {score}/5 | {score}/5 |
| 安全合規 | {score}/5 | {score}/5 | {score}/5 | {score}/5 |
| UX 設計 | {score}/5 | {score}/5 | {score}/5 | {score}/5 |
| API 擴展性 | {score}/5 | {score}/5 | {score}/5 | {score}/5 |
| 行動裝置 | {score}/5 | {score}/5 | {score}/5 | {score}/5 |
| AI 能力 | {score}/5 | {score}/5 | {score}/5 | {score}/5 |
| **綜合平均** | **{avg}** | **{avg}** | **{avg}** | **{avg}** |

> 評分標準: 5=業界領先 4=優秀 3=堪用 2=不足 1=缺失
> [H] >=4 | [M] 3 | [L] <=2

### 4.2 差異化亮點

**{target} 獨有優勢:**
- {unique_strength_1}
- {unique_strength_2}

**{target} 待補強項目:**
- {gap_1}
- {gap_2}

---

## 5. 定價分析

| 方案 | {target} | {comp1} | {comp2} | {comp3} |
|------|----------|---------|---------|---------|
| 免費方案 | {free_tier} | {free_tier} | {free_tier} | {free_tier} |
| 入門方案 | {starter} | {starter} | {starter} | {starter} |
| 專業方案 | {pro} | {pro} | {pro} | {pro} |
| 企業方案 | {enterprise} | {enterprise} | {enterprise} | {enterprise} |
| 計費模式 | {model} | {model} | {model} | {model} |

**定價洞察:** {pricing_insight}

---

## 6. SWOT 分析

| [+] 優勢 Strengths | [-] 劣勢 Weaknesses |
|--------------------|---------------------|
| * {s1} | * {w1} |
| * {s2} | * {w2} |
| * {s3} | * {w3} |

| [+] 機會 Opportunities | [-] 威脅 Threats |
|------------------------|-----------------|
| * {o1} | * {t1} |
| * {o2} | * {t2} |
| * {o3} | * {t3} |

---

## 7. 關鍵發現與建議

### 發現

1. **{finding_title_1}** — {finding_detail_1}
2. **{finding_title_2}** — {finding_detail_2}
3. **{finding_title_3}** — {finding_detail_3}

### 建議行動

| 優先級 | 建議 | 預期影響 | 時間軸 |
|--------|------|----------|--------|
| P0 | {action_1} | {impact} | {timeline} |
| P1 | {action_2} | {impact} | {timeline} |
| P2 | {action_3} | {impact} | {timeline} |

---

## 附錄

### A. 資料來源

| # | 來源 | 類型 | 存取日期 |
|---|------|------|----------|
| 1 | {source_url_or_name} | {type: web/API/internal} | {date} |
| 2 | ... | ... | ... |

### B. 方法論說明

- 市場規模: {methodology_note}
- 功能評分: 基於公開文件、產品試用、用戶評論綜合評定
- 流量數據: {source: SimilarWeb API / web research / public reports}
- DAU/MAU 估算: 基於月訪問量、平均回訪率、行業基準推算（非精確數據）
- 流量天花板: TAM 用戶基數 x 滲透率 x 使用頻率，三場景估算

### C. 免責聲明

> 本報告基於公開資訊與第三方數據分析，不構成投資建議。
> 數據時效性以各來源最後更新時間為準。
> 流量與 DAU/MAU 數據除非明確標註來源，否則為基於公開數據的估算值。
> 內部機密數據（如有引用）已標註來源，請依貴公司資訊安全政策處理。
```

---

## Formatting Notes for Agent

- Replace ALL `{placeholders}` with actual data
- Remove any row/section where data is entirely unavailable — add footnote instead
- **NEVER use emoji in tables** — use text indicators: [H], [M], [L], or ★ stars, or letter grades (S/A/B/C)
- If a table has >7 columns, split into two tables for readability
- Numbers: use comma separators ($1,234,567) and round to meaningful precision
- Traffic numbers: use K (thousands), M (millions), B (billions) suffixes for readability
- Dates: use YYYY-MM-DD format
- Language: default zh-TW; switch to English if user initiated in English
- DAU/MAU: always label as "estimate" if not from official source
