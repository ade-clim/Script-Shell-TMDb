#/bin/bash
. api.sh
export DISPLAY=:0

#recherche des films populaires du moment
function populaires_film() {

  echo "Téléchargement en cours..."
  wget -q "${url}movie/popular?language=${language}&api_key=${key}" -O - > ../Json/"recherche_populaire_film.json"
  page_html "recherche_populaire_film" "film_populaire"
}

#recherche des série tv populaires du moment
function populaires_tv() {

  echo "Téléchargement en cours..."
  wget -q "${url}tv/popular?language=${language}&api_key=${key}" -O - > ../Json/"recherche_populaire_tv.json"
  page_html_populaire_tv "recherche_populaire_tv" "tv_populaire"
}

#recherche des acteur populaire du moments
function populaires_people() {

  echo "Téléchargement en cours..."
  wget -q "${url}person/popular?language=${language}&api_key=${key}" -O - > ../Json/"recherche_populaire_people.json"
  page_html_people "recherche_populaire_people" "people_populaire"
}