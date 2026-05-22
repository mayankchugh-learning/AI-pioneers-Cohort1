# Week 2

Open `week02_prompt_engineering-ollama.ipynb`. Requires [Ollama](https://ollama.com) running locally with a model (e.g. `ollama pull llama3.1:8b`). Optional `.env`: `OLLAMA_MODEL`, `OLLAMA_HOST`.

## Run in Cursor

Select kernel **Week-02 .venv (3.13.9)** (`week02-venv`), then run cells top to bottom.

## Run in browser (Jupyter)

If `jupyter notebook` crashes with `Permission denied` on `AppData\Roaming\jupyter\runtime`, use the helper script (uses a project-local runtime folder):

```powershell
cd C:\Session\AI-pioneers-Cohort1\Week-02
.\start-notebook.ps1
```

Or set the env var manually:

```powershell
$env:JUPYTER_RUNTIME_DIR = "C:\Session\AI-pioneers-Cohort1\Week-02\.jupyter-runtime"
.\.venv\Scripts\python.exe -m jupyter notebook week02_prompt_engineering-ollama.ipynb
```