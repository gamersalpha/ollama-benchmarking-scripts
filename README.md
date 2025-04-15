Ollama Benchmark Suite
=======================

A simple, cross-platform tool to benchmark Ollama model performance on Windows and Linux (Debian).
Use custom prompts, time the responses, and export everything to a clean `.csv` file for easy comparison.

Features
--------

- ✅ Benchmark CPU or GPU inference speed
- ✅ Works on Windows (PowerShell) and Linux/Debian (bash)
- ✅ Supports multiple prompts
- ✅ Generates structured `.csv` logs with:
  - Hostname
  - Model name
  - Prompt
  - Time taken
  - Response
- ✅ Automatically pulls models if missing

Requirements
------------

- Ollama installed: https://ollama.com
- Internet connection (to pull models if needed)
- PowerShell 5+ on Windows
- Bash on Linux

Usage
-----

### On Windows

1. Clone this repo:

    git clone https://github.com/your-username/ollama-benchmark-suite.git
    cd ollama-benchmark-suite

2. Run the PowerShell benchmark:

    ./ollama-bench.ps1

### On Debian/Linux

1. Clone this repo:

    git clone https://github.com/your-username/ollama-benchmark-suite.git
    cd ollama-benchmark-suite

2. Make the script executable:

    chmod +x ollama-bench.sh

3. Run the benchmark:

    ./ollama-bench.sh

Output Example
--------------

The result is a `.csv` file like:

    Machine,Modèle,Prompt,Temps (s),Réponse
    DESKTOP-01,mistral:7b-instruct,Quelle est la capitale de l'Australie ?,1.24,La capitale est Canberra.
    DESKTOP-01,mistral:7b-instruct,Qui a écrit Les Misérables ?,1.75,Victor Hugo.

Coming Soon
-----------

- Auto-graph generation from CSV (Python)
- Model size vs speed chart
- Hardware info summary
- LLM quality scoring (BLEU, Rouge...)

Contributing
------------

Pull requests are welcome! Feel free to:
- Add new features
- Add support for other OS (macOS, Arch, etc.)
- Improve formatting or output

License
-------

MIT – use freely and improve it!
