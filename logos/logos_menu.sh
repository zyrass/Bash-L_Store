#!/usr/bin/bash

# ===============================================================================================================================
#   TECHNO ( Technologies )
# ===============================================================================================================================
techno_logo() {
  echo -e "\033[1m\E[96m

    ________ _______  _______           _        _______  _        _______  _______  ________ _______  _______ 
    \__  __/(  ____ \(  ____ \|\     /|( (    /|(  ___  )( \      (  ___  )(  ____ \\ \\__  __/(  ____ \(  ____ \\
      ) (   | (    \/| (    \/| )   ( ||  \  ( || (   ) || (      | (   ) || (    \/   ) (   | (    \/| (    \/
      | |   | (__    | |      | (___) ||   \ | || |   | || |      | |   | || |         | |   | (__    | (_____ 
      | |   |  __)   | |      |  ___  || (\ \) || |   | || |      | |   | || | ____    | |   |  __)   (_____  )
      | |   | (      | |      | (   ) || | \   || |   | || |      | |   | || | \_  )   | |   | (            ) |
      | |   | (____/\| (____/\| )   ( || )  \  || (___) || (____/\| (___) || (___) |___) (___| (____/\/\____) |
      )_(   (_______/(_______/|/     \||/    )_)(_______)(_______/(_______)(_______)\_______/(_______/\_______)\033[0m\E[0m"
  space
  space
}

# ===============================================================================================================================
#   APP ( Applications )
# ===============================================================================================================================
app_logo() {
  echo -e "\033[1m\E[33m

      _______  _______  _______  _______ 
    (  ___  )(  ____ )(  ____ )(  ____ \\
    | (   ) || (    )|| (    )|| (    \/
    | (___) || (____)|| (____)|| (_____ 
    |  ___  ||  _____)|  _____)(_____  )
    | (   ) || (      | (            ) |
    | )   ( || )      | )      /\____) |
    |/     \||/       |/       \_______)\033[0m\E[0m"
  space
  space
}

export -f techno_logo
export -f app_logo