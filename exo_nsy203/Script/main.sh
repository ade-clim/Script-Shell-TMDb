#/bin/bash
. nouveautes.sh
. recherche.sh
. populaires.sh
. color.sh
export DISPLAY=:0

function menu_recherche() {

  echo -e "${rose}"
  echo " .___  ___.   ______   ____    ____  __   _______          _______  .______"
  echo " |   \/   |  /  __  \  \   \  /   / |  | |   ____|        |       \ |   _  \ "
  echo " |  \  /  | |  |  |  |  \   \/   /  |  | |  |__    ______ |  .--.  ||  |_)  |"
  echo " |  |\/|  | |  |  |  |   \      /   |  | |   __|  |______||  |  |  ||   _  <"
  echo " |  |  |  | |  °--°  |    \    /    |  | |  |____         |  °--°  ||  |_)  |"
  echo " |__|  |__|  \______/      \__/     |__| |_______|        |_______/ |______/"

  echo -e "${orange}"

  echo "Menu"
  echo -e "${orange}""---------------------------------------------"
  echo -e "${violetclair}""1 - Recherche"
  echo -e "${vertfonce}""2 - Les plus populaires du moment"
  echo -e "${bleuclair}""3 - En ce moment"
  echo -e "${blanc}""4 - Quitter"
  echo -e "${orange}""---------------------------------------------"
  echo
  echo -e "${neutre}" "Veuillez saisir votre choix : "
  # shellcheck disable=SC2162
  read choix
}

function menu_film() {

  echo -e "${violetclair}""Menu Recherche: "
  echo "---------------------------------------------"
  echo "1 - Recherche film"
  echo "2 - Recherche serie"
  echo "3 - Retour"
  echo "---------------------------------------------"
  echo
  echo -e "${neutre}" "Veuillez saisir votre choix : "
  # shellcheck disable=SC2162
  read choix_menu_film
}

function menu_populaires() {

  echo -e "${vertfonce}""Menu Populaires: "
  echo "---------------------------------------------"
  echo "1 - Film"
  echo "2 - Tv"
  echo "3 - People"
  echo "4 - Retour"
  echo "---------------------------------------------"
  echo
  echo -e ${neutre}"Veuillez saisir votre choix : "
  read choix_menu_populaire
}

function menu_moments() {

  echo -e ${bleuclair}"Menu du moment: "
  echo "---------------------------------------------"
  echo "1 - Film"
  echo "2 - Serie"
  echo "3 - Retour"
  echo "---------------------------------------------"
  echo
  echo -e ${neutre}"Veuillez saisir votre choix : "
  read choix_menu_moments
}

function menu_principal() {
  continuation=0
  while [ ${continuation} -eq 0 ]; do
    retour=0
    menu_recherche
    case ${choix} in
    1)
      continue_menu_film=0
      menu_film
      while [ ${continue_menu_film} -eq 0 ]; do
        case ${choix_menu_film} in
        1)
          recherche_film_titre
          break
          ;;
        2)
          recherche_serie_titre
          break
          ;;
        3)
          retour=1
          break
          ;;
        *)
          echo "Veuillez saisir un numéro valide !"
          menu_film
          ;;
        esac

      done
      ;;

    #MENU LES PLUS POPULAIRES
    2)
      continue_menu_populaires=0
      menu_populaires
      while [ ${continue_menu_populaires} -eq 0 ]; do
        case ${choix_menu_populaire} in
        1)
          populaires_film
          break
          ;;
        2)
          populaires_tv
          break
          ;;
        3)
          populaires_people
          break
          ;;
        4)
          retour=1
          break
          ;;
        *)
          echo "Veuillez saisir un numéro valide !"
          ;;
        esac

      done
      ;;

    #MENU DU MOMENT
    3)
      continue_menu_moments=0
      menu_moments
      while [ ${continue_menu_moments} -eq 0 ]; do
        case ${choix_menu_moments} in
        1)
          moment_film
          break
          ;;
        2)
          moment_serie
          break
          ;;
        3)
          retour=1
          break
          ;;
        *)
          echo "Veuillez saisir un numéro valide !"
          ;;
        esac

      done
      ;;

    #MENU EXIT
    4)
      echo "Bye bye! "
      continuation=1
      exit 1
      ;;
    *)
      echo "Veuillez saisir un numéro valide !"
      retour=1
      ;;
    esac

    if [ ${retour} -eq 0 ]; then
      read -p "Voulez vous continuez ? [O/n] " continuer

      # shellcheck disable=SC2086
      if ! [ "${continuer}" == "O" ]; then
        continuation=1
        exit 1
      fi
    fi
  done
}

menu_principal
