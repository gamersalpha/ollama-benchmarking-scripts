import csv
import os
import matplotlib.pyplot as plt
from collections import defaultdict

# 📂 Tous les fichiers CSV dans le dossier courant
csv_files = [f for f in os.listdir('.') if f.startswith('ollama_bench_') and f.endswith('.csv')]

if not csv_files:
    print("Aucun fichier CSV trouvé.")
    exit(1)

# 📦 Données : {prompt: {machine: temps}}
data = defaultdict(dict)

# 📥 Chargement des CSV
for file in csv_files:
    with open(file, encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            prompt = row["Prompt"]
            machine = row["Machine"]
            time = float(row["Temps (s)"])
            data[prompt][machine] = time

# 🖼️ Création du graphique
prompts = list(data.keys())
machines = sorted({m for v in data.values() for m in v.keys()})

x = range(len(prompts))
bar_width = 0.15

plt.figure(figsize=(12, 6))

for i, machine in enumerate(machines):
    times = [data[p].get(machine, 0) for p in prompts]
    offset = [xi + i * bar_width for xi in x]
    plt.bar(offset, times, width=bar_width, label=machine)

plt.xlabel("Prompts")
plt.ylabel("Temps (s)")
plt.title("Comparaison des temps de réponse Ollama")
plt.xticks([xi + bar_width * (len(machines)-1)/2 for xi in x], prompts, rotation=45, ha='right')
plt.legend()
plt.grid(axis='y', linestyle='--', alpha=0.5)
plt.tight_layout()

plt.show()
