# 🧮 Liquidity Macro Interpreter

**Open-source macro intelligence tool that decodes U.S. liquidity flows into actionable signals.**
Built using Elixir/Phoenix (with Ruby CLI companion), this project helps investors, analysts, and learners interpret key liquidity datapoints like:

* 🏦️ Fed Balance Sheet (WALCL)
* 💰 Treasury General Account (TGA)
* 🏦 Reverse Repo Facility (RRP)
* 💧 Net Liquidity = Fed − TGA − RRP
* 📈 More: M2, Bank Credit, SOFR, SOMA, and others

---

## 🚀 Features

* CLI or Web UI: interpret raw liquidity data and classify macro regimes
* Auto-computed Net Liquidity and WoW % change
* Weekly historical tracking with export
* Optional user annotations, email reports, and premium tier (Stripe)
* Deployable to Fly.io / run as local script / Replit-compatible

---

## 🛠️ Quick Start

### 🔧 Prerequisites

* [Elixir](https://elixir-lang.org/install.html)
* [FRED API Key](https://fred.stlouisfed.org/docs/api/api_key.html)

### ⚡ Setup (Elixir)

```bash
git clone https://github.com/YOUR_USERNAME/liquidity_macro_interpreter.git
cd liquidity_macro_interpreter
mix deps.get
```

Set your API key:

```bash
export FRED_API_KEY=your_key_here
```

Run:

```bash
mix run
```

---

### 💻 CLI Option (Ruby)

```bash
cd scripts/
ruby tracker_cli.rb
```

The CLI will ask you whether to fetch just core metrics (Fed/TGA/RRP) or the full 10-metric dashboard.

---

## 📁 Project Structure

* `lib/` — core modules: fetcher, metrics, interpreter, reports
* `scripts/` — standalone CLI Ruby tracker
* `test/` — unit tests for calculations
* `config/` — app/env configuration

---

## 🔪 Example Output

```
🤮 LIQUIDITY TRACKER (2025-11-28)
Fed Total Assets (WALCL): ∆ +$12B (+0.14%)
TGA (DTNTAC): ∆ -$8B (↓)
RRP (RRPONTSYD): ∆ -$5B (↓)

💧 Net Liquidity: ↑ +$25B WoW
Regime: Bullish Liquidity Regime
```

---

## 🔒 License

MIT — free to use, modify, fork, and contribute!

## 🙌 Contribute

Issues, ideas, or bugfixes? PRs welcome. Roadmap includes:

* 📊 LiveView chart overlays
* 📨 Email/Telegram/Discord exports
* 🗕️ Calendar annotations + alerts

---

Built with ❤️ by macro nerds for macro nerds.
