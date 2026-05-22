# Start Jupyter Notebook using a project-local runtime folder (avoids Roaming permission errors)
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$runtimeDir = Join-Path $PSScriptRoot ".jupyter-runtime"
New-Item -ItemType Directory -Force -Path $runtimeDir | Out-Null

$env:JUPYTER_RUNTIME_DIR = $runtimeDir
Write-Host "JUPYTER_RUNTIME_DIR=$runtimeDir"
Write-Host "Starting notebook... (Ctrl+C to stop)"

& ".\.venv\Scripts\python.exe" -m jupyter notebook "week02_prompt_engineering-ollama.ipynb"
