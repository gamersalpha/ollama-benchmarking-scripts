Ollama Benchmark Suite
=======================

A simple, cross-platform tool to benchmark Ollama model performance on Windows and Linux (Debian).
Use custom prompts, time the responses, and export everything to a clean `.csv` file for easy comparison — then visualize your results!

Features
--------

- ✅ Benchmark CPU or GPU inference speed
- ✅ Works on Windows (PowerShell) and Linux (bash)
- ✅ Supports multiple prompts
- ✅ Automatically pulls models if missing
- ✅ Exports .csv logs per machine
- ✅ Compare results across machines
- ✅ Plot graphs from results using Python

Requirements
------------

- Ollama installed: https://ollama.com
- Python 3
- matplotlib (see requirements.txt)
- Internet connection (for model download)

To install Python requirements:

    pip install -r requirements.txt

Usage
-----

▶ On Windows:

    git clone https://github.com/gamersalpha/ollama-benchmarking-scripts.git
    cd ollama-benchmarking-scripts
    ./ollama-bench.ps1

🐧 On Linux / Debian:

    git clone https://github.com/gamersalpha/ollama-benchmarking-scripts.git
    cd ollama-benchmarking-scripts
    chmod +x ollama-bench.sh
    ./ollama-bench.sh

Visualisation
-------------

➤ Graphe simple (1 machine) :

    python graph.py

➤ Comparaison multi-machines :

    python graph_all.py

This compares all CSVs matching ollama_bench_*.csv in the directory and builds a multi-bar chart of response times per prompt.

Project Structure
-----------------

    ollama-bench.ps1      → Benchmark script for Windows (PowerShell)
    ollama-bench.sh       → Benchmark script for Debian/Linux
    graph.py              → Plot benchmark results for one machine
    graph_all.py          → Compare benchmark results across multiple machines
    requirements.txt      → Python dependencies (only matplotlib)
    README.md             → Project documentation

Preview
-------

(Add screenshot of graph here once available)

Example placeholder:

    ![Benchmark graph preview](assets/preview.png)

Contributing
------------

Feel free to submit PRs to:
- Add new features
- Support more OS (macOS, Arch, etc.)
- Improve the output formatting / charting
- Add automatic hardware specs summary

License
-------

MIT — use freely and make it better!
