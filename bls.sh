SHELL=$(basename "$SHELL")
if [ "$SHELL" = "zsh" ]; then
  #!/usr/bin/zsh
  echo ""
else
  #!/usr/bin/bash
  echo ""
fi

# ===============================================================================================================================
#   CONFIGURATION GÉNÉRAL
# ===============================================================================================================================
PS3="
  Quel est votre choix : "


# ===============================================================================================================================
#   GESTION DES LOGOS ( fct_show_logo )
# ===============================================================================================================================
source ./config/config_logo.sh
source ./logos/logos_applications.sh
source ./logos/logos_menu.sh
source ./logos/logos_other.sh
source ./logos/logos_principal.sh
source ./logos/logos_technologique.sh

# ===============================================================================================================================
#   PRÉSENTATION
# ===============================================================================================================================
fct_message_intro() { # Description : Affiche un conseil rapide pour une meilleure expérience utilisateur.
  clear

  space
  echo -e "\t\E[36mPour une meilleure expérience utilisateur,\E[0m"
  echo -e "\t\E[36mveuillez lancer le script en mode plein écran.\E[0m"
  echo -e "\t\E[36mPour celà, vous pouvez appuyer sur la touche F11 de votre clavier.\E[0m"
  space
  echo -e "\t\E[92mVeuillez noter que ce script s'exécute correctement avec Bash.\E[0m"
  echo -e "\t\E[91mN'ayant pas de Mac, j'ai eu écho que celui-ci fonctionnait\E[0m"
  echo -e "\t\E[91mtrès mal sur ce dernier.\E[0m"
  space
  echo -e "\t\E[93mEn effet, si vous êtes sur \E[95mDARWIN\E[93m, alors c'est \E[36mZSH\E[93m qui sera utilisé.\E[0m"
  echo -e "\t\E[93mSur \E[95mGNU\Linux\E[93m, alors c'est \E[36mBASH\E[93m qui le sera\E[0m"
  echo -e "\t\E[93met lui est 100% fonctionnelles.\E[0m"
  space
  space
  read -rp "        Veuillez appuyer sur n'importe qu'elle touche pour continuer."
  clear
}
fct_message_presentation() { # Description : Affiche la présentation du script.

  check_os
  if [ "$?" -eq 0 ]; then
    if [ $version_macOS = "Darwin" ]; then
      apple_logo
    else
      ubuntu_logo
    fi
  fi

  space
  echo -e "     \E[91mSi, ci-dessous vous avez une erreur, vous pourrez installer \E[95mlsb-core\E[0m"
  echo -e "     \E[91mSous Linux saisissez: \E[36msudo apt-get install lsb-core -y\E[0m"
  space

  if [ "$(uname -a | cut -d " " -f 1)" = "Darwin" ]; then
    echo -e "     \E[96m 👉 Vous exécutez $(uname -a | cut -d " " -f 1) sur un Mac avec comme version: $(uname -a | cut -d " " -f 3).\E[0m"
  elif [ "$(uname -a | cut -d " " -f 1)" = "Linux" ]; then
    echo -e "     \E[96m 👉 Vous exécutez $(uname -a | head -n 2 | cut -d " " -f 15) avec une distribution $(uname -a | cut -d " " -f 4 | cut -d "-" -f 2) $(lsb_release -a | grep -Ei "Description" | cut -d " " -f 2 | head -n 2).\E[0m"
  fi
  echo -e "\t\033[1m\033[3mSachez que ce script sera actualisé chaque fois que nécessaire.\033[0m"

  space
  read -rp "    Pressez une touche pour poursuivre..."
  clear

  fct_show_logo "bls"
  echo -e "     \E[37mBonjour, \033[1m\E[32m$USER\E[0m"
  echo -e "     \E[37mCe script était au départ un projet personnel qui au fil du temps, est devenu \E[36mBash-L Store\E[37m.\E[0m"
  space
  echo -e "     \E[37mJe m'appelle \E[32mAlain Guillon\E[37m, développeur dit \"\033[1m\E[96mJunior\033[0m\" \E[37mavec tout de même quelques bases très solide.\E[0m"
  echo -e "     \E[37m\E[36mBash-L Store\E[37m, n'a pas pour objectif de monnayer celui-ci.\E[0m"
  space
  echo -e "     \E[37mMa philosophie est simple.\E[0m"
  echo -e "       \E[92mSi je peux apporter une facilitée pour l'installation de tel ou tel programme sur Linux,\E[0m"
  echo -e "       \E[92mj'en serais pleinement satisfait.\E[0m"
  echo -e "       \E[92mje sais que beaucoup ont la crainte de sauter le pas et donc \E[36mBash-L Store\E[92m est là pour les accompagner.\E[0m"

  space
  echo -e "     \E[37mje compte proposer à \E[36mErwan \E[37met \E[36mQuentin\E[37m, deux développeurs chevronné afin de voir\E[0m"
  echo -e "     \E[37ms'ils seraient intéressés pour le diffuser à leur communauté (\E[33mDyma\E[37m).\E[0m"
  echo -e "     \E[37mMais également si j'ai leurs accords pour une diffusion massive sur la toile.\E[0m"
  space
  echo -e "     \E[97mSuite à l'accord d'\E[96mErwan\E[97m, j'ai diffusé celui-ci sur la plateforme \E[95m\033[1mLinkedin\033[0m\E[0m"
  echo -e "     \E[97mafin de permettre à un nombre conséquent d'étudiants de ne plus avoir à craindre \E[0m"
  echo -e "     \E[97md'installer ou de supprimer un quelconque programme sur Linux.\E[0m"
  space

  echo -e "     \E[90m                                                                                                             Page 1/2\E[0m"
  space
  read -rp "   Appuyer sur une touche pour lire la suite ..."
  clear

  fct_show_logo "bls"

  echo -e "     \E[95mSuper-cool, mais alors, que propose \E[36mBash-L Store\E[95m ! ?\E[0m"
  space
  echo -e "     \E[33mVous y trouverez ceci :\E[0m"
  echo -e "         \E[33m1. Des technologies enseignés sur Dyma et plus encore...\E[0m"
  echo -e "         \E[33m2. Des applications réputées, telles que \E[32mblender\E[33m, \E[32mdiscord\E[33m, \E[32mcode\E[33m, \E[32mmysql-workbench-community\E[33m etc...\E[0m"
  echo -e "             \E[37m- (Uniquement des programmes disponibles avec \E[36msnap \E[37mou \E[36mapt\E[37m)\E[0m"
  echo -e "         \E[33m3. Chacune des tâches est automatisée pour installer sa dernière version,\E[0m"
  echo -e "         \E[33m   mais aussi de pouvoir les désinstaller quand vous le souhaite.\E[0m"

  space
  echo -e " \E[37m ---------------------------------------------------------------------------------------------------------------------- \E["
  space

  echo -e "\t\E[34m💬 Si vous le souhaitez, je peux vous parrainer sur la plateforme de Dyma.fr ❗ \E[91mAucune obligation\E[0m"
  echo -e "\t💬 \E[34mVous serez libre de tester leur plateforme pendant 7 jours gratuitement.\E[0m"
  echo -e "\t💬 \E[34mSi ça vous intéresse, \E[93mil vous suffira de maintenir CTRL \E[34met \E[93mde cliquer sur le lien ci-dessous \E[37m:\E[0m"
  space
  echo -e "\t\t\t\t🔗 \033[3m\E[92mhttps://dyma.fr/r/5d52bd274e7aec730eb90fde\033[0m\E[0m"

  space
  echo -e " \E[37m ---------------------------------------------------------------------------------------------------------------------- \E["
  space
  echo -e "✋ \E[95m\tVérification de l'existence du répertoire \"test_install\". Utilisé pour React, Vue, Symfony et Laravel.\E[0m"
  echo "              ... Veuillez patienter, la vérification va duré seulement une seconde. (1s)"
  space
  loading
  sleep 1
  space

  if [ ! -d ./test_install ]; then
    echo -e "\E[95m\tDémarrage de la création du répertoire \"test_install\" afin de tester les installations de Symfony, React ou Vue3. \E[0m"
    mkdir ./test_install
    echo -e "\E[32m\t📁 Répertoire \"test_install\" créé avec succès!\E[0m"
    cd ./test_install || return
  else
    echo -e "\E[91m\t❌ 📁 Le répertoire \"test_install\" existe déjà aucune création n'est nécessaire.\E[0m"
  fi
  space
  echo -e "     \E[90m                                                                                                             Page 2/2\E[0m"
  space
  read -rp "   Appuyer sur une touche pour accéder au menu des technologies ..."
  clear
}

# ===============================================================================================================================
#   UTILITAIRES
# ===============================================================================================================================
check_os() { # Description : Connaître l'OS et le numéro de version du Mac utilisé
  version_macOS=$(uname -a | cut -d " " -f 3)
}
space() { # Description : Création d'un simple space pour plus de lisibilité
  echo ""
}
loading() { # Description : Animation du chargement
  space
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t \t(\E[36m0%\E[0m)\r'
  sleep 0.01
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m=>\E[0m...................] \t(\E[36m5%\E[0m)\r'
  sleep 0.02
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m==>\E[0m..................] \t(\E[36m10%\E[0m)\r'
  sleep 0.03
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m===>\E[0m.................] \t(\E[36m15%\E[0m)\r'
  sleep 0.04
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m====>\E[0m................] \t(\E[36m20%\E[0m)\r'
  sleep 0.05
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m=====>\E[0m...............] \t(\E[36m25%\E[0m)\r'
  sleep 0.06
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m======>\E[0m..............] \t(\E[36m30%\E[0m)\r'
  sleep 0.07
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m=======>\E[0m.............] \t(\E[36m95%\E[0m)\r'
  sleep 0.08
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m========>\E[0m............] \t(\E[36m40%\E[0m)\r'
  sleep 0.09
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m=========>\E[0m...........] \t(\E[36m45%\E[0m)\r'
  sleep 0.10
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m==========>\E[0m..........] \t(\E[36m50%\E[0m)\r'
  sleep 0.11
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m===========>\E[0m.........] \t(\E[36m55%\E[0m)\r'
  sleep 0.12
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m============>\E[0m........] \t(\E[36m60%\E[0m)\r'
  sleep 0.13
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m=============>\E[0m.......] \t(\E[36m65%\E[0m)\r'
  sleep 0.14
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m==============>\E[0m......] \t(\E[36m70%\E[0m)\r'
  sleep 0.15
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m===============>\E[0m.....] \t(\E[36m75%\E[0m)\r'
  sleep 0.16
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m================>\E[0m....] \t(\E[36m80%\E[0m)\r'
  sleep 0.17
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m=================>\E[0m...] \t(\E[36m85%\E[0m)\r'
  sleep 0.18
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m==================>\E[0m..] \t(\E[36m90%\E[0m)\r'
  sleep 0.19
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m===================>\E[0m.] \t(\E[36m95%\E[0m)\r'
  sleep 0.20
  echo -ne ' \t\t\t\t⏳ \E[37mChargement\E[0m :\t[\E[32m====================>\E[0m] \t(\E[36m100%\E[0m)\r'
  space
}
fct_show_exit_program() { # Description : Affiche la page des remerciements avant de quitter.
  clear
  space

  fct_show_logo "merci"

  echo -e "   💬  \033[1m\E[32m$USER\E[0m\E[37m,"
  space
  echo -e "   💬  \E[37mje tiens avant que vous partiez, remercier toutes les personnes qui m'ont soutenu.\E[0m"
  echo -e "   💬  \E[37mpour mener à bien ce programme.\E[0m"
  space
  echo -e "\E[91m 👍 ----------------------------------------------------------------------------------------------------------------- 👍 \E[0m"
  space
  echo -e "   💬  \E[37mMerci à tous mes proches pour m'avoir soutenu\E[0m"
  echo -e "       \E[37m...Même quand je râlais du manque de temps que j'avais pour apprendre une technologie.\E[0m"
  space
  echo -e "   💬  \E[37mMerci à cette fabuleuse plateforme qu'est Dyma pour leurs formations de qualité.\E[0m"
  echo -e "         \E[37m⭐ - Erwan, merci pour nos nombreuses discussions et aide technique que tu m'apportes couramment.\E[0m"
  echo -e "         \E[37m⭐ - Quentin. merci pour toutes les vidéos que je bouffe quotidiennement.\E[0m"
  echo -e "         \E[37m     J'apprends tellement grâce à celles-ci, ainsi donc je t'encourage vivement à continuer !\E[0m"
  space
  echo -e "   💬  \E[37mMerci à ma petite communauté sur discord pour leurs nombreux avis.\E[0m"
  echo -e "         \E[37m⭐ - Olivier Geiser, merci pour toutes tes remontées positives comme négatives.\E[0m"
  echo -e "         \E[37m⭐ - Tara-Velsy, merci pour tes idées de contenu qui font la force aujourd'hui de \E[36mBash-L Store\E[37m.\E[0m"
  echo -e "         \E[37m⭐ - Moomo, merci pour le partage que tu fais sur Linkedin et donner donc plus de sens à ce projet.\E[0m"
  space
  echo -e "   💬  \E[37mMerci à toutes les personnes qui ont tenté l'aventure Dyma et cliquant sur mon lien de parrainage.\E[0m"
  space
  echo -e "   💬  \E[37mEt bien entendue, merci \033[1m\E[32m$USER\E[0m\E[37m d'avoir pris le temps d'essayer \E[36mBash-L Store\E[37m.\E[0m"
  space
  echo -e "\E[91m 👍 ---------------------------------------------------------------------------------------------------------------- 👍 \E[0m"
  space
  echo -e "  \E[92m  💬  Vous pouvez dès à présent saisir dans votre terminal la commande \E[93mclear \E[92mpour nettoyer celui-ci.\E[0m"
  echo -e "  \E[92m  💬  Une fois vide, vous pourrez saisir \E[93mCTRL + SHIFT (↑) + w\E[92m pour fermer le terminal.\E[0m"
  echo -e "  \E[92m  💬  Je vous remercie chaleureusement d'avoir essayé \E[37m\E[36mBash-L Store\E[37m.\E[0m"
  echo -e "  \E[91m  💬  J'espère que vos préjugés concernant Linux se sont envolés... 👌\E[0m"
  space
  echo -e "  \E[92m  💬  Amicalement \E[95mAlain GUILLON\E[0m \E[92m auteur de \E[37m\E[36mBash-L Store\E[37m.\E[0m"
  space

  space
  read -rp "   Appuyer sur une touche pour quitter Bash-L Store."
  clear
  exit
}
fct_check_exist_install() { # Description : Permet d'afficher le message si l'installation à réussi ou bien si
  #               elle a déjà été installé.
  # Arg 1       : "success" ou "error"
  STATUS=$1
  case $STATUS in
  "success")
    space
    echo -e " \E[92m+ ------------------------------------------------------------------------------------------------ +\E[0m"
    echo -e " \E[92m    ✅ $PROGRAM_NAME a bien été installé avec succès sur cet ordinateur.\E[0m"
    echo -e " \E[92m+ ------------------------------------------------------------------------------------------------ +\E[0m"
    space
    ;;
  "error")
    space
    echo -e " \E[91m+ ------------------------------------------------------------------------------------------------ +\E[0m"
    echo -e " \E[91m|   ❌ Désolé, $PROGRAM_NAME a déjà été installé sur cet ordinateur!\E[0m"
    echo -e " \E[91m+ ------------------------------------------------------------------------------------------------ +\E[0m"
    space
    ;;
  esac
}
fct_back_to() { # Description : Selon le programme ou technologie, on retournera au menu en question
  # Arg 1       : Nom de la technologie ou programme
  case $1 in
  "home")
    # fct_check_exist_install "success"
    # space
    read -rp "Appuyer sur une touche pour vous rendre au menu principal..."
    clear
    fct_show_home_menu
    ;;
  "app")
    # fct_check_exist_install "success"
    # space
    read -rp "Appuyer sur une touche pour vous rendre au menu des applications..."
    clear
    fct_show_app_menu
    ;;
  esac
}
fct_show_script_version() { # Description ; Affiche la version du programme au niveau du menu
  # echo -e "  \E[97;44m#StandWith\E[90;43mUkraine\E[0m                                                                   \033[1m\033[2mVersion de \"\E[95mBash-L Store\E[97m\" : \E[92m2.1.1\033[0m"
  echo -e "  \E[97;44m#StandWith\E[90;43mUkraine\E[0m                                                                   \033[1m\033[2mVersion de \"\E[95mBash-L Store\E[97m\" : \E[92m$CONFIG_version\033[0m"
}

# ===============================================================================================================================
#   VÉRIFICATION DU STATUT DE LA TECHNOLOGIE OU DU PROGRAMME
# ===============================================================================================================================
fct_check_status() { # Description : Vérifier que le programme est installé ou non
  # Arg 1       : Nom
  PROGRAM_NAME=$1

  if [ "$PROGRAM_NAME" = "angular" ]; then
    RESULT=$(which ng)
  elif [ "$PROGRAM_NAME" = "typescript" ]; then
    RESULT=$(which tsc)
  else
    RESULT=$(which "$PROGRAM_NAME")
  fi

  if [ $? -eq 0 ]; then

    if [ "$PROGRAM_NAME" = "symfony" ]; then
      if [ -d ./test_install/symfony/test_install_symfony ]; then
        echo -e "\E[92mOUI.\E[0m"
      fi
    elif [ "$PROGRAM_NAME" = "laravel" ]; then
      if [ -d ./test_install/laravel/test_install_laravel ]; then
        echo -e "\E[92mOUI.\E[0m"
      fi
    elif [ "$PROGRAM_NAME" = "vue" ]; then
      if [ -d ./test_install/vue/test_install_vue3 ]; then
        echo -e "\E[92mOUI.\E[0m"
      fi
    elif [ "$PROGRAM_NAME" = "react" ]; then
      if [ -d ./test_install/react/test_install_react ]; then
        echo -e "\E[92mOUI.\E[0m"
      fi
    elif [ "$PROGRAM_NAME" = "python3" ]; then

      RESULT=$(which python3.10)
      if [ $? -eq 0 ]; then
        echo -e "\E[92mOUI.\E[0m"
      else
        echo -e "\E[37mNON.\E[0m"
      fi

    else
      echo -e "\E[92mOUI.\E[0m"
    fi

  else

    if [ "$PROGRAM_NAME" = "symfony" ]; then
      if [ ! -d ./test_install/symfony/test_install_symfony ]; then
        echo -e "\E[37mNON.\E[0m"
      else
        echo -e "\E[92mOUI.\E[0m"
      fi
    elif [ "$PROGRAM_NAME" = "laravel" ]; then
      if [ ! -d ./test_install/laravel/test_install_laravel ]; then
        echo -e "\E[37mNON.\E[0m"
      else
        echo -e "\E[92mOUI.\E[0m"
      fi
    elif [ "$PROGRAM_NAME" = "vue" ]; then
      if [ ! -d ./test_install/vue/test_install_vue3 ]; then
        echo -e "\E[37mNON.\E[0m"
      else
        echo -e "\E[92mOUI.\E[0m"
      fi
    elif [ "$PROGRAM_NAME" = "react" ]; then
      if [ ! -d ./test_install/react/test_install_react ]; then
        echo -e "\E[37mNON.\E[0m"
      else
        echo -e "\E[92mOUI.\E[0m"
      fi
    else
      echo -e "\E[37mNON.\E[0m"
    fi

  fi
}
fct_check_status_program() { # Description : Permet de vérifier le statut du programme
  # Arg 1       : Statut du programme (ok, update, bug, error)
  # Arg 2       : Nom de la technologies
  STATUS=$1
  # NAME=$2
  case $STATUS in
  "ok")
    echo -e " \E[90m|  \E[92m✅ Installation et suppression sont 100% fonctionnelles.\E[0m"
    ;;
  "update")
    echo -e " \E[90m|  \E[92m🚧 Une mise à jour arrive prochainement.\E[0m"
    ;;
  "bug")
    # if [ "$NAME" = "VUE" ]; then
    #   echo -e " \E[90m|  \E[92m✅ 100% fonctionnel pour la partie installation/suppression sauf pour ↴ \E[0m"
    #   echo -e " \E[90m|  \E[35m👾 l'affichage qui comporte un bug. En effet, même supprimé, il me dit que $NAME est installé sur cet ordinateur.\E[0m"
    # else
    echo -e " \E[90m|  \E[35m👾 Un bug non résolu pour le moment empêche son bon fonctionnement.\E[0m"
    # fi
    ;;
  "ko")
    echo -e " \E[90m|  \E[91m❌ ERREUR, en général c'est la partie suppression qui pose problème...\E[0m"
    ;;
  esac
}
fct_show_status_version() { # Description : Affiche la version d'un programme quelconque
  # Arg 1       : Nom de la technologie ou programme
  PROGRAM_NAME=$1
  echo -e " \E[90m+ ------------------------------------------------------------------------------------------------------------------------ +\E[0m"
  if [ "$PROGRAM_NAME" = "flutter" ]; then
    echo -e " \E[90m|  \E[33mFlutter et Dart sont-ils installés sur cet ordinateur: \E[32m$(fct_check_status $PROGRAM_NAME)\E[0m"
  elif [ "$PROGRAM_NAME" = "python3" ]; then
    echo -e " \E[90m|  \E[33m$PROGRAM_NAME.10 est-il installé sur cet ordinateur : \E[32m$(fct_check_status $PROGRAM_NAME)\E[0m"
  else
    echo -e " \E[90m|  \E[33m$PROGRAM_NAME est-il installé sur cet ordinateur : \E[32m$(fct_check_status $PROGRAM_NAME)\E[0m"
  fi
  echo -e " \E[90m+ ------------------------------------------------------------------------------------------------------------------------ +\E[0m"
  if [ "$PROGRAM_NAME" = "curl" ] || [ "$PROGRAM_NAME" = "node" ] || [ "$PROGRAM_NAME" = "git" ] || [ "$PROGRAM_NAME" = "docker" ] || [ "$PROGRAM_NAME" = "php" ] || [ "$PROGRAM_NAME" = "mysql" ] || [ "$PROGRAM_NAME" = "composer" ] || [ "$PROGRAM_NAME" = "symfony" ] || [ "$PROGRAM_NAME" = "laravel" ] || [ "$PROGRAM_NAME" = "code" ] || [ "$PROGRAM_NAME" = "mysql-workbench-community" ] || [ "$PROGRAM_NAME" = "chromium" ] || [ "$PROGRAM_NAME" = "firefox" ] || [ "$PROGRAM_NAME" = "brave" ] || [ "$PROGRAM_NAME" = "opera" ] || [ "$PROGRAM_NAME" = "postman" ] || [ "$PROGRAM_NAME" = "krita" ] || [ "$PROGRAM_NAME" = "discord" ] || [ "$PROGRAM_NAME" = "spotify" ] || [ "$PROGRAM_NAME" = "thunderbird" ] || [ "$PROGRAM_NAME" = "kylin-video" ] || [ "$PROGRAM_NAME" = "figma-linux" ] || [ "$PROGRAM_NAME" = "obs" ] || [ "$PROGRAM_NAME" = "blender" ] || [ "$PROGRAM_NAME" = "vlc" ] || [ "$PROGRAM_NAME" = "okular" ] || [ "$PROGRAM_NAME" = "gimp" ] || [ "$PROGRAM_NAME" = "android" ] || [ "$PROGRAM_NAME" = "spectacle" ] || [ "$PROGRAM_NAME" = "react" ] || [ "$PROGRAM_NAME" = "vue" ] || [ "$PROGRAM_NAME" = "angular" ] || [ "$PROGRAM_NAME" = "typescript" ] || [ "$PROGRAM_NAME" = "flutter" ] || [ "$PROGRAM_NAME" = "python3" ]; then
    fct_check_status_program ok
  # elif [ "$PROGRAM_NAME" = "react" ]; then
  #   fct_check_status_program update
  # elif [ "$PROGRAM_NAME" = "flutter" ] || [ "$PROGRAM_NAME" = "vue" ] || [ "$PROGRAM_NAME" = "react" ]; then

  #   if [ "$PROGRAM_NAME" = "flutter" ]; then
  #     fct_check_status_program bug FLUTTER
  #   elif [ "$PROGRAM_NAME" = "vue"  ]; then
  #     fct_check_status_program bug VUE
  #   elif [ "$PROGRAM_NAME" = "react"  ]; then
  #     fct_check_status_program bug REACT
  #   fi

  # elif [ "$PROGRAM_NAME" = "python3" ]; then

  #   if [ "$PROGRAM_NAME" = "python3" ]; then
  #     fct_check_status_program ko
  #   fi

  fi

  echo -e " \E[90m+ ------------------------------------------------------------------------------------------------------------------------ +\E[0m"
  space
}

# ===============================================================================================================================
#   VÉRIFICATION DE LA VERSION  DE LA TECHNOLOGIE OU DU PROGRAMME
# ===============================================================================================================================
fct_check_version() { # Description : Vérifier la version d'un programme
  # Arg 1       : Nom
  # Versiopn
  # version_linux=$(lsb_release -a | grep -Ei "Description" | cut -d " " -f 2 | head -n 2)

  PROGRAM_NAME=$1
  RESULT=$(which "$PROGRAM_NAME")
  if [ "$PROGRAM_NAME" = "angular" ]; then
    RESULT=$(which ng)
  elif [ "$PROGRAM_NAME" = "typescript" ]; then
    RESULT=$(which tsc)
  else
    RESULT=$(which "$PROGRAM_NAME")
  fi

  if [ "$?" -eq 0 ]; then

    # ===============================================================================================================================
    #   TECHNOLOGIES
    # ===============================================================================================================================
    if [ "$PROGRAM_NAME" = "curl" ]; then
      version_curl=$(curl --version | head -n 1 | cut -d " " -f 2 | cut -d " " -f 1)
      echo -e "\E[33m$version_curl\E[0m"
    elif [ "$PROGRAM_NAME" = "git" ]; then
      version_git=$(git --version | awk '{print $3}')
      echo -e "\E[33m$version_git\E[0m"
    elif [ "$PROGRAM_NAME" = "node" ]; then
      version_node=$(node -v | cut -d "v" -f 2)
      version_npm=$(npm -v)
      echo -e "\E[36mNode:\E[0m \E[33m$version_node\E[0m \E[36mNPM:\E[0m \E[33m$version_npm\E[0m"
    elif [ "$PROGRAM_NAME" = "docker" ]; then
      version_docker=$(docker -v | cut -d "," -f 1 | cut -d " " -f 3)
      echo -e "\E[33m$version_docker\E[0m"
    elif [ "$PROGRAM_NAME" = "php" ]; then
      version_php=$(php -v | head -n 1 | cut -d " " -f 2)
      echo -e "\E[33m$version_php\E[0m"
    elif [ "$PROGRAM_NAME" = "mysql" ]; then
      version_mysql=$(mysql -V | cut -d "u" -f 1 | cut -d " " -f 4)
      echo -e "\E[33m$version_mysql\E[0m"
    elif [ "$PROGRAM_NAME" = "composer" ]; then
      version_composer=$(composer -V | head -n 1 | cut -d " " -f 3)
      echo -e "\E[33m$version_composer\E[0m"

    elif [ "$PROGRAM_NAME" = "symfony" ]; then
      if [ -d ./test_install/symfony/test_install_symfony ]; then
        version_symfony=$(grep -Ei https://github.com/symfony/cache/tree/v ./test_install/symfony/test_install_symfony/composer.lock | head -n 1 | cut -d "\"" -f 4 | cut -d "v" -f 2)
        version_symfony_cli=$(symfony -V | grep -Ei version | cut -d " " -f 4 | cut -d "v" -f 2)
        echo -e "\E[36mCLI: \E[33m$version_symfony_cli \E[36mSymfony: \E[33m$version_symfony\E[0m"
      else
        echo -e "\E[91mSupprimer le répertoire ./symfony\E[0m"
      fi

    elif [ "$PROGRAM_NAME" = "angular" ]; then
      version_angular=$(ng --version | grep -Ei cli: | cut -d " " -f 3)
      echo -e "\E[33m$version_angular\E[0m"

    elif [ "$PROGRAM_NAME" = "typescript" ]; then
      version_typescript=$(tsc -v | cut -d " " -f 2)
      echo -e "\E[33m$version_typescript\E[0m"

    elif [ "$PROGRAM_NAME" = "python3" ]; then
      version_python38=$(python3 -V | cut -d " " -f 2)

      INFO_PYTHON310=$(which python3.10)
      if [ "$?" -eq 0 ]; then
        version_python310=$(python3.10 -V | cut -d " " -f 2)
        echo -e "\E[33m$version_python38 \E[36mET \E[33m$version_python310\E[0m"
      else
        echo -e "\E[33m$version_python38\E[0m"
      fi

    elif [ "$PROGRAM_NAME" = "flutter" ]; then
      version_dart=$(dart --version | cut -d " " -f 4)
      version_flutter=$(flutter --version | head -n 1 | cut -d " " -f 2)
      echo -e "\E[36mFlutter: \E[33m$version_flutter \E[36mDart: \E[33m$version_dart\E[0m"

    # ===============================================================================================================================
    #   APPLICATIONS
    # ===============================================================================================================================
    elif [ "$PROGRAM_NAME" = "code" ] || [ "$PROGRAM_NAME" = "mysql-workbench-community" ] || [ "$PROGRAM_NAME" = "chromium" ] || [ "$PROGRAM_NAME" = "firefox" ] || [ "$PROGRAM_NAME" = "brave" ] || [ "$PROGRAM_NAME" = "opera" ] || [ "$PROGRAM_NAME" = "figma-linux" ] || [ "$PROGRAM_NAME" = "krita" ] || [ "$PROGRAM_NAME" = "postman" ] || [ "$PROGRAM_NAME" = "discord" ] || [ "$PROGRAM_NAME" = "spotify" ] || [ "$PROGRAM_NAME" = "thunderbird" ] || [ "$PROGRAM_NAME" = "obs" ] || [ "$PROGRAM_NAME" = "kylin-video" ] || [ "$PROGRAM_NAME" = "vlc" ] || [ "$PROGRAM_NAME" = "blender" ] || [ "$PROGRAM_NAME" = "okular" ] || [ "$PROGRAM_NAME" = "gimp" ] || [ "$PROGRAM_NAME" = "spectacle" ]; then
      echo -e "\E[32mInstallé\E[0m"
    fi

  else

    if [ "$PROGRAM_NAME" = "vue" ] || [ "$PROGRAM_NAME" = "react" ] || [ "$PROGRAM_NAME" = "laravel" ] || [ "$PROGRAM_NAME" = "android" ]; then

      if [ "$PROGRAM_NAME" = "vue" ]; then
        if [ ! -d ./test_install/vue/test_install_vue3 ]; then
          echo -e "\E[37mPas installé\E[0m"
        else
          version_vue=$(grep -Ei "\"vue\"" ./test_install/vue/test_install_vue3/package.json | cut -d "^" -f 2 | cut -d "\"" -f 1)
          echo -e "\E[33m$version_vue\E[0m"
        fi
      elif [ "$PROGRAM_NAME" = "react" ]; then
        if [ ! -d ./test_install/react/test_install_react ]; then
          echo -e "\E[37mPas installé\E[0m"
        else
          version_react="$(grep -Ei "\"react\"" ./test_install/react/test_install_react/package.json | cut -d "^" -f 2 | cut -d "\"" -f 1)"
          echo -e "\E[33m$version_react\E[0m"
        fi
      elif [ "$PROGRAM_NAME" = "laravel" ]; then
        if [ -d ./test_install/laravel/test_install_laravel ]; then
          version_laravel=$(grep -Ei "\"v9" ./test_install/laravel/test_install_laravel/composer.lock | cut -d "v" -f 3 | cut -d "\"" -f 1)
          echo -e "\E[33m$version_laravel\E[0m"
        else
          echo -e "\E[37mPas installé\E[0m"
        fi
      elif [ "$PROGRAM_NAME" = "android" ]; then
        if [ ! -d ~/android-studio ]; then
          echo -e "\E[37mPas installé\E[0m"
        else
          echo -e "\E[32mInstallé\E[0m"
        fi
      fi

    else
      echo -e "\E[37mPas installé\E[0m"
    fi
  fi

}

# ===============================================================================================================================
#   COEUR DU SCRIPT - INSTALLATION / SUPPRESSION
# ===============================================================================================================================
fct_info_programme() { # Description : Afficher les informations du programme
  # Arg 1       : Nom de la technologie ou programme
  PROGRAM_NAME=$1

  # Choix des actions à effectuer
  if [ "$PROGRAM_NAME" = "python3" ]; then
    INSTALL="Installer $PROGRAM_NAME.10 sur cet ordinateur"
    DELETE="Supprimer $PROGRAM_NAME.10 de cet ordinateur"
    APPLICATIONS="allez à la page des applications"
    TECHNOLOGIES="allez à la page des technologies"
  elif [ ! "$PROGRAM_NAME" = "python3" ]; then
    INSTALL="Installer $PROGRAM_NAME sur cet ordinateur"
    DELETE="Supprimer $PROGRAM_NAME de cet ordinateur"
    APPLICATIONS="allez à la page des applications"
    TECHNOLOGIES="allez à la page des technologies"
  fi

  select option in "$INSTALL" "$DELETE" "$APPLICATIONS" "$TECHNOLOGIES"; do
    case $option in

    "$INSTALL")

      clear
      if [ "$PROGRAM_NAME" = "python3" ]; then
        fct_show_logo "python"
      elif [ ! "$PROGRAM_NAME" = "python3" ]; then
        fct_show_logo "$PROGRAM_NAME"
      fi

      # ===============================================================================================================================
      #   INSTALLATION - PARTIE TECHNOLOGIE
      # ===============================================================================================================================
      echo -e " \E[36m+ ------------------------------------------------------------------------------------------------------------------------ +\E[0m"
      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌
      if [ "$PROGRAM_NAME" = "curl" ] || [ "$PROGRAM_NAME" = "node" ] || [ "$PROGRAM_NAME" = "git" ] || [ "$PROGRAM_NAME" = "docker" ] || [ "$PROGRAM_NAME" = "php" ] || [ "$PROGRAM_NAME" = "mysql" ] || [ "$PROGRAM_NAME" = "composer" ] || [ "$PROGRAM_NAME" = "symfony" ] || [ "$PROGRAM_NAME" = "laravel" ] || [ "$PROGRAM_NAME" = "vue" ] || [ "$PROGRAM_NAME" = "react" ] || [ "$PROGRAM_NAME" = "angular" ] || [ "$PROGRAM_NAME" = "typescript" ] || [ "$PROGRAM_NAME" = "python" ] || [ "$PROGRAM_NAME" = "flutter" ]; then
        echo -e " \E[36m|   \E[33mDéroulement de l'installation de la technologie: \033[1m\E[34m$PROGRAM_NAME\033[0m\E[0m"
      elif [ "$PROGRAM_NAME" = "python3" ]; then
        echo -e " \E[36m|   \E[33mDéroulement de l'installation de la technologie: \033[1m\E[34m$PROGRAM_NAME.10\033[0m.\E[0m"
      elif [ "$PROGRAM_NAME" = "flutter" ]; then
        echo -e " \E[36m|   \E[33mDéroulement de l'installation de la technologie: \033[1m\E[34m$PROGRAM_NAME\033[0m \E[37m Á savoir que Dart sera automatiquement installé.\E[0m"
      else
        echo -e " \E[36m|   \E[33mDéroulement de l'installation du programme: \033[1m$PROGRAM_NAME\033[0m\E[0m"
      fi
      echo -e " \E[36m+ ------------------------------------------------------------------------------------------------------------------------ +\E[0m"

      # ===============================================================================================================================
      # MESSAGE PERSONNALISÉ LORS DE L'INSTALLATION DE LA TECHNOLOGIE
      # ===============================================================================================================================

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      if [ "$PROGRAM_NAME" = "curl" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[97m📋 cURL est normalement installé par défaut, mais au cas où on suivra les étapes ci-dessous.\E[0m"
        echo -e " \E[36m|   \E[97m� Pour installer \033[1m\E[34m$PROGRAM_NAME\033[0m\E[97m, nous aurions dû saisir :\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "node" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[97m📋 Il est recommandé de toujours installer une version PAIRE.\E[0m"
        echo -e " \E[36m|   \E[97m📋 Pour installer \033[1m\E[34m$PROGRAM_NAME\033[0m\E[97m et par la même occasion \033[1m\E[34mnpm\033[0m\E[97m, nous aurions dû saisir :\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "git" ] || [ "$PROGRAM_NAME" = "docker" ] || [ "$PROGRAM_NAME" = "php" ] || [ "$PROGRAM_NAME" = "mysql" ] || [ "$PROGRAM_NAME" = "composer" ] || [ "$PROGRAM_NAME" = "angular" ] || [ "$PROGRAM_NAME" = "typescript" ] || [ "$PROGRAM_NAME" = "flutter" ] || [ "$PROGRAM_NAME" = "code" ] || [ "$PROGRAM_NAME" = "mysql-workbench-community" ] || [ "$PROGRAM_NAME" = "chromium" ] || [ "$PROGRAM_NAME" = "firefox" ] || [ "$PROGRAM_NAME" = "brave" ] || [ "$PROGRAM_NAME" = "opera" ] || [ "$PROGRAM_NAME" = "postman" ] || [ "$PROGRAM_NAME" = "figma-linux" ] || [ "$PROGRAM_NAME" = "krita" ] || [ "$PROGRAM_NAME" = "discord" ] || [ "$PROGRAM_NAME" = "spotify" ] || [ "$PROGRAM_NAME" = "thunderbird" ] || [ "$PROGRAM_NAME" = "kylin-video" ] || [ "$PROGRAM_NAME" = "obs-studio" ] || [ "$PROGRAM_NAME" = "blender" ] || [ "$PROGRAM_NAME" = "vlc" ] || [ "$PROGRAM_NAME" = "okular" ] || [ "$PROGRAM_NAME" = "gimp" ] || [ "$PROGRAM_NAME" = "android" ] || [ "$PROGRAM_NAME" = "spectacle" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[97m📋 Pour installer \033[1m\E[34m$PROGRAM_NAME\033[0m\E[97m, nous aurions dû saisir :\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "composer" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[97m📋 Prérequis indispensable. Assurez-vous d'avoir installé sur cet ordinateur: \E[0m"
        echo -e " \E[36m|      � \E[96mphp 8 minimum\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "symfony" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[97m📋 Deux prérequis indispensables qui doivent être installés sur cet ordinateur: \E[0m"
        echo -e " \E[36m|      � \E[96mphp 8 minimum\E[0m"
        echo -e " \E[36m|      📌 \E[96mcomposer\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[97m📖 Enfin, pour installer \033[1m\E[34m$PROGRAM_NAME CLI\033[0m\E[97m nous aurions dû saisir :\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "laravel" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[97m📋 Quatre prérequis indispensables qui doivent être installés sur cet ordinateur: \E[0m"
        echo -e " \E[36m|      📌 \E[96mcURL\E[0m"
        echo -e " \E[36m|      📌 \E[96mphp-curl\E[0m"
        echo -e " \E[36m|      📌 \E[96mcURL\E[0m"
        echo -e " \E[36m|      📌 \E[96mcomposer\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "python3" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo add-apt-repository ppa:deadsnakes/ppa -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get install python3.10 -y\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "vue" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[97m📋 Anciènnement nous aurions dû saisir:\E[0m"
        echo -e " \E[36m|      💲 \E[92mnpm install vue -g\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "react" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[97m📋 Anciènnement nous aurions dû saisir:\E[0m"
        echo -e " \E[36m|      💲 \E[92mnpm install -g create-react-app\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "flutter" ]; then
        echo -e " \E[96m|\E[0m \E[37m Pour installer $PROGRAM_NAME et dart, nous aurions dû saisir :\E[0m"

      else
        echo -e " \E[36m|\E[0m \E[37m Pour installer $PROGRAM_NAME, nous aurions dû saisir :\E[0m"
      fi

      # ===============================================================================================================================
      #   COMMANDES UTILISÉES LORS DE L'INSTALLATION D'UNE TECHNOLOGIE
      # ===============================================================================================================================

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      if [ "$PROGRAM_NAME" = "curl" ]; then
        echo -e " \E[36m|      � \E[92msudo apt-get update\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get install $PROGRAM_NAME\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "node" ]; then
        echo -e " \E[36m|      � \E[92mcurl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get install -y nodejs\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "git" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get install $PROGRAM_NAME\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "docker" ]; then
        echo -e " \E[36m|   ❗ \E[35m\033[1mPlusieurs étapes sont nécessaire et donc je vous demande de me faire confiance pour installer Docker.\033[0m\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "php" ]; then
        echo -e " \E[36m|      � \E[92msudo add-apt-repository ppa:ondrej/php -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get install php8.1 -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get install php8.1-mbstring -y\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ :
      elif [ "$PROGRAM_NAME" = "mysql" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get install mysql-server\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[91m\033[1m❗ Veuillez vous rendre sur Dyma.fr et plus précisément sur leur formation PHP.\033[0m\E[0m"
        echo -e " \E[36m|   \E[91m\033[1m❗ Vous y trouverez tout le nécessaire pour configurer MySQL.\033[0m\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "composer" ]; then
        echo -e " \E[36m|      💲 \E[92mphp -r \"copy('https://getcomposer.org/installer', 'composer-setup.php');\"\E[0m"
        echo -e " \E[36m|      💲 \E[92mphp -r \"if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;\"\E[0m"
        echo -e " \E[36m|      💲 \E[92mphp composer-setup.php\E[0m"
        echo -e " \E[36m|      💲 \E[92mphp -r \"unlink('composer-setup.php');\"\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo mv composer.phar /usr/bin/composer\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "symfony" ]; then
        echo -e " \E[36m|      💲 \E[92mecho 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | sudo tee /etc/apt/sources.list.d/symfony-cli.list\E[0m"
        echo -e " \E[36m|      � \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      � \E[92msudo apt-get install symfony-cli -y\E[0m"
        echo -e " \E[36m|\E[0m"

        echo -e " \E[36m|   � \E[97m\033[1mIl est possible d'avoir une erreur alors pour évité ceci on installera la dépendance ci-dessous.\033[0m\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get install php8.1-xml -y\E[0m"
        echo -e " \E[36m|\E[0m"

        echo -e " \E[36m|   📋 \E[97m\033[1mVérification du bon fonctionnement de Symfony grâce à la commande suivante:\E[0m"
        echo -e " \E[36m|      💲 \E[92msymfony check:requirements\E[0m"
        echo -e " \E[36m|\E[0m"

        echo -e " \E[36m|   � \E[97m\033[1mMise en place du protocole \"HTTPS\" pour être utilisé avec Symfony en local.\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get install libnss3-tools -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msymfony server:ca:install\E[0m"
        echo -e " \E[36m|\E[0m"

        echo -e " \E[36m|   💬 \E[93m\033[1mAfin de connaître la version de Symfony utilisée, je vais installer un projet de test à cet emplacement :\E[0m"
        echo -e " \E[36m|   💬 \E[96m\033[1m./test_install/symfony/test_install_symfony\E[93m\033[1m. Voici les commandes que nous aurions dû saisir :\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./test_install\E[0m"
        echo -e " \E[36m|      💲 \E[92mmkdir ./symfony \E[37m// Un test d'existence est effectué au préalable.\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./symfony\E[0m"
        echo -e " \E[36m|      💲 \E[92msymfony new test_install_symfony\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./test_install_symfony\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ../../../\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ $PROGRAM_NAME = "laravel" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   📋 \E[97m\033[1mInstallation du prérequis \"php-curl\" via la commande:\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get install php-curl -y\E[0m"
        echo -e " \E[36m|\E[0m"

        echo -e " \E[36m|   \E[95m\033[1mSOLUTION ➊ qui ne sera pas utilisée ici:\033[0m\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mcomposer global require laravel/installer \E[90m\033[3m// Install l'installer de Laravel\033[0m"
        echo -e " \E[36m|      💲 \E[92mlaravel new NOM_DE_VOTRE_PROJET_ICI\E[0m       \E[90m\033[3m// Création d'un nouveau projet\033[0m"
        echo -e " \E[36m|\E[0m"

        echo -e " \E[36m|   \E[95m\033[1mSOLUTION ➋ qui sera utilisée ici.\033[0m\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   � \E[93m\033[1mAfin de connaître la version de Laravel utilisée, je vais installer un projet de test à cet emplacement :\E[0m"
        echo -e " \E[36m|   � \E[96m\033[1m./test_install/laravel/test_install_laravel\E[93m\033[1m. Voici les commandes que nous aurions dû saisir :\E[0m"
        echo -e " \E[36m|\E[0m"

        echo -e " \E[36m|      💲 \E[92mcd ./test_install\E[0m"
        echo -e " \E[36m|      💲 \E[92mmkdir ./laravel   \E[90m\033[3m// Un test d'existence est effectué en parallèle.\033[0m\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./laravel\E[0m"
        echo -e " \E[36m|      💲 \E[92mcomposer create-project laravel/laravel test_install_laravel\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./test_install_laravel\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ../../../\E[0m"
        echo -e " \E[36m|\E[0m"

        echo -e " \E[36m|   \E[34m\033[1m✋ Je ne le ferai pas mais, si vous le souhaitez, vous pouvez lacer le projet en saisissant:\033[0m\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mphp artisan serve\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "angular" ]; then
        echo -e " \E[36m|      💲 \E[92msudo npm install -g @angular/cli\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : 👾
      elif [ "$PROGRAM_NAME" = "vue" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   💬 \E[93m\033[1mAfin de connaître la version de Vue utilisée, je vais installer un projet de test à cet emplacement :\E[0m"
        echo -e " \E[36m|   💬 \E[96m\033[1m./test_install/vue/test_install_vue3\E[93m\033[1m. Voici les commandes que nous aurions dû saisir :\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./test_install\E[0m"
        echo -e " \E[36m|      💲 \E[92mmkdir ./vue   \E[90m\033[3m// Un test d'existence est effectué en parallèle.\033[0m\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./vue\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   📋 \E[97mPour installer \033[1m\E[34m$PROGRAM_NAME\033[0m\E[97m, nous aurions dû saisir :\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mnpm init vue@latest\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[91m\033[1m📋 Les étapes qui suivent sont à réaliser par vous-même,\033[0m\E[0m"
        echo -e " \E[36m|   \E[91m\033[1m📋 Par la suite prenez ce que vous voulez, ce n'est pas un problème sauf,\033[0m\E[0m"
        echo -e " \E[36m|   \E[91m\033[1m📋 veuillez à bien respecter IMPÉRATIVEMENT le nom du projet afin d'obtenir à la fin le numéro de version.\033[0m\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      \E[93m� 1: Le nom de l'application... \E[96m\033[1mLe NOM du projet à mentionner:\E[95m\033[1m test_install_vue3 :\E[0m"
        echo -e " \E[36m|      \E[93m💬 2: Utilisation de TypeScript \E[0m"
        echo -e " \E[36m|      \E[93m💬 3: Utilisation du JSX \E[0m"
        echo -e " \E[36m|      \E[93m💬 4: Utilisation du Routing \E[0m"
        echo -e " \E[36m|      \E[93m💬 5: Utilisation de Pinia \E[0m"
        echo -e " \E[36m|      \E[93m💬 6: Utilisation de Vitest \E[0m"
        echo -e " \E[36m|      \E[93m💬 7: Utilisation de Cypress \E[0m"
        echo -e " \E[36m|      \E[93m� 8: Utilisation d'ESLint \E[0m"
        echo -e " \E[36m|      \E[93m💬 9: Utilisation de Prettier \E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   📋 \E[96m\033[1mDéplacement dans le projet\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd test_install_vue3\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   📋 \E[96m\033[1mInstallation des dépendances\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mnpm install\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : 👾
      elif [ "$PROGRAM_NAME" = "react" ]; then
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   � \E[93m\033[1mAfin de connaître la version de React utilisée, je vais installer un projet de test à cet emplacement :\E[0m"
        echo -e " \E[36m|   � \E[96m\033[1m./test_install/react/test_install_react\E[93m\033[1m. Voici les commandes que nous aurions dû saisir :\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./test_install\E[0m"
        echo -e " \E[36m|      💲 \E[92mmkdir ./react   \E[90m\033[3m// Un test d'existence est effectué en parallèle.\033[0m\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./react\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   � \E[97mPour installer \033[1m\E[34m$PROGRAM_NAME\033[0m\E[97m, nous aurions dû saisir :\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mnpx create-react-app nom_de_votre_app\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   📋 \E[96m\033[1mDéplacement dans le projet\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd test_install_react\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   \E[34m\033[1m✋ Je ne le ferai pas mais, si vous le souhaitez, vous pouvez lacer le projet en saisissant:\033[0m\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mnpm start\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "typescript" ]; then
        echo -e " \E[36m|      💲 \E[92msudo npm uninstall -g typescript -y\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
      elif [ "$PROGRAM_NAME" = "flutter" ]; then
        echo -e " \E[36m|      💲 \E[92msudo snap install flutter --classic\E[0m"
        echo -e " \E[36m|\E[0m"

        CHECK_CONTENT_BASHRC="$(grep -Ei "# Pour flutter doctor" ~/.bashrc)"
        if [ $? -ne 0 ]; then
          echo -e " \E[36m|      💲 \E[92mecho \"\" | tee -a ~/.bashrc\E[0m"
          echo -e " \E[36m|      💲 \E[92mecho \"# Pour flutter doctor\" | tee -a ~/.bashrc\E[0m"
          echo -e " \E[36m|      💲 \E[92mecho 'CHROME_EXECUTABLE=/snap/bin/chromium' | tee -a ~/.bashrc\E[0m"
          echo -e " \E[36m|      💲 \E[92mexport CHROME_EXECUTABLE\E[0m"
          echo -e " \E[36m|\E[0m"
        fi

        echo -e " \E[36m|   📋 \E[97m\033[1mInitialisation de Flutter tout en vérifiant son bon fonctionnement via la commande:\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|      💲 \E[92mflutter doctor\E[0m"
        echo -e " \E[36m|\E[0m"
        echo -e " \E[36m|   📋 \E[91m\033[1mUn problème CHROME_EXECUTABLE va être détecté avec flutter doctor.\E[0m"
        echo -e " \E[36m|   📋 \E[91m\033[1mSi vous lancer un nouveau terminal à la fin de l'installation, vous pourrez relancer la commande\E[0m"
        echo -e " \E[36m|   📋 \E[91m\033[1m\"flutter doctor\" pour constater qu'il n'y a plus d'erreur. (Si bien entendu android est installé)\E[0m"
        echo -e " \E[36m|\E[0m"

      # APPLICATIONS

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "code" ] || [ "$PROGRAM_NAME" = "blender" ]; then
        echo -e " \E[36m|      💲 \E[92msudo snap install $PROGRAM_NAME --classic\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "mysql-workbench-community" ] || [ "$PROGRAM_NAME" = "chromium" ] || [ "$PROGRAM_NAME" = "firefox" ] || [ "$PROGRAM_NAME" = "brave" ] || [ "$PROGRAM_NAME" = "opera" ] || [ "$PROGRAM_NAME" = "figma-linux" ] || [ "$PROGRAM_NAME" = "krita" ] || [ "$PROGRAM_NAME" = "discord" ] || [ "$PROGRAM_NAME" = "spotify" ] || [ "$PROGRAM_NAME" = "thunderbird" ] || [ "$PROGRAM_NAME" = "vlc" ] || [ "$PROGRAM_NAME" = "okular" ] || [ "$PROGRAM_NAME" = "gimp" ] || [ "$PROGRAM_NAME" = "spectacle" ]; then
        echo -e " \E[36m|      💲 \E[92msudo snap install $PROGRAM_NAME\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "obs-studio" ]; then
        echo -e " \E[36m|      💲 \E[92msudo add-apt-repository ppa:obsproject/obs-studio\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt install obs-studio\E[0m"
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "android" ]; then
        echo -e " \E[36m|      💲 \E[92mwget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.1.1.22/android-studio-2021.1.1.22-linux.tar.gz\E[0m"
        echo -e " \E[36m|      💲 \E[92mtar -xvf android-studio-2021.1.1.22-linux.tar.gz\E[0m"
        echo -e " \E[36m|      💲 \E[92mchmod u+x android-studio-2021.1.1.22-linux.tar.gz\E[0m"
        echo -e " \E[36m|      💲 \E[92mrm -rf android-studio-2021.1.1.22-linux.tar.gz\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo mv android-studio ~/android-studio\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo chown -R $USER:$USER ~/android-studio\E[0m"
        CHECK_CONTENT_BASHRC="$(grep -Ei "# Alias Android-Studio" ~/.bashrc)"
        if [ $? -ne 0 ]; then
          echo -e " \E[36m|      💲 \E[92mecho \"# Alias Android-Studio\" | tee -a ~/.bashrc\E[0m"
          echo -e " \E[36m|      💲 \E[92mecho 'alias studio=\"~/android-studio/bin/studio.sh\"' | tee -a ~/.bashrc\E[0m"
          echo -e " \E[36m|      💲 \E[92msource ~/.bashrc\E[0m"
        fi
        echo -e " \E[36m|\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "kylin-video" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt kylin-video -y\E[0m"
        echo -e " \E[36m|\E[0m"

      fi

      echo -e " \E[36m+ ------------------------------------------------------------------------------------------------------------------------ +\E[0m"
      space

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      if [ "$PROGRAM_NAME" = "docker" ]; then
        echo -e " 💬 \E[34mMe faîtes-vous confiance pour que j'installe pour vous, \"\E[95m$PROGRAM_NAME\E[34m\", sans vous montrer les commandes à saisir...\E[0m\E[0m"
        echo ""
      elif [ "$PROGRAM_NAME" = "docker" ]; then
        echo -e " 💬 \E[34mSeriez-vous intéressé pour que j'installe pour vous, \"\E[95m$PROGRAM_NAME.10\E[34m\", via les commandes ci-dessus ?\E[0m"
        echo ""
      else
        echo -e " 💬 \E[34mSeriez-vous intéressé pour que j'installe pour vous, \"\E[95m$PROGRAM_NAME\E[34m\", via les commandes ci-dessus ?\E[0m"
        echo ""
      fi

      select option in "Oui" "Non et retourner au menu principal" "Non et allez directement sur la page des applications"; do
        case $option in
        "Oui")

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
          if [ "$PROGRAM_NAME" = "mysql-server" ]; then
            RESULT=$(fct_check_status mysql)
          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "typescript" ]; then
            RESULT=$(fct_check_status tsc)
          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          else
            RESULT=$(fct_check_status "$PROGRAM_NAME")
          fi

          space
          echo "    ... Veuillez patienter, l'installation de $PROGRAM_NAME va démarrer dans une seconde... (1s)"
          space
          loading
          sleep 1
          space

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          if [ "$PROGRAM_NAME" = "curl" ]; then
            sudo apt-get update -y
            sudo apt-get install "$PROGRAM_NAME" -y
            fct_check_exist_install "success"

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "node" ]; then
            curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
            sudo apt-get install -y nodejs

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "git" ]; then
            sudo apt-get update -y
            sudo apt-get install "$PROGRAM_NAME"

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "docker" ]; then
            sudo apt-get remove docker docker-engine docker.io containerd runc
            sudo apt-get update -y
            sudo apt-get install \
              apt-transport-https \
              ca-certificates \
              curl \
              gnupg-agent \
              software-properties-common

            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

            sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu     $(lsb_release -cs)     stable"
            sudo apt-get install docker-ce docker-ce-cli containerd.io

            sudo docker run hello-world
            systemctl start docker

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "php" ]; then
            sudo add-apt-repository ppa:ondrej/php -y
            sudo apt-get install php8.1 -y
            sudo apt-get install php8.1-mbstring -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "mysql" ]; then
            sudo apt-get install mysql-server -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "composer" ]; then
            php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
            php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
            php composer-setup.php
            php -r "unlink('composer-setup.php');"
            sudo mv composer.phar /usr/bin/composer

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "symfony" ]; then
            echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | sudo tee /etc/apt/sources.list.d/symfony-cli.list
            sudo apt-get update -y
            sudo apt-get install symfony-cli -y
            sudo apt-get install php8.1.*-xml -y
            symfony check:requirements

            sudo apt-get install libnss3-tools -y # Pour activé https sur Symfony
            symfony server:ca:install

            cd ./test_install
            if [ ! -d ./symfony ]; then
              mkdir ./symfony
              space
              echo -e "\E[32m\t📁 Sous-répertoire \"symfony\" créé avec succès!\E[0m"
              cd ./symfony
              space
              symfony new test_install_symfony
              echo -e "\E[32m\t✅ Création d'une application Symfony créé avec succès\E[0m"
              cd ./test_install_symfony
            else
              space
              echo -e "\E[91m\t💬 ERREUR, VEUILLEZ SUPPRIMER MANUELLEMENT LE RÉPERTOIRE \"./symfony\".\E[0m"
              echo -e "\E[91m\t💬 PUIS RELANCER SON INSTALLATION.\E[0m"
              echo -e "\E[91m ----------------------------------------------------------------------------------------------------------- \E[0m"
              echo -e "\E[93m\t💬 NE PRENEZ PAS EN COMPTE LE MESSAGE DE SUCCÈS CI-DESSOUS.\E[0m"
            fi
            cd ../../../

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "laravel" ]; then
            sudo apt-get install php-curl -y
            cd ./test_install
            if [ ! -d ./laravel ]; then
              mkdir ./laravel
              space
              echo -e "\E[32m\t📁 Sous-répertoire \"laravel\" créé avec succès!\E[0m"
              cd ./laravel
              space
              composer create-project laravel/laravel test_install_laravel
              echo -e "\E[32m\t✅ Création d'une application Laravel créé avec succès\E[0m"
              cd ./test_install_laravel
            else
              space
              echo -e "\E[91m\t❌ 📁 Sous-répertoire \"laravel\" déjà existant.\E[0m"
            fi
            cd ../../../

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
          elif [ "$PROGRAM_NAME" = "python3" ]; then
            sudo add-apt-repository ppa:deadsnakes/ppa -y
            sudo apt-get install python3.10 -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "angular" ]; then
            sudo npm install -g @angular/cli

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "vue" ]; then
            cd ./test_install
            if [ ! -d ./vue ]; then
              mkdir ./vue
              space
              echo -e "\E[32m\t📁 Sous-répertoire \"vue\" créé avec succès!\E[0m"
              cd ./vue
              space
              npm init vue@latest
              space
              echo -e "\E[32m\t✅ Installation du projet Vue3 terminé.\E[0m"
              cd ./test_install_vue3
              npm install
              space
              echo -e "\E[32m\t✅ Les dépendances de vue3 ont été installées.\E[0m"
            else
              space
              echo -e "\E[91m\t❌ 📁 Sous-répertoire \"vue\" déjà existant.\E[0m"
            fi
            cd ../../../

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
          elif [ "$PROGRAM_NAME" = "react" ]; then
            cd ./test_install
            if [ ! -d ./react ]; then
              mkdir ./react
              space
              echo -e "\E[32m\t📁 Sous-répertoire \"react\" créé avec succès!\E[0m"
              cd ./react
              space
              npx create-react-app test_install_react
              space
              echo -e "\E[32m\t✅ Installation du projet React terminé.\E[0m"
              cd ./test_install_react
            else
              space
              echo -e "\E[91m\t❌ 📁 Sous-répertoire \"react\" déjà existant.\E[0m"
            fi
            cd ../../../

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "typescript" ]; then
            sudo npm install -g typescript -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
          elif [ "$PROGRAM_NAME" = "flutter" ]; then
            sudo snap install flutter --classic

            CHECK_CONTENT_BASHRC="$(grep -Ei "# Pour flutter doctor" ~/.bashrc)"
            if [ $? -ne 0 ]; then
              echo "" | tee -a ~/.bashrc
              echo '# Pour flutter doctor' | tee -a ~/.bashrc
              echo 'CHROME_EXECUTABLE=/snap/bin/chromium' | tee -a ~/.bashrc
              echo 'export CHROME_EXECUTABLE' | tee -a ~/.bashrc
            fi

            flutter doctor

          # ===============================================================================================================================
          #   INSTALLATION - PARTIE APPLICATIONS
          # ===============================================================================================================================

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "code" ] || [ "$PROGRAM_NAME" = "blender" ]; then
            sudo snap install "$PROGRAM_NAME" --classic

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "mysql-workbench-community" ] || [ "$PROGRAM_NAME" = "chromium" ] || [ "$PROGRAM_NAME" = "firefox" ] || [ "$PROGRAM_NAME" = "brave" ] || [ "$PROGRAM_NAME" = "opera" ] || [ "$PROGRAM_NAME" = "figma-linux" ] || [ "$PROGRAM_NAME" = "krita" ] || [ "$PROGRAM_NAME" = "postman" ] || [ "$PROGRAM_NAME" = "discord" ] || [ "$PROGRAM_NAME" = "spotify" ] || [ "$PROGRAM_NAME" = "thunderbird" ] || [ "$PROGRAM_NAME" = "vlc" ] || [ "$PROGRAM_NAME" = "okular" ] || [ "$PROGRAM_NAME" = "gimp" ] || [ "$PROGRAM_NAME" = "spectacle" ]; then
            sudo snap install "$PROGRAM_NAME"

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "obs-studio" ]; then
            sudo add-apt-repository ppa:obsproject/obs-studio
            sudo apt-get update -y
            sudo apt-get install obs-studio

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "kylin-video" ]; then
            sudo apt-get install kylin-video -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "android" ]; then
            wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.1.1.22/android-studio-2021.1.1.22-linux.tar.gz
            tar -xvf android-studio-2021.1.1.22-linux.tar.gz
            chmod u+x android-studio-2021.1.1.22-linux.tar.gz
            rm -rf android-studio-2021.1.1.22-linux.tar.gz
            sudo mv android-studio ~/android-studio
            sudo chown -R $USER:$USER ~/android-studio

            CHECK_CONTENT_BASHRC="$(grep -Ei "# Alias Android-Studio" ~/.bashrc)"
            if [ $? -ne 0 ]; then
              echo "" | tee -a ~/.bashrc
              echo "# Alias Android-Studio" | tee -a ~/.bashrc
              echo "alias studio=\"~/android-studio/bin/studio.sh\"" | tee -a ~/.bashrc
              source ~/.bashrc
            fi

          fi

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          space
          echo -e " \E[92m+ ------------------------------------------------------------------------------------------------ +\E[0m"
          echo -e " \E[92m    ✅ $PROGRAM_NAME a bien été installé sur cet ordinateur avec succès.\E[0m"
          echo -e " \E[92m+ ------------------------------------------------------------------------------------------------ +\E[0m"
          space

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          if [ "$PROGRAM_NAME" = "code" ] || [ "$PROGRAM_NAME" = "mysql-workbench-community" ] || [ "$PROGRAM_NAME" = "chromium" ] || [ "$PROGRAM_NAME" = "firefox" ] || [ "$PROGRAM_NAME" = "brave" ] || [ "$PROGRAM_NAME" = "opera" ] || [ "$PROGRAM_NAME" = "figma-linux" ] || [ "$PROGRAM_NAME" = "krita" ] || [ "$PROGRAM_NAME" = "discord" ] || [ "$PROGRAM_NAME" = "spotify" ] || [ "$PROGRAM_NAME" = "thunderbird" ] || [ "$PROGRAM_NAME" = "kylin-video" ] || [ "$PROGRAM_NAME" = "obs-studio" ] || [ "$PROGRAM_NAME" = "blender" ] || [ "$PROGRAM_NAME" = "vlc" ] || [ "$PROGRAM_NAME" = "okular" ] || [ "$PROGRAM_NAME" = "gimp" ] || [ "$PROGRAM_NAME" = "android" ] || [ "$PROGRAM_NAME" = "spectacle" ]; then
            fct_back_to "app"
          else
            fct_back_to "home"
          fi
          ;;

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
        "Non et retourner au menu principal")
          clear
          fct_show_home_menu
          break
          ;;

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
        "Non et allez directement sur la page des applications")
          clear
          fct_show_app_menu
          break
          ;;
        esac
      done
      space
      break
      ;;

    "$DELETE")

      clear
      if [ "$PROGRAM_NAME" = "python3" ]; then
        fct_show_logo "python"
      elif [ ! "$PROGRAM_NAME" = "python3" ]; then
        fct_show_logo "$PROGRAM_NAME"
      fi

      # ===============================================================================================================================
      #   SUPPRESSION - PARTIE TECHNOLOGIE
      # ===============================================================================================================================
      echo -e " \E[36m+ ------------------------------------------------------------------------------------------------------------------------ +\E[0m"
      if [ "$PROGRAM_NAME" = "python3" ]; then
        echo -e " \E[36m|   \E[91m\033[1mSuppression de $PROGRAM_NAME.10\033[0m\E[0m"
      else
        echo -e " \E[36m|   \E[91m\033[1mSuppression de $PROGRAM_NAME\033[0m\E[0m"
      fi
      echo -e " \E[36m+ ------------------------------------------------------------------------------------------------------------------------ +\E[0m"
      echo -e " \E[36m|\E[0m"
      if [ "$PROGRAM_NAME" = "vue" ]; then
        echo -e " \E[36m|   � \E[97mVue ne dispose pas d'exécutable, donc en supprimant le sous-répertoire \"vue\" créé auparavant,\E[0m"
        echo -e " \E[36m|   📋 \E[97mça pourrais me permettre de simuler une supression de Vue.\E[0m"
        echo -e " \E[36m|   � \E[97mAinsi donc, les commandes utilisés sont:\E[0m"
      elif [ "$PROGRAM_NAME" = "python3" ]; then
        echo -e " \E[36m|   📋 \E[97mLes commandes utilisés lors de la supression de \033[1m\E[34m$PROGRAM_NAME.10\033[0m\E[97m sont:\E[0m"
      else
        echo -e " \E[36m|   📋 \E[97mLes commandes utilisés lors de la supression de \033[1m\E[34m$PROGRAM_NAME\033[0m\E[97m sont:\E[0m"
      fi
      echo -e " \E[36m|\E[0m"

      # ===============================================================================================================================
      # MESSAGE PERSONNALISÉ LORS DE LA SUPRESSION D'UNE QUELCONQUE TECHNOLOGIE
      # ===============================================================================================================================

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      if [ "$PROGRAM_NAME" = "curl" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove $PROGRAM_NAME -y\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "node" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove -y nodejs\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "git" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove $PROGRAM_NAME -y\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "docker" ]; then
        echo -e " \E[36m|      💲 \E[92msystemctl stop $PROGRAM_NAME\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove docker docker-engine docker.io containerd -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove docker-ce docker-ce-cli containerd.io -y\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "php" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo add-apt-repository --remove ppa:ondrej/php\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove php8.1-mbstring -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get purge '"$PROGRAM_NAME"8.1*' -y\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "mysql" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove --purge mysql-* -y\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "composer" ]; then
        echo -e " \E[36m|      💲 \E[92msudo rm -rf /usr/bin/composer\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "symfony" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove $PROGRAM_NAME-cli -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove php8.*-xml\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove libnss3-tools\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./test_install\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ../\E[0m"
        echo -e " \E[36m|      💲 \E[92mrm -rf ./symfony\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "laravel" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get update -y\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove php-curl -y\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ./test_install\E[0m"
        echo -e " \E[36m|      💲 \E[92mrm -rf ./laravel\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ../\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "python3" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get purge --auto-remove python3.10 -y\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "angular" ]; then
        echo -e " \E[36m|      💲 \E[92msudo npm uninstall -g @angular/cli\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "vue" ]; then
        echo -e " \E[36m|      💲 \E[92mcd ./test_install\E[0m"
        echo -e " \E[36m|      💲 \E[92mrm -rf ./vue\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ../\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
      elif [ "$PROGRAM_NAME" = "react" ]; then
        echo -e " \E[36m|      💲 \E[92mcd ./test_install\E[0m"
        echo -e " \E[36m|      💲 \E[92mrm -rf ./react\E[0m"
        echo -e " \E[36m|      💲 \E[92mcd ../\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "typescript" ]; then
        echo -e " \E[36m|      💲 \E[92msudo npm uninstall -g typescript -y\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : 👾
      elif [ "$PROGRAM_NAME" = "flutter" ]; then
        echo -e " \E[36m|      💲 \E[92msudo snap remove flutter\E[0m"

        CHECK_CONTENT_BASHRC="$(grep -Ei "# Pour flutter doctor" ~/.bashrc)"
        if [ $? -eq 0 ]; then
          echo -e " \E[36m|      💲 \E[92msed '# Pour flutter doctor/d' ~/.bashrc > ~/.bashrc_tmp\E[0m"
          echo -e " \E[36m|      💲 \E[92msed 'CHROME_EXECUTABLE=/snap/bin/chromium/d' ~/.bashrc > ~/.bashrc_tmp\E[0m"
          echo -e " \E[36m|      💲 \E[92msed 'export CHROME_EXECUTABLE/d' ~/.bashrc > ~/.bashrc_tmp\E[0m"
          echo -e " \E[36m|      💲 \E[92msource ~/.bashrc\E[0m"
        fi

      # ===============================================================================================================================
      #   SUPPRESSION - PARTIE APPLICATIONS
      # ===============================================================================================================================

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "code" ] || [ "$PROGRAM_NAME" = "mysql-workbench-community" ] || [ "$PROGRAM_NAME" = "chromium" ] || [ "$PROGRAM_NAME" = "brave" ] || [ "$PROGRAM_NAME" = "opera" ] || [ "$PROGRAM_NAME" = "figma-linux" ] || [ "$PROGRAM_NAME" = "krita" ] || [ "$PROGRAM_NAME" = "postman" ] || [ "$PROGRAM_NAME" = "discord" ] || [ "$PROGRAM_NAME" = "spotify" ] || [ "$PROGRAM_NAME" = "thunderbird" ] || [ "$PROGRAM_NAME" = "vlc" ] || [ "$PROGRAM_NAME" = "blender" ] || [ "$PROGRAM_NAME" = "okular" ] || [ "$PROGRAM_NAME" = "gimp" ] || [ "$PROGRAM_NAME" = "spectacle" ]; then
        echo -e " \E[36m|      💲 \E[92msudo snap remove $PROGRAM_NAME\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "obs-studio" ]; then
        echo -e " \E[36m|      💲 \E[92msudo add-apt-repository --remove ppa:obsproject/obs-studio\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove obs-studio\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "firefox" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove firefox\E[0m"
        echo -e " \E[36m|      💲 \E[92msudo snap remove firefox\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : 👾
      elif [ "$PROGRAM_NAME" = "android" ]; then
        echo -e " \E[36m|      💲 \E[92mrm -rf ~/android-studio\E[0m"
        echo -e " \E[36m|      💲 \E[92msed '/# Alias Android-Studio/d' ~/.bashrc > ~/.bashrc_tm\E[0m"
        echo -e " \E[36m|      💲 \E[92msed '/alias studio=\"~\/android-studio\/bin\/studio.sh\"/d' ~/.bashrc > ~/.bashrc_tmp\E[0m"
        echo -e " \E[36m|      💲 \E[92msource ~/.bashrc\E[0m"

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      elif [ "$PROGRAM_NAME" = "kylin-video" ]; then
        echo -e " \E[36m|      💲 \E[92msudo apt-get remove kylin-video -y\E[0m"
      fi

      echo -e " \E[36m|      💲 \E[92msudo apt-get autoclean -y\E[0m"
      echo -e " \E[36m|      💲 \E[92msudo apt-get autoremove -y\E[0m"
      echo -e " \E[36m|\E[0m"
      echo -e " \E[36m+ ------------------------------------------------------------------------------------------------------------------------ +\E[0m"
      space

      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      if [ "$PROGRAM_NAME" = "python3" ]; then
        echo -e " \E[34mSouhaitez-vous que je désinstalle \"\E[36m$PROGRAM_NAME.10\E[34m\" via les commandes ci-dessus pour vous !?\E[0m"
      # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
      # elif [ "$PROGRAM_NAME" = "docker" ]; then
      #   echo -e " 💬 \E[34mMe faîtes-vous confiance pour que je supprime pour vous, \"\E[95m"$PROGRAM_NAME"\E[34m\", sans vous montrer les commandes à saisir...\E[0m\E[0m"
      #   echo ""
      else
        echo -e " 💬 \E[34mSeriez-vous intéressé pour que je supprime pour vous, \"\E[95m$PROGRAM_NAME\E[34m\", via les commandes ci-dessus ?\E[0m"
        echo ""
      fi

      select option in "Oui" "Non et retourner au menu principal" "Non et allez directement sur la page des applications"; do
        case $option in
        "Oui")

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          if [ "$PROGRAM_NAME" = "mysql" ]; then
            RESULT=$(fct_check_status mysql)
          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "typescript" ]; then
            RESULT=$(fct_check_status tsc)
          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          else
            RESULT=$(fct_check_status "$PROGRAM_NAME")
          fi

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          space
          echo "    ... Veuillez patienter, la supression de $PROGRAM_NAME va démarrer dans une seconde... (1s)"
          space
          loading
          sleep 1
          space

          # ===============================================================================================================================
          #   SUPPRESSION - PARTIE TEHNOLOGIES
          # ===============================================================================================================================

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          if [ "$PROGRAM_NAME" = "curl" ]; then
            sudo apt-get update -y
            sudo apt-get remove "$PROGRAM_NAME" -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "node" ]; then
            sudo apt-get update -y
            sudo apt-get remove -y nodejs

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "git" ]; then
            sudo apt-get update -y
            sudo apt-get remove "$PROGRAM_NAME"

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "docker" ]; then
            systemctl stop docker
            sudo apt-get remove docker docker-engine docker.io containerd -y
            sudo apt-get update -y
            sudo apt-get remove docker-ce docker-ce-cli containerd.io -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "php" ]; then
            sudo apt-get update -y
            sudo add-apt-repository --remove ppa:ondrej/php -y
            sudo apt-get remove php8.1-mbstring -y
            sudo apt-get purge "$PROGRAM_NAME"8.1* -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "mysql" ]; then
            sudo apt-get update -y
            sudo apt-get remove --purge mysql-* -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "composer" ]; then
            sudo rm -rf /usr/bin/composer

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "symfony" ]; then
            sudo apt-get update -y
            sudo apt-get remove "$PROGRAM_NAME"-cli -y
            sudo apt-get remove php8.1.*-xml -y
            sudo apt-get remove libnss3-tools -y

            if [ -d ./test_install ]; then
              cd ./test_install
              if [ -d ./symfony ]; then
                rm -rf ./symfony
                space
                echo -e "\E[32m\t✅  📁 Sous-répertoire \"symfony\" supprimé avec succès!\E[0m"
                cd ..
                space
              else
                space
                echo -e "\E[91m\t❌ 📁 Sous-répertoire \"symfony\" inexistant, rien à supprimer.\E[0m"
              fi
            else
              space
              echo -e "\E[91m\t❌ 📁 Répertoire \"test_install\" inexistant, rien à supprimer.\E[0m"
            fi

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "laravel" ]; then
            sudo apt-get remove php-curl -y

            if [ -d ./test_install ]; then
              cd ./test_install
              if [ -d ./laravel ]; then
                rm -rf ./laravel
                space
                echo -e "\E[32m\t✅  📁 Sous-répertoire \"laravel\" supprimé avec succès!\E[0m"
                cd ..
                space
              else
                space
                echo -e "\E[91m\t❌ 📁 Sous-répertoire \"laravel\" inexistant, rien à supprimer.\E[0m"
              fi
            else
              space
              echo -e "\E[91m\t❌ 📁 Répertoire \"test_install\" inexistant, rien à supprimer.\E[0m"
            fi

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "angular" ]; then
            sudo npm remove -g @angular/cli

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "vue" ]; then
            cd ./test_install

            if [ -d ./vue ]; then
              rm -rf ./vue
              space
              echo -e "\E[32m\t✅ 📁 Sous-répertoire \"vue\" supprimé avec succès!\E[0m"
              cd ../
            else
              space
              echo -e "\E[91m\t❌ 📁 Sous-répertoire \"vue\" inexistant, rien à supprimé.\E[0m"
              cd ../
            fi

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
          elif [ "$PROGRAM_NAME" = "react" ]; then
            cd ./test_install

            if [ -d ./react ]; then
              rm -rf ./react
              space
              echo -e "\E[32m\t✅ 📁 Sous-répertoire \"react\" supprimé avec succès!\E[0m"
              cd ../
            else
              space
              echo -e "\E[91m\t❌ 📁 Sous-répertoire \"react\" inexistant, rien à supprimé.\E[0m"
              cd ../
            fi

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "typescript" ]; then
            sudo npm remove -g typescript -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
          elif [ "$PROGRAM_NAME" = "python3" ]; then
            # sudo ppa-purge ppa:deadsnakes/ppa -y
            sudo apt-get purge --auto-remove python3.10 -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : 👾
          elif [ "$PROGRAM_NAME" = "flutter" ]; then
            sudo snap remove flutter

            CHECK_CONTENT_BASHRC="$(grep -Ei "# Pour flutter doctor" ~/.bashrc)"
            if [ $? -eq 0 ]; then
              sed "/# Pour flutter doctor/d" ~/.bashrc_tmp >~/.bashrc
              sed "/CHROME_EXECUTABLE=/snap/bin/chromium/d" ~/.bashrc_tmp >~/.bashrc
              sed "/export CHROME_EXECUTABLE/d" ~/.bashrc_tmp >~/.bashrc

              CHECK_CONTENT_BASHRC_2="$(grep -Ei "# Alias Android-Studio" ~/.bashrc)"
              if [ $? -ne 0 ]; then
                echo "" | tee -a ~/.bashrc
                echo "# Alias Android-Studio" | tee -a ~/.bashrc
                echo "alias studio=\"~/android-studio/bin/studio.sh\"" | tee -a ~/.bashrc
                source ~/.bashrc
              fi
            fi

          # ===============================================================================================================================
          #   SUPPRESSION - PARTIE APPLICATIONS
          # ===============================================================================================================================

          # STATUT FONCTIONNEMENT VÉRIFIÉ : 👾 avec FIGMA-LINUX
          elif [ "$PROGRAM_NAME" = "code" ] || [ "$PROGRAM_NAME" = "mysql-workbench-community" ] || [ "$PROGRAM_NAME" = "chromium" ] || [ "$PROGRAM_NAME" = "brave" ] || [ "$PROGRAM_NAME" = "opera" ] || [ "$PROGRAM_NAME" = "figma-linux" ] || [ "$PROGRAM_NAME" = "krita" ] || [ "$PROGRAM_NAME" = "postman" ] || [ "$PROGRAM_NAME" = "discord" ] || [ "$PROGRAM_NAME" = "spotify" ] || [ "$PROGRAM_NAME" = "thunderbird" ] || [ "$PROGRAM_NAME" = "vlc" ] || [ "$PROGRAM_NAME" = "blender" ] || [ "$PROGRAM_NAME" = "okular" ] || [ "$PROGRAM_NAME" = "gimp" ] || [ "$PROGRAM_NAME" = "spectacle" ]; then
            sudo snap remove "$PROGRAM_NAME"

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "obs-studio" ]; then
            sudo add-apt-repository --remove ppa:obsproject/obs-studio
            sudo apt-get remove obs-studio

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          elif [ "$PROGRAM_NAME" = "firefox" ]; then
            sudo apt-get remove "$PROGRAM_NAME"
            sudo snap remove "$PROGRAM_NAME"

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
          elif [ "$PROGRAM_NAME" = "kylin-video" ]; then
            sudo apt-get remove "$PROGRAM_NAME" -y

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
          elif [ "$PROGRAM_NAME" = "android" ]; then
            rm -rf ~/android-studio

            CHECK_CONTENT_BASHRC="$(grep -Ei "# Alias Android-Studio" ~/.bashrc)"
            if [ $? -eq 0 ]; then
              sed '/# Alias Android-Studio/d' ~/.bashrc_tmp >~/.bashrc
              sed '/alias studio="~\/android-studio\/bin\/studio.sh"/d' ~/.bashrc_tmp >~/.bashrc

              CHECK_CONTENT_BASHRC_2="$(grep -Ei "# Pour flutter doctor" ~/.bashrc)"
              if [ $? -ne 0 ]; then
                echo "" | tee -a ~/.bashrc
                echo '# Pour flutter doctor' | tee -a ~/.bashrc
                echo 'CHROME_EXECUTABLE=/snap/bin/chromium' | tee -a ~/.bashrc
                echo 'export CHROME_EXECUTABLE' | tee -a ~/.bashrc
                source ~/.bashrc
              fi
            fi

          fi

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅
          space
          echo -e " \E[92m+ ------------------------------------------------------------------------------------------------ +\E[0m"
          echo -e " \E[92m    ✅ $PROGRAM_NAME a bien été désinstallé de cet ordinateur avec succès.\E[0m"
          echo -e " \E[92m+ ------------------------------------------------------------------------------------------------ +\E[0m"
          space

          read -rp "Pressez une touche pour continuer..."
          clear

          # STATUT FONCTIONNEMENT VÉRIFIÉ : ✅❌👾
          if [ "$PROGRAM_NAME" = "code" ] || [ "$PROGRAM_NAME" = "mysql-workbench-community" ] || [ "$PROGRAM_NAME" = "chromium" ] || [ "$PROGRAM_NAME" = "firefox" ] || [ "$PROGRAM_NAME" = "brave" ] || [ "$PROGRAM_NAME" = "opera" ] || [ "$PROGRAM_NAME" = "figma-linux" ] || [ "$PROGRAM_NAME" = "krita" ] || [ "$PROGRAM_NAME" = "discord" ] || [ "$PROGRAM_NAME" = "spotify" ] || [ "$PROGRAM_NAME" = "thunderbird" ] || [ "$PROGRAM_NAME" = "kylin-video" ] || [ "$PROGRAM_NAME" = "obs-studio" ] || [ "$PROGRAM_NAME" = "blender" ] || [ "$PROGRAM_NAME" = "vlc" ] || [ "$PROGRAM_NAME" = "okular" ] || [ "$PROGRAM_NAME" = "gimp" ] || [ "$PROGRAM_NAME" = "android" ] || [ "$PROGRAM_NAME" = "spectacle" ]; then
            fct_show_app_menu
          else
            fct_show_home_menu
          fi
          break
          ;;

        "Non et retourner au menu principal")
          clear
          fct_show_home_menu
          break
          ;;

        "Non et allez directement sur la page des applications")
          clear
          fct_show_app_menu
          break
          ;;
        esac
      done
      space
      break
      ;;

    "allez à la page des applications")
      clear
      fct_show_app_menu
      break
      ;;

    "allez à la page des technologies")
      clear
      fct_show_home_menu
      break
      ;;
    esac
  done
}

# ===============================================================================================================================
#   MENU TECHNOLOGIE
# ===============================================================================================================================
fct_show_home_menu() { # Description : Affichage du menu principal

  fct_show_logo "chargement"
  loading
  clear

  fct_show_logo "techno"
  echo -e "
  $(fct_show_script_version)
  + ----------------- + ----------------------------------------------------- + -------- + -------------------------------- +
  |  \E[92mTECHNOLOGIES\E[0m     |  \E[34mCOURTE DESCRIPTION\E[0m                                   |  GENRES  |  \E[33mVERSIONS ACTUELS\E[0m     
  + ----------------- + ----------------------------------------------------- + -------- + -------------------------------- +
  | \E[95m01\E[0m. \E[92mcURL          \E[0m|  \E[34mPour le bon fonctionnement des technos ci-dessous\E[0m    |    🔧    |  $(fct_check_version curl)
  | \E[95m02\E[0m. \E[92mNode          \E[0m|  \E[34mRuntime JavaScript\E[0m                                   |    🖥     |  $(fct_check_version node)
  | \E[95m03\E[0m. \E[92mGit           \E[0m|  \E[34mGérer ces projets sans crainte.\E[0m                      |    🖥     |  $(fct_check_version git)
  | \E[95m04\E[0m. \E[92mDocker        \E[0m|  \E[34mCréer des images de ces projets.\E[0m                     |    🖥     |  $(fct_check_version docker)
  | \E[95m05\E[0m. \E[92mPHP           \E[0m|  \E[34mUtilisé par plus de 50% des sites web dans le monde\E[0m  |    🖥     |  $(fct_check_version php)
  | \E[95m06\E[0m. \E[92mMySQL         \E[0m|  \E[34mPermet de créer et de gérer des bases de données.\E[0m    |    🖥     |  $(fct_check_version mysql)
  | \E[95m07\E[0m. \E[92mComposer      \E[0m|  \E[34mGestionnaire de dépendances pour PHP\E[0m                 |    🖥     |  $(fct_check_version composer)
  | \E[95m08\E[0m. \E[92mSymfony       \E[0m|  \E[34mFramework PHP Français très réputé.\E[0m                  |    🖥     |  $(fct_check_version symfony)
  | \E[95m09\E[0m. \E[92mLaravel       \E[0m|  \E[34mFramework PHP International très réputé.\E[0m             |    🖥     |  $(fct_check_version laravel)
  | \E[95m10\E[0m. \E[92mVue           \E[0m|  \E[34mFramework Javascript (Très facile d'accès)\E[0m           |    🖥     |  $(fct_check_version vue)
  | \E[95m11\E[0m. \E[92mReact         \E[0m|  \E[34mFramework Javascript (Accès assez moyen)\E[0m             |    🖥     |  $(fct_check_version react)
  | \E[95m12\E[0m. \E[92mAngular       \E[0m|  \E[34mFramework Javascript (Accès très dur)\E[0m                |    🖥     |  $(fct_check_version angular)
  | \E[95m13\E[0m. \E[92mTypeScript    \E[0m|  \E[34mTyper son code JavaScript.\E[0m                           |    🖥     |  $(fct_check_version typescript)
  | \E[95m14\E[0m. \E[92mPython        \E[0m|  \E[34mLangage surpuissant et simple d'accès.\E[0m               |    🖥     |  $(fct_check_version python3)
  | \E[95m15\E[0m. \E[92mFlutter       \E[0m|  \E[34mConcevoir des apps mobile \E[0m                           |    🖥     |  $(fct_check_version flutter)
  + ----------------- + ----------------------------------------------------- + -------- + -------------------------------- +
  | \E[33m16\E[0m. \E[37mApplications  \E[0m|  \E[37m\E[3mdes programmes utiles à installer très vite... ou à désinstaller si vous ne les appréciez pas.\E[0m
  | \E[33m17\E[0m. \E[37mQuitter\E[0m
  + ----------------- + --------------------------------------------------------------------------------------------------- +"
  echo -e "\E[97m    🔧 : Programme indispensable pour tout système UNIX. Il sert à envoyer des données dans les réseaux d’ordinateurs.\E[0m"
  echo -e "\E[97m    🖥  : Il s'agit d'une technologie utilisée par de nombreux développeurs dans le monde.\E[0m"
  space
  echo -e "\E[90m    ❗ À tout moment, vous pouvez taper sur\E[0m \E[36mCTRL + C\E[0m \E[90mpour stopper l'exécution de Bash-L Store.\E[0m"
  space

  select option in cURL Node Git Docker PHP MySQL Composer Symfony Laravel Vue React Angular TypeScript Python3 Flutter Applications Quitter; do
    case $option in
    cURL)

      clear
      fct_show_logo "curl"

      echo -e " \E[34m📕 Description de \E[36m\033[1mcurl\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mcURL est un client HTTP libre et open source.\E[0m"
      echo -e "   📖 \E[37mIl est utilisé pour télécharger des fichiers sur internet.\E[0m"
      echo -e "   📖 \E[37mLa ressource est désignée à l'aide d'une URL et doit être d'un type supporté par le logiciel.\E[0m"
      space

      fct_show_status_version "curl"
      fct_info_programme "curl"
      ;;

    Applications)
      clear
      fct_show_app_menu
      ;;

    Node)
      clear
      fct_show_logo "node"

      echo -e " \E[34m📕 Description de \E[36m\033[1mnode\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mNode.js est une plateforme logicielle libre en JavaScript,\E[0m"
      echo -e "   📖 \E[37morientée vers les applications réseau évènementielles hautement concurrentes qui doivent pouvoir monter en charge.\E[0m"
      echo -e "   📖 \E[37mElle utilise la machine virtuelle V8, la librairie libuv pour sa boucle d'évènements,\E[0m"
      echo -e "   📖 \E[37met implémente sous licence MIT les spécifications CommonJS.\E[0m"
      space

      echo -e " \E[34mDescription de \E[36m\E[1mnpm\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mnpm est le gestionnaire de paquets par défaut pour l'environnement d'exécution JavaScript Node.js\E[0m"
      echo -e "   📖 \E[37mde Node.js. npm se compose d'un client en ligne de commande, également appelé npm,\E[0m"
      echo -e "   📖 \E[37met d'une base de données en ligne de paquets publics et privés payants, appelée le registre npm.\E[0m"
      space

      fct_show_status_version "node"
      fct_info_programme "node"
      ;;

    Git)
      clear
      fct_show_logo "git"

      echo -e " \E[34m📕 Description de \E[36m\033[1mgit\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mGit est un logiciel de gestion de versions décentralisé.\E[0m"
      echo -e "   📖 \E[37mC'est un logiciel libre créé par Linus Torvalds, auteur du noyau Linux,\E[0m"
      echo -e "   📖 \E[37met distribué selon les termes de la licence publique générale GNU version 2.\E[0m"
      echo -e "   📖 \E[37mLe principal contributeur actuel de git et depuis plus de 16 ans est Junio C Hamano.\E[0m"
      space

      fct_show_status_version "git"
      fct_info_programme "git"
      ;;

    Docker)
      clear
      fct_show_logo "docker"

      echo -e " \E[34m📕 Description de \E[36m\033[1mdocker\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mDocker est une plateforme permettant de lancer certaines applications dans des conteneurs logiciels.\E[0m"
      echo -e "   📖 \E[37mSelon la firme de recherche sur l'industrie 451 Research,\E[0m"
      echo -e "   📖 \E[37m« Docker est un outil qui peut empaqueter une application et ses dépendances dans un conteneur isolé,\E[0m"
      echo -e "   📖 \E[37mqui pourra être exécuté sur n'importe quel serveur »\E[0m"
      space

      fct_show_status_version "docker"
      fct_info_programme "docker"
      ;;

    PHP)
      clear
      fct_show_logo "php"

      echo -e " \E[34m📕 Description de \E[36m\033[1mphp\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mPHP: Hypertext Preprocessor, plus connu sous son sigle PHP, est un langage de programmation libre,\E[0m"
      echo -e "   📖 \E[37mprincipalement utilisé pour produire des pages Web dynamiques via un serveur HTTP,\E[0m"
      echo -e "   📖 \E[37mmais pouvant également fonctionner comme n'importe quel langage interprété de façon locale.\E[0m"
      echo -e "   📖 \E[37mPHP est un langage impératif orienté objet. \E[0m"
      space

      fct_show_status_version "php"
      fct_info_programme "php"
      ;;

    MySQL)
      clear
      fct_show_logo "mysql"

      echo -e " \E[34m📕 Description de \E[36m\033[1mmysql\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mMySQL est un système de gestion de bases de données relationnelles.\E[0m"
      echo -e "   📖 \E[37mIl est distribué sous une double licence GPL et propriétaire.\E[0m"
      space

      fct_show_status_version "mysql"
      fct_info_programme "mysql"
      ;;

    Composer)
      clear
      fct_show_logo "composer"

      echo -e " \E[34m📕 Description de \E[36m\033[1mcomposer\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mComposer est un logiciel gestionnaire de dépendances libre écrit en PHP.\E[0m"
      echo -e "   📖 \E[37mIl permet à ses utilisateurs de déclarer et d'installer les bibliothèques dont le projet principal a besoin.\E[0m"
      echo -e "   📖 \E[37mLe développement a débuté en avril 2011 et a donné lieu à une première version sortie le 1ᵉʳ mars 2012.\E[0m"
      space

      fct_show_status_version "composer"
      fct_info_programme "composer"
      ;;

    Symfony)
      clear
      fct_show_logo "symfony"

      echo -e " \E[34m📕 Description de \E[36m\033[1msymfony\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mSymfony est un ensemble de composants PHP ainsi qu'un framework MVC libre écrit en PHP.\E[0m"
      echo -e "   📖 \E[37mIl fournit des fonctionnalités modulables et adaptables qui permettent\E[0m"
      echo -e "   📖 \E[37mde faciliter et d’accélérer le développement d'un site web.\E[0m"
      space

      fct_show_status_version "symfony"
      fct_info_programme "symfony"
      ;;

    Laravel)
      clear
      fct_show_logo "laravel"

      echo -e " \E[34m📕 Description de \E[36m\E[1mlaravel\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mLaravel est un framework web open-source écrit en PHP respectant le principe modèle-vue-contrôleur.\E[0m"
      echo -e "   📖 \E[37mIl est entièrement développé en programmation orientée objet. (POO)\E[0m"
      echo -e "   📖 \E[37mLaravel est distribué sous licence MIT, avec ses sources hébergées sur GitHub.\E[0m"
      space

      fct_show_status_version "laravel"
      fct_info_programme "laravel"
      ;;

    Vue)
      clear
      fct_show_logo "vue"

      echo -e " \E[34m📕 Description de \E[36m\033[1mvue\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mVue.js, est un framework JavaScript open-source utilisé pour construire des interfaces utilisateur\E[0m"
      echo -e "   📖 \E[37met des applications web monopages. Vue a été créé par Evan You\E[0m"
      echo -e "   📖 \E[37met est maintenu par lui et le reste des membres actifs de l'équipe principale travaillant\E[0m"
      echo -e "   📖 \E[37msur le projet et son écosystème.\E[0m"
      space

      fct_show_status_version "vue"
      fct_info_programme "vue"
      ;;

    React)
      clear
      fct_show_logo "react"

      echo -e " \E[34m📕 Description de \E[36m\033[1mreact\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mReact est une bibliothèque JavaScript libre développée par Facebook depuis 2013.\E[0m"
      echo -e "   📖 \E[37mLe but principal de cette bibliothèque est de faciliter la création d'application web monopage,\E[0m"
      echo -e "   📖 \E[37mvia la création de composants dépendant d'un état et générant une page HTML à chaque changement d'état.\E[0m"
      space

      fct_show_status_version "react"
      fct_info_programme "react"
      ;;

    Angular)
      clear
      fct_show_logo "angular"

      echo -e " \E[34m📕 Description d'\E[36m\033[1mangular\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mAngular est un framework côté client, open source, basé sur TypeScript,\E[0m"
      echo -e "   📖 \E[37met co-dirigé par l'équipe du projet « Angular » à Google et par une communauté de particuliers et de sociétés.\E[0m"
      echo -e "   📖 \E[37mAngular est une réécriture complète d'AngularJS, cadriciel construit par la même équipe.\E[0m"
      space

      fct_show_status_version "angular"
      fct_info_programme "angular"
      ;;

    TypeScript)
      clear
      fct_show_logo "typescript"

      echo -e " \E[34m📕 Description de \E[36m\033[1mtypescript\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mTypeScript est un langage de programmation libre et open source développé par Microsoft\E[0m"
      echo -e "   📖 \E[37mqui a pour but d'améliorer et de sécuriser la production de code JavaScript.\E[0m"
      echo -e "   📖 \E[37mIl s'agit d'un sur-ensemble syntaxique strict de JavaScript.\E[0m"
      space

      fct_show_status_version "typescript"
      fct_info_programme "typescript"
      ;;

    Python3)
      clear
      fct_show_logo "python"

      echo -e " \E[34m📕 Description de \E[36m\033[1mpython3\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mPython est un langage de programmation interprété, multi-paradigme et multiplateformes.\E[0m"
      echo -e "   📖 \E[37mIl favorise la programmation impérative structurée, fonctionnelle et orientée objet.\E[0m"
      space

      fct_show_status_version "python3"
      fct_info_programme "python3"
      ;;

    Flutter)
      clear
      fct_show_logo "flutter"

      echo -e " \E[34m📕 Description de \E[36m\033[1mflutter\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mFlutter est un kit de développement logiciel d'interface utilisateur open-source créé par Google.\E[0m"
      echo -e "   📖 \E[37mIl est utilisé pour développer des applications pour :\E[0m"
      echo -e "   📖 \E[37mAndroid, iOS, Linux, Mac, Windows, Google Fuchsia et le web à partir d'une seule base de code.\E[0m"

      fct_show_logo "dart"

      echo -e " \E[34m📕 Description de \E[36m\033[1mDart\033[0m\E[34m :\E[0m"
      space
      echo -e "   📖 \E[37mDart est un langage de programmation optimisé pour les applications sur plusieurs plateformes.\E[0m"
      echo -e "   📖 \E[37mIl est développé par Google et est utilisé pour créer des applications mobiles, de bureau, de serveur et web.\E[0m"
      echo -e "   📖 \E[37mDart est un langage orienté objet, basé sur la classe, récupérateur de mémoire avec une syntaxe de type C.\E[0m"
      space

      fct_show_status_version "flutter"
      fct_info_programme "flutter"
      ;;

    Quitter)

      fct_show_exit_program

      ;;
    esac
  done
}

# ===============================================================================================================================
#   MENU APPLICATIONS
# ===============================================================================================================================
fct_show_app_menu() {

  fct_show_logo "applications"

  # TABLEAU DES PROGRAMMES
  echo -e "
  $(fct_show_script_version)
  + ------------------- + -------------------------------------------------- + -------- + -------------------------------- +
  |  \E[92mAPPLICATIONS\E[0m       |  \E[34mCOURTE DESCRIPTION\E[0m                                |  GENRES  |  \E[33mVERSIONS ACTUELS\E[0m     
  + ------------------- + -------------------------------------------------- + -------- + -------------------------------- +
  | \E[95m01\E[0m \E[92mVS.Code          \E[0m|  \E[34mUn IDE Incontournable                             \E[0m|    💻    |  $(fct_check_version code)
  | \E[95m02\E[0m \E[92mMySQL Workbench  \E[0m|  \E[34mManipule une base de données open source          \E[0m|    🗃     |  $(fct_check_version mysql-workbench-community)
  | \E[95m03\E[0m \E[92mChromium         \E[0m|  \E[34mNavigateur web                                    \E[0m|    🌍    |  $(fct_check_version chromium)
  | \E[95m04\E[0m \E[92mFirefox          \E[0m|  \E[34mNavigateur web                                    \E[0m|    🌍    |  $(fct_check_version firefox)
  | \E[95m05\E[0m \E[92mBrave            \E[0m|  \E[34mNavigateur web                                    \E[0m|    🌍    |  $(fct_check_version brave)
  | \E[95m06\E[0m \E[92mOpera            \E[0m|  \E[34mNavigateur web                                    \E[0m|    🌍    |  $(fct_check_version opera)
  | \E[95m07\E[0m \E[92mPostman          \E[0m|  \E[34mGérer des APIs en toute tranquillité              \E[0m|    🔣    |  $(fct_check_version postman)
  | \E[95m08\E[0m \E[92mFigma-Linux      \E[0m|  \E[34mConcevez vos mockups avec classe                  \E[0m|    🖼     |  $(fct_check_version figma-linux)
  | \E[95m09\E[0m \E[92mKrita            \E[0m|  \E[34mLe Photoshop open source                          \E[0m|    🎨    |  $(fct_check_version krita)
  | \E[95m10\E[0m \E[92mDiscord          \E[0m|  \E[34mTchaté avec vos amis et collègue                  \E[0m|    💬    |  $(fct_check_version discord)
  | \E[95m11\E[0m \E[92mSpotify          \E[0m|  \E[34mÉcouter votre musique préféré                     \E[0m|    🎵    |  $(fct_check_version spotify)
  | \E[95m12\E[0m \E[92mThunderbird      \E[0m|  \E[34mGérer ces mail avec classe                        \E[0m|    📩    |  $(fct_check_version thunderbird)
  | \E[95m13\E[0m \E[92mKylin-Video      \E[0m|  \E[34mUn lecteur vidéo sympatiques                      \E[0m|    🎞     |  $(fct_check_version kylin-video)
  | \E[95m14\E[0m \E[92mOBS-Studio       \E[0m|  \E[34mCréér ses propres vidéos                          \E[0m|    🎥    |  $(fct_check_version obs-studio)
  | \E[95m15\E[0m \E[92mBlender          \E[0m|  \E[34mModéliser des objets en 3D                        \E[0m|    🗡     |  $(fct_check_version blender)
  | \E[95m16\E[0m \E[92mVLC              \E[0m|  \E[34mLecteur Vidéo                                     \E[0m|    🎞     |  $(fct_check_version vlc)
  | \E[95m17\E[0m \E[92mOkular           \E[0m|  \E[34mLecteur PDF et bien plus encore                   \E[0m|    🖥     |  $(fct_check_version okular)
  | \E[95m18\E[0m \E[92mGIMP             \E[0m|  \E[34mLogiciel de dessin                                \E[0m|    🎨    |  $(fct_check_version gimp)
  | \E[95m19\E[0m \E[92mAndroid-Studio   \E[0m|  \E[34mÉditeur d'application mobile                      \E[0m|    📱    |  $(fct_check_version android)
  | \E[95m20\E[0m \E[92mSpectacle        \E[0m|  \E[34mPermet de capturer son écran facilement           \E[0m|    📷    |  $(fct_check_version spectacle)
  + ------------------- + -------------------------------------------------- + -------- + -------------------------------- +
  | \E[33m21 \E[37mTechnologies     \E[0m|  \E[37m\E[3mIci, des technologies pour concevoir tout un tas d'applications web ou mobile.\E[0m
  | \E[33m22\E[0m \E[37mQuitter\E[0m
  + ---------------------------------------------------------------------------------------------------------------------- +"
  space
  echo -e "\E[90m    ❗ À tout moment, vous pouvez taper sur\E[0m \E[36mCTRL + C\E[0m \E[90mpour stopper l'exécution de Bash-L Store.\E[0m"
  space

  PS3="
  Quel est votre choix : "

  select option in VS.Code MySQL-Workbench Chromium Firefox Brave Opera Postman Figma-Linux Krita Discord Spotify Thunderbird Kylin-Video OBS-Studio Blender VLC Okular GIMP Android Spectacle Menu_Principal Quitter; do
    case $option in
    VS.Code)
      clear
      fct_show_logo "code"

      echo -e " \E[34m📕 Description de \E[36m\E[1mcode\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mVisual Studio Code est un éditeur de code extensible développé par Microsoft pour Windows, Linux et macOS.\E[0m"
      echo -e "   📖 \E[37mLes fonctionnalités incluent la prise en charge du débogage, la mise en évidence de la syntaxe,\E[0m"
      echo -e "   📖 \E[37mla complétion intelligente du code, les snippets, la refactorisation du code et Git intégré.\E[0m"
      space

      fct_show_status_version "code"
      fct_info_programme "code"
      ;;

    MySQL-Workbench)
      clear
      fct_show_logo "mysql-workbench-community"

      echo -e " \E[34m📕 Description de \E[36m\E[1mmysql-workbench-community\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mMySQL Community Edition est la version librement téléchargeable de la base de données open source\E[0m"
      echo -e "   📖 \E[37mla plus populaire au monde.\E[0m"
      echo -e "   📖 \E[37mElle est disponible sous la licence GPL et bénéficie du soutien d'une vaste\E[0m"
      echo -e "   📖 \E[37met active communauté de développeurs open source.\E[0m"
      space

      fct_show_status_version "mysql-workbench-community"
      fct_info_programme "mysql-workbench-community"
      ;;

    Chromium)
      clear
      fct_show_logo "chromium"

      echo -e " \E[34m📕 Description de \E[36m\E[1mchromium\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mChromium est un navigateur web libre développé par l’organisation Chromium Project créée par Google en 2008.\E[0m"
      echo -e "   📖 \E[37mChromium sert de base à plusieurs autres navigateurs,\E[0m"
      echo -e "   📖 \E[37mdont certains open-source ou certains propriétaires.\E[0m"
      echo -e "   📖 \E[37mLe moteur de rendu de Chromium s'appelle Blink.\E[0m"
      space

      fct_show_status_version "chromium"
      fct_info_programme "chromium"
      ;;

    Firefox)
      clear
      fct_show_logo "firefox"

      echo -e " \E[34m📕 Description de \E[36m\E[1mfirefox\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mMozilla Firefox est un navigateur web libre et gratuit disponible pour PC et mobiles,\E[0m"
      echo -e "   📖 \E[37mdéveloppé et distribué par la Mozilla Foundation depuis 2003, avec l'aide de milliers de bénévoles.\E[0m"
      echo -e "   📖 \E[37mL'entreprise Mozilla Corporation est créée en 2005 pour se charger du développement.\E[0m"
      space

      fct_show_status_version "firefox"
      fct_info_programme "firefox"
      ;;

    Brave)
      clear
      fct_show_logo "brave"

      echo -e " \E[34m📕 Description de \E[36m\E[1mbrave\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mBrave est un navigateur web open source gratuit disponible sur Windows, macOS et Linux ainsi que sur iOS et Android.\E[0m"
      echo -e "   📖 \E[37mIl a pour objectif de protéger la vie privée de ses utilisateurs en bloquant par défaut les pisteurs\E[0m"
      echo -e "   📖 \E[37met en permettant la navigation via le réseau Tor.\E[0m"
      space

      fct_show_status_version "brave"
      fct_info_programme "brave"
      ;;

    Opera)
      clear
      fct_show_logo "opera"

      echo -e " \E[34m📕 Description d'\E[36m\E[1mopera\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mOpera est un navigateur web gratuit développé par la société norvégienne Opera Software depuis 1995.\E[0m"
      echo -e "   📖 \E[37mLe navigateur est disponible sur PC et mobiles.\E[0m"
      echo -e "   📖 \E[37mOpera totalise environ 1,9 % de parts de marché des navigateurs web, et environ 2,3 % sur les mobiles en mars 2021.\E[0m"
      space

      fct_show_status_version "opera"
      fct_info_programme "opera"
      ;;

    Postman)
      clear
      fct_show_logo "postman"

      echo -e " \E[34m📕 Description de \E[36m\E[1mpostman\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mPostman est une application permettant de tester des API,\E[0m"
      echo -e "   📖 \E[37mcréée en 2012 par Abhinav Asthana, Ankit Sobti et Abhijit Kane à Bangalore\E[0m"
      echo -e "   📖 \E[37mpour répondre à une problématique de test d'API partageable.\E[0m"
      space

      fct_show_status_version "postman"
      fct_info_programme "postman"
      ;;

    Figma-Linux)
      clear
      fct_show_logo "figma-linux"

      echo -e " \E[34m📕 Description de \E[36m\E[1mfigma\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mFigma est ou outil de design collaboratif qui permet aux UX/UI designers de prototyper les interfaces graphiques.\E[0m"
      echo -e "   📖 \E[37mIl aide notamment à concevoir sites web, applications et autres interfaces utilisateur.\E[0m"
      space

      fct_show_status_version "figma-linux"
      fct_info_programme "figma-linux"
      ;;

    Krita)
      clear
      fct_show_logo "krita"

      echo -e " \E[34m📕 Description de \E[36m\E[1mkrita\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mKrita est un outil de peinture numérique GRATUIT et Open Source conçu pour les artistes concepteurs,\E[0m"
      echo -e "   📖 \E[37millustrateurs, artistes en texture et matte painting ainsi que pour le domaine VFX (Effets Visuels).\E[0m"
      echo -e "   📖 \E[37mKrita est en développement depuis plus de dix ans et connaît tout récemment une explosion de croissance.\E[0m"
      echo -e "   📖 \E[37mIl offre de nombreuses caractéristiques communes et innovantes pour aider de la même façon les amateurs\E[0m"
      echo -e "   📖 \E[37mcomme les professionnels. Découvrez quelques fonctionnalités intéressantes plus bas.\E[0m"
      space

      fct_show_status_version "krita"
      fct_info_programme "krita"
      ;;

    Discord)
      clear
      fct_show_logo "discord"

      echo -e " \E[34m📕 Description de \E[36m\E[1mdiscord\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mDiscord est un logiciel propriétaire gratuit de VoIP et de messagerie instantanée.\E[0m"
      echo -e "   📖 \E[37mIl fonctionne sur les systèmes d’exploitation Windows, macOS, Linux, Android, iOS ainsi que sur les navigateurs web.\E[0m"
      echo -e "   📖 \E[37mLa plateforme comptabilise le 21 juillet 2019 plus de 250 millions d'utilisateurs.\E[0m"
      space

      fct_show_status_version "discord"
      fct_info_programme "discord"
      ;;

    Spotify)
      clear
      fct_show_logo "spotify"

      echo -e " \E[34m📕 Description de \E[36m\E[1mspotify\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mSpotify est un service suédois de streaming musical sous la forme d'un logiciel propriétaire et d'un site web.\E[0m"
      echo -e "   📖 \E[37mCette plateforme de distribution numérique permet une écoute quasi instantanée de fichiers musicaux.\E[0m"
      space

      fct_show_status_version "spotify"
      fct_info_programme "spotify"
      ;;

    Thunderbird)
      clear
      fct_show_logo "thunderbird"

      echo -e " \E[34m📕 Description de \E[36m\E[1mthunderbird\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mMozilla Thunderbird est un client de messagerie, libre,\E[0m"
      echo -e "   📖 \E[37mdistribué gratuitement par la fondation Mozilla et issu du projet Mozilla.\E[0m"
      space

      fct_show_status_version "thunderbird"
      fct_info_programme "thunderbird"
      ;;

    Kylin-Video)
      clear
      fct_show_logo "kylin-video"

      echo -e " \E[34m📕 Description de \E[36m\E[1mkylin-video\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mKylin Video is an open source video player based on SMPlayer and developed using Qt5.\E[0m"
      echo -e "   📖 \E[37mIt supports playback of most video formats, with a fresh interface style and simple user operations.\E[0m"
      space

      fct_show_status_version "kylin-video"
      fct_info_programme "kylin-video"
      ;;

    OBS-Studio)
      clear
      fct_show_logo "obs-studio"

      echo -e " \E[34m📕 Description d'\E[36m\E[1mobs-studio\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mOBS Studio, abrégé en OBS, est un logiciel libre et open source de capture d'écran\E[0m"
      echo -e "   📖 \E[37met de streaming pour Microsoft Windows, MacOS et Linux.\E[0m"
      echo -e "   📖 \E[37mIl remplace Open Broadcaster Software et devient ainsi multiplateforme.\E[0m"
      space

      fct_show_status_version "obs"
      fct_info_programme "obs-studio"
      ;;

    Blender)
      clear
      fct_show_logo "blender"

      echo -e " \E[34m📕 Description de \E[36m\E[1mblender\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mBlender est un logiciel libre de modélisation, d’animation par ordinateur et de rendu en 3D, créé en 1998.\E[0m"
      echo -e "   📖 \E[37mIl est actuellement développé par la Fondation Blender.\E[0m"
      echo -e "   📖 \E[37mDepuis 2019 le logiciel Blender est de plus en plus reconnu par les entreprises du secteur de l'animation 3D,\E[0m"
      echo -e "   📖 \E[37mcomme Epic Games, Ubisoft et NVIDIA.\E[0m"
      space

      fct_show_status_version "blender"
      fct_info_programme "blender"
      ;;

    VLC)
      clear
      fct_show_logo "vlc"

      echo -e " \E[34m📕 Description de \E[36m\E[1mvlc\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mVLC media player est un lecteur multimédia, libre et gratuit issu du projet VideoLAN.\E[0m"
      echo -e "   📖 \E[37mCe logiciel multiplateforme, créé et maintenu en France, fonctionne entre autres sous Windows, GNU/Linux, BSD, macOS, iOS, Android,\E[0m"
      echo -e "   📖 \E[37msoit en tout près de 20 plates-formes. Il est distribué sous GPL et disponible dans 69 langues.\E[0m"
      space

      fct_show_status_version "vlc"
      fct_info_programme "vlc"
      ;;

    Okular)
      clear
      fct_show_logo "okular"

      echo -e " \E[34m📕 Description d'\E[36m\E[1mokular\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mOkular est la visionneuse de documents de KDE4.\E[0m"
      echo -e "   📖 \E[37mIl est basé sur KPDF et remplace KPDF, KGhostView, KFax, KFaxview, KDVI dans KDE4.\E[0m"
      echo -e "   📖 \E[37mCette fonctionnalité peut être facilement incorporée à d’autres applications.\E[0m"
      echo -e "   📖 \E[37mOkular a démarré lors du Google Summer of Code en 2005 ; Piotr Szymanski est l’étudiant qui a été retenu.\E[0m"
      space

      fct_show_status_version "okular"
      fct_info_programme "okular"
      ;;

    GIMP)
      clear
      fct_show_logo "gimp"

      echo -e " \E[34m📕 Description de \E[36m\E[1mgimp\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mGIMP, ou anciennement « The GIMP », est un outil d'édition et de retouche d'image,\E[0m"
      echo -e "   📖 \E[37mdiffusé sous la licence GPLv3 comme un logiciel gratuit et libre.\E[0m"
      echo -e "   📖 \E[37mIl en existe des versions pour la plupart des systèmes d'exploitation dont GNU/Linux, macOS et Microsoft Windows.\E[0m"
      space

      fct_show_status_version "gimp"
      fct_info_programme "gimp"
      ;;

    Android)
      clear
      fct_show_logo "android"

      echo -e " \E[34m📕 Description d'\E[36m\E[1mandroid\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mAndroid est un système d'exploitation mobile fondé sur le noyau Linux\E[0m"
      echo -e "   📖 \E[37met développé par des informaticiens sponsorisés par Google.\E[0m"
      space

      fct_show_status_version "android"
      fct_info_programme "android"
      ;;

    Spectacle)
      clear
      fct_show_logo "spectacle"

      echo -e " \E[34m📕 Description de \E[36m\E[1mspectacle\E[0m\E[0m :\E[0m"
      space
      echo -e "   📖 \E[37mSpectacle est une application simple permettant la réalisation de captures d'écran.\E[0m"
      echo -e "   📖 \E[37mL'application permet la capture d'images du bureau complet, d'un unique moniteur,\E[0m"
      echo -e "   📖 \E[37mde la fenêtre se trouvant sous le pointeur,ou du région rectangulaire de l'écran.\E[0m"
      echo -e "   📖 \E[37mLes images peuvent être imprimées, envoyées vers d'autres applications pour y être manipulées\E[0m"
      echo -e "   📖 \E[37mou rapidement enregistrées telles-quelles.\E[0m"
      space

      fct_show_status_version "spectacle"
      fct_info_programme "spectacle"
      ;;

    Quitter)
      fct_show_exit_program
      ;;
    esac
  done
}

#################################################################################################################################
# ===============================================================================================================================
#
#   EXÉCUTION DU SCRIPT CI-DESSOUS
#
# ===============================================================================================================================
#################################################################################################################################

# ===============================================================================================================================
#   CONFIGURATION YAML
# ===============================================================================================================================
function parse_yaml {
  local prefix=$2
  local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @ | tr @ '\034')
  sed -ne "s|^\($s\):|\1|" \
    -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
    -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p" $1 |
    awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
        vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
        printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
  }'
}

eval $(parse_yaml config.yml "CONFIG_")

fct_message_intro
fct_show_logo dyma
fct_message_presentation
fct_show_home_menu
