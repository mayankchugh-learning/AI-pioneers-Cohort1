# Week 3 — AI APIs & LangChain intro

**Goal:** Call a local LLM like any other API, manage multi-turn chat history, then build a **memory chatbot** with LangChain and Ollama.

---

## Materials

| File | Role |
|------|------|
| `week03_langchain_memory_chatbot_full_ollama.ipynb` | **Main session** — Ollama APIs, conversation history, LangChain basics, memory chatbot, lab |
| `access_diff_llm_mmllm.ipynb` | **Optional / extra practice** — LangChain clients for many providers (text, vision, audio) |
| `dogs.png` | Sample image for vision demos in `access_diff_llm_mmllm.ipynb` |
| `audio.mp3` | Sample audio for speech / audio→text demos in `access_diff_llm_mmllm.ipynb` |

---

## Before start

1. **Ollama** installed and running: [ollama.com/download](https://ollama.com/download/windows)
2. Pull a chat model (example):

   ```powershell
   ollama pull llama3.1:8b
   ollama serve
   ```

3. From the **repo root**, use the course virtual environment (see root `README.md` for `uv venv`, Jupyter kernel, and `.env` setup).

`.env` at repo root:

```env
OLLAMA_MODEL=llama3.1:8b
OLLAMA_HOST=http://localhost:11434
```

The main notebook also runs `%pip install` for `langchain`, `langchain-ollama`, `langchain-core`, and `ollama` if your kernel is missing them.

---

## Run the main notebook

1. Open `week03_langchain_memory_chatbot_full_ollama.ipynb`
2. Select your course kernel (e.g. **AI-pioneers-Cohort1 (.venv)**)
3. Run cells **top to bottom**

| Section | Topic |
|---------|--------|
| 0 | Install dependencies |
| 1 | Ollama API — chat, system prompt, streaming |
| 2 | Multi-turn history (manual list + context trimming) |
| 3 | LangChain fundamentals (`prompt \| llm \| parser`) |
| 4 | Build a memory chatbot with LangChain |
| 5 | Lab — customise for your domain |
| 6 | Key concepts & deliverable checklist |

**Checkpoint idea:** After Section 2, the model only “remembers” what you send in `messages[]` each call — the API is stateless; you own session state.

---

## Optional: multimodal provider notebook

Open `access_diff_llm_mmllm.ipynb` when you want to compare **cloud and local** models through LangChain (OpenAI, Anthropic, Groq, OpenRouter, Hugging Face, Gemini, Ollama).

- Run sections **in order**; skip blocks for providers you do not have keys for.
- Put API keys in repo-root `.env` (examples):

  | Provider | Env variable |
  |----------|----------------|
  | OpenAI | `OPENAI_API_KEY` |
  | Anthropic | `ANTHROPIC_API_KEY` |
  | Groq | `GROQ_API_KEY` |
  | OpenRouter | `OPENROUTER_API_KEY` |
  | Hugging Face | `HUGGINGFACEHUB_API_TOKEN` |
  | Gemini | `GOOGLE_API_KEY` |

- Extra packages (only if you run those sections):

  ```powershell
  uv pip install langchain-openai langchain-anthropic langchain-groq langchain-openrouter langchain-huggingface langchain-google-genai langchain-ollama python-dotenv gTTS google-genai
  ```

- For Ollama cells: start `ollama serve` first or you will see connection errors.

**Modality map (high level):**

| Input | Output | Covered in optional notebook |
|-------|--------|------------------------------|
| Text | Text | Yes — all providers |
| Text | Image | OpenAI |
| Image | Text | OpenAI, Groq, Gemini |
| Text | Audio | Gemini TTS |
| Audio | Text | Gemini (uses `audio.mp3`) |

---

## Prompt engineering (revision from Week 2)

Useful components in a strong prompt:

1. **Role** — who the model is  
2. **Task** — what to do  
3. **Context** — background facts  
4. **Constraints** — length, tone, must-nots  
5. **Output format** — bullets, JSON, table, etc.

Common techniques: zero-shot, one-shot, few-shot, chain-of-thought, explicit instructions. You will apply these in the Section 5 lab system prompt.

---

## Reference links

**LangChain ecosystem**

| Resource | URL |
|----------|-----|
| LangChain (code) | https://github.com/langchain-ai/langchain |
| LangGraph (code) | https://github.com/langchain-ai/langgraph |
| LangChain (docs) | https://python.langchain.com/ |
| LangSmith (docs) | https://docs.smith.langchain.com/ |

**Provider docs & keys**

| Provider | Docs | Get API key |
|----------|------|-------------|
| OpenAI | https://platform.openai.com/docs/ | https://platform.openai.com/api-keys |
| Anthropic | https://docs.anthropic.com/ | https://console.anthropic.com/ |
| Groq | https://console.groq.com/docs | https://console.groq.com/ |
| OpenRouter | https://openrouter.ai/docs | https://openrouter.ai/keys |
| Hugging Face | https://huggingface.co/docs | https://huggingface.co/settings/tokens |
| Gemini | https://ai.google.dev/gemini-api/docs | https://aistudio.google.com/apikey |
| Ollama | https://github.com/ollama/ollama | Local install — no cloud key |

---

## Ollama CLI (handy)

```powershell
ollama --version
ollama serve
ollama pull llama3.1:8b
ollama run llama3.1:8b
ollama list
ollama ps
ollama stop llama3.1:8b