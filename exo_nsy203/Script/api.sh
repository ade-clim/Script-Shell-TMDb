#/bin/bash

url="https://api.themoviedb.org/3/"
key="949eded573b4f6b1ebc8cace380f1533"
language="fr-FR"

function telechargement_fichier() {

  if [ $# -lt 2 ]; then
    echo "La fonction nécessite au moins deux paramètres"
    exit 1
  fi

  nom_fichier=${2}-data.json

  echo "Téléchargement des informations en cours..."
  case $1 in
  "titre")
    data= wget -q "${url}search/movie?api_key=${key}&language=${language}&query=${2}" -O "${nom_fichier}"
    ;;
  "section")
    wget -q ${url}"section="${2} -O ${nom_fichier}
    ;;
  "distance")
    wget -q ${url}"lat="${2}"&lon="${3} -O ${nom_fichier}
    ;;
  *)
    echo "Le 1er paramètre à saisir n'est pas conforme."
    ;;
  esac

}

# Objectif : retourne le nombre de résultats d'un fichier json
function nombre_resultats() {
  nb_resultats=$(cat ${nom_fichier} | jq '.nb_resultats')
  if [ ${nb_resultats} -eq 0 ]; then
    echo "0"
  else
    echo "${nb_resultats}"
  fi
}