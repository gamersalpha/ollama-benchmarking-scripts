#!/bin/bash

# Configuration
MODEL="mistral:7b-instruct"
PROMPTS=(
  "Quelle est la capitale de l'Australie ?"
  "Qui a écrit Les Misérables ?"
  "Quelle est la racine carrée de 144 ?"
  "Décris-moi le fonctionnement d’un moteur diesel en une phrase."
  "Comment dire 'bonjour' en japonais ?"
)
OUTPUT_FILE="ollama_bench_$(hostname).csv"

# Vérifie si le modèle est déjà installé
if ! ollama list | grep -q "$MODEL"; then
  echo "📦 Modèle $MODEL non trouvé, téléchargement..."
  ollama pull "$MODEL"
fi

# Écrit l'en-tête du fichier CSV
echo "Machine,Modèle,Prompt,Temps (s),Réponse" > "$OUTPUT_FILE"

# Boucle sur les prompts
for PROMPT in "${PROMPTS[@]}"; do
  echo "⏳ Benchmark : $PROMPT"

  # Temps de départ
  START=$(date +%s.%N)

  # Exécute le prompt et capture la sortie
  RESPONSE=$(echo "$PROMPT" | ollama run "$MODEL" 2>/dev/null)

  # Temps de fin
  END=$(date +%s.%N)
  DURATION=$(echo "$END - $START" | bc)

  # Nettoie la réponse pour le CSV
  CLEAN_RESPONSE=$(echo "$RESPONSE" | tr '\n' ' ' | sed 's/"/'\''/g')

  # Écrit une ligne dans le CSV
  echo "\"$(hostname)\",\"$MODEL\",\"$PROMPT\",\"$DURATION\",\"$CLEAN_RESPONSE\"" >> "$OUTPUT_FILE"

  echo "✅ Fini en ${DURATION}s"
done

echo -e "\n🎉 Tous les benchmarks sont terminés."
echo "📄 Résultats dans : $OUTPUT_FILE"
