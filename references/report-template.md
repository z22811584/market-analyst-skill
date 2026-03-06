# Report Template Reference

Full Markdown template for the executive analysis report. Agent fills in `{placeholders}` with collected data.

---

```markdown
# {product_name} 市場分析報告

> 📅 報告日期: {report_date}
> 🤖 分析師: OpenClaw Market Analyst
> 🎯 分析範圍: {scope_summary}
> 📌 版本: v1.0

---

## TL;DR — 執行摘要

> **一句話結論**: {one_line_conclusion}

- 📈 {key_finding_1}
- ⚔️ {key_finding_2}
- 💡 {key_finding_3}
- ⚠️ {key_finding_4_if_applicable}

---

## 1. 市場概覽

### 1.1 市場規模

| 指標 | 金額 | 來源 | 信心度 |
|------|------|------|--------|
| TAM（總潛在市場） | ${tam} | {tam_source} | {confidence} |
| SAM（可服務市場） | ${sam} | {sam_methodology} | {confidence} |
| SOM（可獲取市場） | ${som} | {som_assumptions} | {confidence} |

**年複合成長率 (CAGR):** {cagr}%（{cagr_period}）

### 1.2 市場趨勢與驅動力

| 趨勢 | 影響程度 | 時間軸 |
|------|----------|--------|
| {trend_1} | 🟢 高 | {timeframe} |
| {trend_2} | 🟡 中 | {timeframe} |
| {trend_3} | 🟡 中 | {timeframe} |

---

## 2. 競品格局

### 2.1 競品定位矩陣

{positioning_matrix_text_chart}

### 2.2 競品概覽

| 公司 | 成立 | 總部 | 融資總額 | 估值 | 員工數 | 核心產品 |
|------|------|------|----------|------|--------|----------|
| **{target}** | {year} | {hq} | {funding} | {valuation} | {headcount} | {product} |
| {comp1} | {year} | {hq} | {funding} | {valuation} | {headcount} | {product} |
| {comp2} | {year} | {hq} | {funding} | {valuation} | {headcount} | {product} |
| {comp3} | {year} | {hq} | {funding} | {valuation} | {headcount} | {product} |

### 2.3 流量與用戶數據

| 指標 | {target} | {comp1} | {comp2} | {comp3} |
|------|----------|---------|---------|---------|
| 月訪問量 | {visits} | {visits} | {visits} | {visits} |
| 主要流量來源 | {source} | {source} | {source} | {source} |
| G2 評分 | {rating} | {rating} | {rating} | {rating} |
| G2 評論數 | {count} | {count} | {count} | {count} |

---

## 3. 功能對比分析

### 3.1 功能評分矩陣

| 功能類別 | {target} | {comp1} | {comp2} | {comp3} |
|----------|----------|---------|---------|---------|
| 核心功能 | {score} | {score} | {score} | {score} |
| 整合生態 | {score} | {score} | {score} | {score} |
| 分析報表 | {score} | {score} | {score} | {score} |
| 安全合規 | {score} | {score} | {score} | {score} |
| UX 設計 | {score} | {score} | {score} | {score} |
| API 擴展性 | {score} | {score} | {score} | {score} |
| 行動裝置 | {score} | {score} | {score} | {score} |
| AI 能力 | {score} | {score} | {score} | {score} |
| **綜合平均** | **{avg}** | **{avg}** | **{avg}** | **{avg}** |

> 評分標準: 5=業界領先 4=優秀 3=堪用 2=不足 1=缺失
> 🟢 ≥4 | 🟡 3 | 🔴 ≤2

### 3.2 差異化亮點

**{target} 獨有優勢:**
- {unique_strength_1}
- {unique_strength_2}

**{target} 待補強項目:**
- {gap_1}
- {gap_2}

---

## 4. 定價分析

| 方案 | {target} | {comp1} | {comp2} | {comp3} |
|------|----------|---------|---------|---------|
| 免費方案 | {free_tier} | {free_tier} | {free_tier} | {free_tier} |
| 入門方案 | {starter} | {starter} | {starter} | {starter} |
| 專業方案 | {pro} | {pro} | {pro} | {pro} |
| 企業方案 | {enterprise} | {enterprise} | {enterprise} | {enterprise} |
| 計費模式 | {model} | {model} | {model} | {model} |

**定價洞察:** {pricing_insight}

---

## 5. SWOT 分析

| 🟢 優勢 Strengths | 🔴 劣勢 Weaknesses |
|--------------------|---------------------|
| • {s1} | • {w1} |
| • {s2} | • {w2} |
| • {s3} | • {w3} |

| 🔵 機會 Opportunities | 🟠 威脅 Threats |
|------------------------|-----------------|
| • {o1} | • {t1} |
| • {o2} | • {t2} |
| • {o3} | • {t3} |

---

## 6. 關鍵發現與建議

### 發現

1. **{finding_title_1}** — {finding_detail_1}
2. **{finding_title_2}** — {finding_detail_2}
3. **{finding_title_3}** — {finding_detail_3}

### 建議行動

| 優先級 | 建議 | 預期影響 | 時間軸 |
|--------|------|----------|--------|
| 🔴 P0 | {action_1} | {impact} | {timeline} |
| 🟠 P1 | {action_2} | {impact} | {timeline} |
| 🟡 P2 | {action_3} | {impact} | {timeline} |

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
- 流量數據: {source: SimilarWeb API / web research}

### C. 免責聲明

> ⚠️ 本報告基於公開資訊與第三方數據分析，不構成投資建議。
> 數據時效性以各來源最後更新時間為準。
> 內部機密數據（如有引用）已標註來源，請依貴公司資訊安全政策處理。
```

---

## Formatting Notes for Agent

- Replace ALL `{placeholders}` with actual data
- Remove any row/section where data is entirely unavailable — add footnote instead
- Use 🟢🟡🔴 consistently: green=good, yellow=neutral, red=concern
- If a table has >7 columns, split into two tables for readability
- Numbers: use comma separators ($1,234,567) and round to meaningful precision
- Dates: use YYYY-MM-DD format
- Language: default zh-TW; switch to English if user initiated in English
