#/bin/bash
. api.sh
. html.sh


#recherche des films par titre
function recherche_film_titre() {

  read -p "Saisir le titre du film: " titre_film
  new_title=` echo $titre_film| sed -e " s/\ //g" `

  echo "Téléchargement en cours..."

  wget -q "${url}search/movie?query=${titre_film}&language=${language}&api_key=${key}" -O - > ../Json/"recherche_film_titre_${new_title}.json"
  page_html "recherche_film_titre_${new_title}" ${new_title}
}

#recherche des séries par titre
function recherche_serie_titre() {

  read -p "Saisir le titre de la série: " titre_serie
  new_title=` echo $titre_serie| sed -e " s/\ //g" `

  echo "Téléchargement en cours..."

  wget -q "${url}search/tv?query=${titre_serie}&language=${language}&api_key=${key}" -O - > ../Json/"recherche_serie_titre_${new_title}.json"
  page_html_recherche_serie "recherche_serie_titre_${new_title}" ${new_title}
}
