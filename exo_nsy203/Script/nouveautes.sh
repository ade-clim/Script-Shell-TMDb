#/bin/bash
. api.sh
export DISPLAY=:0

#recherche des films du moment
function moment_film() {

  echo "Téléchargement en cours..."
  wget -q "${url}movie/now_playing?region=FR&language=${language}&api_key=${key}" -O - > ../Json/"moment_film.json"
  page_html "moment_film" "moment_film"
}

#recherche des séries du moment
function moment_serie() {

  echo "Téléchargement en cours..."
  wget -q "${url}tv/on_the_air?language=${language}&api_key=${key}" -O - > ../Json/"moment_serie.json"
  page_html_moment_serie "moment_serie" "moment_serie"
}