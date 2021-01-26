# shellcheck disable=SC1113
#/bin/bash
. api.sh

#recupere le JSON et format les informations pour un affichage html
function page_html (){

  if [ $# -lt 2 ]
  then
    echo "test"
    exit 1
  fi

  length=$(cat ../Json/${1}.json | jq '.results | length')


  #va permettre de modifier le dossier de sortie des fichiers html
  case $1 in
      "recherche_film_titre_${2}")
        path=../Mes_films/Recherche/Film/
        ;;
      "recherche_populaire_film")
        path=../Mes_films/Populaire/Films/
        ;;
      "recherche_populaire_tv")
        path=../Mes_films/Populaire/Tv/
        ;;
      "recherche_populaire_people")
        path=../Mes_films/Populaire/People/
        ;;
      "recherche_serie_titre_${2}")
        path=../Mes_films/Recherche/Serie/
        ;;
      "moment_film")
        path=../Mes_films/Moment/Film/
        ;;
      "moment_serie")
        path=../Mes_films/Moment/Serie/
        ;;

  esac

  {
    echo "<html>"
    echo "<head>"
    echo "<link rel='stylesheet' href='../../../Css/style.css'> </link>"
    echo "</head>"
    echo "<body>"
    echo "<div class='container'>"
    echo "<h1>${2}</h1>"

    for i in $(seq 0 $length)
    do
      image=$(cat ../Json/${1}.json | jq -r '.results['$i'] | .poster_path')
      title=$(cat ../Json/${1}.json | jq -r '.results['$i']| .original_title')
      overview=$(cat ../Json/${1}.json | jq -r '.results['$i'] | .overview')
      echo "<img src="https://image.tmdb.org/t/p/w342${image}" />"
      echo "<h2>"
      echo ${title}
      echo "</h2>"
      echo "<p>"
      echo ${overview}
      echo "</p>"
    done
    echo "</div>"
    echo "</body>"
    echo "</html>"

  } > ${path}${2}.html

  echo "Téléchargement fini"
  read -p "voulez vous executer le navigateur [O/n] ?" choix_execution

  if [ "${choix_execution}" = "O" ]
  then
    firefox ${path}${2}.html
  fi
}

#recupere le JSON de l'acteur et fait une requete sur l'id pour recuperer sa biographie
function page_html_people (){

  if [ $# -lt 2 ]
  then
    echo "test"
    exit 1
  fi

  length=$(cat ../Json/${1}.json | jq '.results | length')

  {
    echo "<html>"
    echo "<head>"
    echo "<link rel='stylesheet' href='../../../Css/style.css'> </link>"
    echo "</head>"
    echo "<body>"
    echo "<div class='container'>"
    echo "<h1>${2}</h1>"

    for i in $(seq 0 $length)
    do
      image=$(cat ../Json/${1}.json | jq -r '.results['$i'] | .profile_path')
      title=$(cat ../Json/${1}.json | jq -r '.results['$i']| .name')
      id=$(cat ../Json/${1}.json | jq -r '.results['$i']| .id')
      acteur=$(wget -q "${url}person/${id}?language=${language}&api_key=${key}" -O - > "../Json/biographie.json")
      biographie=$(cat ../Json/biographie.json | jq -r '.biography')
      echo "<img src="https://image.tmdb.org/t/p/w342${image}" />"
      echo "<h2>"
      echo ${title}
      echo "</h2>"
      echo "<p>"
      echo ${biographie}
      echo "</p>"
    done
    echo "</div>"
    echo "</body>"
    echo "</html>"

  } > ../Mes_films/Populaire/People/${2}.html

  echo "Téléchargement fini"
  read -p "voulez vous executer le navigateur [O/n] ?" choix_execution

  if [ "${choix_execution}" = "O" ]
  then
    firefox ../Mes_films/Populaire/People/${2}.html
  fi
}

#recupere le JSON de la série populaire et l'affiche en html
function page_html_populaire_tv (){

  if [ $# -lt 2 ]
  then
    echo "test"
    exit 1
  fi

  length=$(cat ../Json/${1}.json | jq '.results | length')

  {
    echo "<html>"
    echo "<head>"
    echo "<link rel='stylesheet' href='../../../Css/style.css'> </link>"
    echo "</head>"
    echo "<body>"
    echo "<div class='container'>"
    echo "<h1>${2}</h1>"

    for i in $(seq 0 $length)
    do
      image=$(cat ../Json/${1}.json | jq -r '.results['$i'] | .poster_path')
      title=$(cat ../Json/${1}.json | jq -r '.results['$i']| .name')
      overview=$(cat ../Json/${1}.json | jq -r '.results['$i']| .overview')
      echo "<img src="https://image.tmdb.org/t/p/w342${image}" />"
      echo "<h2>"
      echo ${title}
      echo "</h2>"
      echo "<p>"
      echo ${overview}
      echo "</p>"
    done
    echo "</div>"
    echo "</body>"
    echo "</html>"

  } > ../Mes_films/Populaire/Tv/${2}.html

  echo "Téléchargement fini"
  read -p "voulez vous executer le navigateur [O/n] ?" choix_execution

  if [ "${choix_execution}" = "O" ]
  then
    firefox ../Mes_films/Moment/Tv/${2}.html
  fi
}

#recupere le JSON de la série du moment et l'affiche en html
function page_html_moment_serie (){

  if [ $# -lt 2 ]
  then
    echo "test"
    exit 1
  fi

  length=$(cat ../Json/${1}.json | jq '.results | length')

  {
    echo "<html>"
    echo "<head>"
    echo "<link rel='stylesheet' href='../../../Css/style.css'> </link>"
    echo "</head>"
    echo "<body>"
    echo "<div class='container'>"
    echo "<h1>${2}</h1>"

    for i in $(seq 0 $length)
    do
      image=$(cat ../Json/${1}.json | jq -r '.results['$i'] | .poster_path')
      title=$(cat ../Json/${1}.json | jq -r '.results['$i']| .name')
      overview=$(cat ../Json/${1}.json | jq -r '.results['$i']| .overview')
      echo "<img src="https://image.tmdb.org/t/p/w342${image}" />"
      echo "<h2>"
      echo ${title}
      echo "</h2>"
      echo "<p>"
      echo ${overview}
      echo "</p>"
    done
    echo "</div>"
    echo "</body>"
    echo "</html>"

  } > ../Mes_films/Moment/Serie/${2}.html

  echo "Téléchargement fini"
  read -p "voulez vous executer le navigateur [O/n] ?" choix_execution

  if [ "${choix_execution}" = "O" ]
  then
    firefox ../Mes_films/Moment/Serie/${2}.html
  fi
}

#recupere le JSON de la série recherchée et l'affiche en html
function page_html_recherche_serie (){

  if [ $# -lt 2 ]
  then
    echo "test"
    exit 1
  fi

  length=$(cat ../Json/${1}.json | jq '.results | length')

  {
    echo "<html>"
    echo "<head>"
    echo "<link rel='stylesheet' href='../../../Css/style.css'> </link>"
    echo "</head>"
    echo "<body>"
    echo "<div class='container'>"
    echo "<h1>${2}</h1>"

    for i in $(seq 0 $length)
    do
      image=$(cat ../Json/${1}.json | jq -r '.results['$i'] | .poster_path')
      title=$(cat ../Json/${1}.json | jq -r '.results['$i']| .name')
      overview=$(cat ../Json/${1}.json | jq -r '.results['$i']| .overview')
      echo "<img src="https://image.tmdb.org/t/p/w342${image}" />"
      echo "<h2>"
      echo ${title}
      echo "</h2>"
      echo "<p>"
      echo ${overview}
      echo "</p>"
    done
    echo "</div>"
    echo "</body>"
    echo "</html>"

  } > ../Mes_films/Recherche/Serie/${2}.html

  echo "Téléchargement fini"
  read -p "voulez vous executer le navigateur [O/n] ?" choix_execution

  if [ "${choix_execution}" = "O" ]
  then
    firefox ../Mes_films/Recherche/Serie/${2}.html
  fi
}