# 🧮 Liquidity Macro Interpreter

**Open-source macro intelligence tool that decodes U.S. liquidity flows into actionable signals.**  
Built using Elixir/Phoenix (with Ruby CLI companion), this project helps investors, analysts, and learners interpret key liquidity datapoints like:

- 🏛️ Fed Balance Sheet (WALCL)
- 💰 Treasury General Account (TGA)
- 🏦 Reverse Repo Facility (RRP)
- 💧 Net Liquidity = Fed − TGA − RRP
- 📈 More: M2, Bank Credit, SOFR, SOMA, and others

---

## 🚀 Features

- CLI or Web UI: interpret raw liquidity data and classify macro regimes
- Auto-computed Net Liquidity and WoW % change
- Weekly historical tracking with export
- Optional user annotations, email reports, and premium tier (Stripe)
- Deployable to Fly.io / run as local script / Replit-compatible

---

## 🛠️ Quick Start

### 🔧 Prerequisites

- [Elixir](https://elixir-lang.org/install.html)
- [FRED API Key](https://fred.stlouisfed.org/docs/api/api_key.html)

### ⚡ Setup (Elixir)

```bash
git clone https://github.com/YOUR_USERNAME/liquidity_macro_interpreter.git
cd liquidity_macro_interpreter
mix deps.get
