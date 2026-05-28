# Python Walkthrough — Practical GenAI & RAG Engineering

Hands-on workspace for **AI Pioneers — Practical GenAI & RAG Engineering** (8 weeks). You will build Python fundamentals first, then progress through prompting, LangChain, embeddings, RAG pipelines, evaluation, agents, and a capstone project.

## What is in this repo?

| Path | Purpose |
|------|---------|
| `Python_Basics_Week1_Session1.ipynb` | Day 1 live walkthrough — variables, collections, loops, functions, files, mini log analyser |
| `Week-01` … `Week-08` | Weekly notebooks, sample data, and `requirements.txt` per module |
| `course-guides/` | Session-by-session instructor guides (60 min + 30 min Q&A outline) |
| `main.py` | Small entry-point script (`uv run main.py`) |
| `pyproject.toml` | Project metadata and Python version (`>=3.13`) managed by [uv](https://docs.astral.sh/uv/) |

**Course flow (high level):**

1. **Weeks 1–2** — Python basics, first API call, prompt engineering  
2. **Weeks 3–4** — LangChain, embeddings, Chroma vector store  
3. **Weeks 5–6** — RAG pipeline, retrieval evaluation  
4. **Weeks 7–8** — Agents, Streamlit deployment, capstone  

See `course-guides/README.md` for the full week-by-week guide index.

---

## Prerequisites

- **Python 3.13+** (matches `pyproject.toml`)
- **[uv](https://docs.astral.sh/uv/getting-started/installation/)** — fast Python package and virtual-environment manager
### conda, pip, poetry
### Install uv (one-time)

**Windows (PowerShell):**

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

**macOS / Linux:**

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Verify:

```powershell
uv --version
```

---

## Step-by-step: create and use the environment

Run these commands from the **repository root** (`PythonWalkThrough`).

### 1. Clone and open the project

```powershell
cd c:\Session\1-Day-16May26-Class\PythonWalkThrough
```

### 2. Create a virtual environment

```powershell
uv venv
```

This creates `.venv` in the project folder (already listed in `.gitignore`).

### 3. Activate the environment (optional)

**Windows (PowerShell):**

```powershell
.\.venv\Scripts\Activate.ps1
```

**macOS / Linux:**

```bash
source .venv/bin/activate
```

You can also skip activation and prefix commands with `uv run` (see below).

### 4. Install base tooling for notebooks

Jupyter is used for all walkthrough notebooks:

```powershell
uv pip install jupyter ipykernel
```

Register the kernel so VS Code / Cursor can select it:

```powershell
uv run python -m ipykernel install --user --name=pythonwalkthrough --display-name "Python Walkthrough (.venv)"
```

### 5. Install dependencies for the week you are on

Each week folder has its own `requirements.txt`. Example for Week 1:

```powershell
uv pip install -r Week-01\requirements.txt
```

# Install Ollama
```powershell
curl -fsSL https://ollama.com/install.sh | sh
```
# Pull required models
```powershell
ollama pull llama3.1:8b          # LLM for answer generation (~2 GB)
```
# Start Ollama server
```powershell
ollama serve &
```
# Verify models are running
```powershell
curl http://localhost:11434/api/tags
```
### 6. Configure API keys (Week 1 Session 2 onward)

Create a `.env` file in the repo root (never commit it):

```env
ANTHROPIC_API_KEY=your_key_here
```

Week notebooks load this via `python-dotenv` where applicable.

### 7. Run code

**Script:**

```powershell
uv run python main.py
```

**Jupyter Lab:**

```powershell
uv run jupyter lab
```

**Single notebook in VS Code / Cursor:**

1. Open e.g. `Python_Basics_Week1_Session1.ipynb` or `Week-01\week01_python_basics_log_analyser.ipynb`
2. Choose kernel **Python Walkthrough (.venv)** (or the interpreter at `.venv\Scripts\python.exe`)
3. Run cells top to bottom

---

## Recommended workflow by week

| Week | Start here | Notes |
|------|------------|--------|
| 1 | `Python_Basics_Week1_Session1.ipynb` then `Week-01\week01_python_basics_log_analyser.ipynb` | `uv pip install -r Week-01\requirements.txt`; set `ANTHROPIC_API_KEY` before API cells |


Each `Week-XX\README.md` has week-specific pointers.

---

## Useful uv commands

| Task | Command |
|------|---------|
| Create venv | `uv venv` |
| Install a package | `uv pip install <package>` |
| Install from requirements | `uv pip install -r Week-01\requirements.txt` |
| Run without activating | `uv run python main.py` |
| List installed packages | `uv pip list` |
| Sync from `pyproject.toml` (when deps are added there) | `uv sync` |

---

## Troubleshooting

- **Wrong Python version** — `uv python install 3.13` then `uv venv --python 3.13`
- **Kernel not found in IDE** — Re-run the `ipykernel install` step in section 4
- **Import errors in a week notebook** — Install that week’s `requirements.txt`
- **API errors** — Confirm `.env` exists and `ANTHROPIC_API_KEY` is set; restart the notebook kernel after changing `.env`

---

## Git: connect to GitHub and push

Remote repository (private):

**https://github.com/mayankchugh-learning/AI-pioneers-Cohort1**

### First-time setup (from this folder)

If Git is not initialized yet:

```powershell
cd c:\Session\1-Day-16May26-Class\PythonWalkThrough
git init
git branch -M main
```

Stage everything (respects `.gitignore` — skips `.venv`, `.env`, etc.):

```powershell
git add .
git status
```

Create the first commit:

```powershell
git commit -m "Initial commit: 8-week GenAI course workspace with notebooks and uv setup"
```

Add the GitHub remote and push:

```powershell
git remote add origin https://github.com/mayankchugh-learning/AI-pioneers-Cohort1.git
git push -u origin main
```

If `git remote add` fails because `origin` already exists:

```powershell
git remote set-url origin https://github.com/mayankchugh-learning/AI-pioneers-Cohort1.git
```

### If GitHub was created with License + .gitignore (empty repo)

GitHub’s first commit only contains `LICENSE` and `.gitignore`. Merge it, then push:

```powershell
git pull origin main --allow-unrelated-histories --no-edit
git push -u origin main
```

Resolve any merge conflicts in `.gitignore` if prompted, then `git add .` and `git commit` before pushing again.

### Clone on another machine (after push)

```powershell
git clone https://github.com/mayankchugh-learning/AI-pioneers-Cohort1.git
cd AI-pioneers-Cohort1
uv venv
uv pip install jupyter ipykernel
```

Use **GitHub CLI** or a **Personal Access Token** when Git asks for credentials on a private repo.

### Day-to-day Git

```powershell
git status
git add .
git commit -m "Describe your change"
git push
```

---

## Git hygiene

Do not commit `.venv`, `.env`, local Chroma databases (`**/chroma_db/`), or generated logs such as `sample.log`. These are already in `.gitignore`.
