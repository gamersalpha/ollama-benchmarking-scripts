import csv
import matplotlib.pyplot as plt

# Nom du fichier CSV généré par le benchmark
CSV_FILE = "ollama_bench_DESKTOP-47JH04L.csv"  # adapte-le à ton hostname si besoin

# Données à remplir
prompts = []
times = []

# Lecture du CSV
with open(CSV_FILE, encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for row in reader:
        prompts.append(row["Prompt"])
        times.append(float(row["Temps (s)"]))

# Création du graphique
plt.figure(figsize=(10, 6))
bars = plt.barh(prompts, times)

plt.xlabel("Temps de réponse (secondes)")
plt.ylabel("Prompt")
plt.title("Temps d'inférence par prompt (Ollama Benchmark)")
plt.grid(axis='x', linestyle='--', alpha=0.6)
plt.tight_layout()

# Affichage
plt.show()
