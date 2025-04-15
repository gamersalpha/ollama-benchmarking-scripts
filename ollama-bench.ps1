# Configuration
$model = "mistral:7b-instruct"
$prompts = @(
    "Quelle est la capitale de l'Australie ?",
    "Qui a écrit Les Misérables ?",
    "Quelle est la racine carrée de 144 ?",
    "Décris-moi le fonctionnement d’un moteur diesel en une phrase.",
    "Comment dire 'bonjour' en japonais ?"
)
$outputCsv = "ollama_bench_$(hostname).csv"

# Fonction pour vérifier si le modèle est installé
function Is-ModelInstalled {
    param (
        [string]$modelName
    )
    $models = ollama list
    return $models -match $modelName
}

# Vérification / téléchargement du modèle
if (-not (Is-ModelInstalled -modelName $model)) {
    Write-Host "Modèle $model non trouvé. Téléchargement en cours..."
    ollama pull $model
}

# En-tête du fichier CSV
"Machine,Modèle,Prompt,Temps (s),Réponse" | Out-File -Encoding UTF8 -FilePath $outputCsv

# Boucle sur les prompts
foreach ($prompt in $prompts) {
    Write-Host "`n⏳ Benchmark avec prompt : $prompt"

    $startTime = Get-Date

    $response = $prompt | ollama run $model

    $endTime = Get-Date
    $duration = ($endTime - $startTime).TotalSeconds

    # Nettoyage réponse pour le CSV
    $cleanResponse = $response -replace "`r?`n", " " -replace '"', "'"

    # Construction ligne CSV
    $csvLine = """$($env:COMPUTERNAME)"",""$model"",""$prompt"",""$duration"",""$cleanResponse"""
    Add-Content -Path $outputCsv -Value $csvLine

    Write-Host "✅ Fini en $duration secondes"
}

Write-Host "`n🎉 Tous les benchmarks sont terminés."
Write-Host "📄 Résultats dans : $outputCsv"
