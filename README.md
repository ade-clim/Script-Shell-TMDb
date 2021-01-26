# Script-Shell-TMDb

Installation :
  - une fois dans le shell :
  - taper le code "git clone https://github.com/ade-clim/Script-Shell-TMDb.git"
      
Ne pas oublier d'installer wget et jq
  - sudo apt install wget
  - sudo apt install jq
  
Ececution :
  - Une fois dans le dossier Script
  - taper le code "bash Script.sh" ou "sh.Script.sh"

Le dossier est fourni avec un ensemble de dossier et de fichier necessaire au bon fonctionnement de l'application.
Ne surtout pas supprimer le dossier Mes_films qui sert de dossier de reception pour les pages html

Modification futur du projet:
- Ajout d'un script de création du dossier Mes_films si celui la n'existe pas
- Supprimer les objets null du JSON pour affichage html
- Gerer un systeme de pagination sur la page html
- Optimiser la page html.sh
