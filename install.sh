#!/bin/bash

blue='\033[96m'
red='\033[91m'
green='\033[92m'
yellow='\033[93m'
purple='\033[95m'
white='\033[97m'

bg_blue='\033[44m'
bg_red='\033[41m'
bg_green='\033[42m'
bg_yellow='\033[43m'
bg_cyan='\033[46m'
bg_white='\033[47m'
bg_purple='\033[45m'

reset='\033[0m'

if  [ "$EUID" -eq 0 ]; then
  printf "${red}[ x ] : Don't run as root.\n"
  exit 1
fi

 
mkdir -p /tmp/skwal-dotfiles
cd /tmp/skwal-dotfiles

touch skwal-dotfiles.log

if ! command -v curl &>>/tmp/skwal-dotfiles/skwal-dotfiles.log; then 
  printf "${red}[ x ] : please install curl ${reset}\n" 
  exit 1
fi



printf "${green}[ ? ] : Recommended : Download and install nerd-fonts [Y/n] : ${yellow}"
read confirmation

if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
  printf "${blue}[ i ] : Downloading nerd-fonts...\n"
  if ! sudo curl -o FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip -L &>>/tmp/skwal-dotfiles/skwal-dotfiles.log; then
    printf "${red}[ x ] : An error occured downloading nerd-fonts !"
    exit 1
  fi

  printf "${green}[ v ] : Downloaded nerd-fonts !\n"

  printf "${blue}[ i ] : Extracting nerd-fonts...\n"

  if ! mkdir -p ~/.local/share/fonts/FiraCode &>>/tmp/skwal-dotfiles/skwal-dotfiles.log; then 
    printf "${red}[ x ] : An error occured creating folder for nerd-fonts ${blue}\n" 
    exit 1
  fi

  if ! unzip -o FiraCode.zip -d ~/.local/share/fonts/FiraCode &>>/tmp/skwal-dotfiles/skwal-dotfiles.log; then 
    printf "${red}[ x ] : An error occured extracting nerd-fonts !\n"
    exit 1
  fi

  printf "${green}[ v ] : Extracted nerd-fonts !\n"


  printf "${blue}[ i ] : Updating font cache...\n"
  if ! fc-cache -f -v &>>/tmp/skwal-dotfiles/skwal-dotfiles.log; then
    printf "${red}[ x ] : An error occured updating font cache !\n"
    exit 1
  fi

  printf "${green}[ v ] : Updated font cache !\n"

  printf "${green}[ v ] : Nerd-fonts installed !\n"
else
  printf "${yellow}[ i ] : Ignoring nerd-fonts installation\n" 
fi

printf "\n\n"

printf "${blue}[ i ] : Please follow ${yellow}https://github.com/SkwalExe/dotfiles#install-packages${blue} to installed required programs\n\n"
printf "${blue}[ i ] : or automatically install required programs ${yello}[ not recommended ]\n"
printf "${bg_blue}${white} [ ? ] : Specify your distro ${reset} \n\n"
printf "${blue} [ a ] : Arch Linux based distro\n"
printf "${blue} [ b ] : Debian based distro\n"
printf "${yellow} [ c ] : I will install packages manually\n\n"

printf "${green}[ ? ] : [a/b/C] : ${yellow}"
read confirmation

if [[ "${confirmation,,}" =~ ^(a|b)$ ]]; then
  case $confirmation in
    a)
      printf "${green}[ ? ] : Please specify your AUR helper [Default: yay] : ${yellow}"
      read aur
      aur=${aur:-yay}
      if ! command -v $aur &>>/tmp/skwal-dotfiles/skwal-dotfiles.log; then
        printf "${red}[ x ] : $aur not found !\n"
        exit 1
      fi

      printf "${green}[ ? ] : $aur -S rofi ? [Y/n] : ${yellow}"
      read confirmation 
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing rofi...\n"
        if ! $aur -S rofi ; then
          printf "${red}[ x ] : An error occured installing rofi with $aur !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed rofi !\n"
      fi

      printf "${green}[ ? ] : $aur -S picom ? [Y/n] : ${yellow}"
      read confirmation
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing picom...\n"
        if ! $aur -S picom ; then
          printf "${red}[ x ] : An error occured installing picom with $aur !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed picom !\n"
      fi

      printf "${green}[ ? ] : $aur -S nitrogen ? [Y/n] : ${yellow}"
      read confirmation
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing nitrogen...\n"
        if ! $aur -S nitrogen ; then
          printf "${red}[ x ] : An error occured installing nitrogen with $aur !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed nitrogen !\n"
      fi

      printf "${green}[ ? ] : $aur -S i3-gaps ? [Y/n] : ${yellow}"
      read confirmation
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing i3-gaps...\n"
        if ! $aur -S i3-gaps ; then
          printf "${red}[ x ] : An error occured installing i3-gaps with $aur !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed i3-gaps !\n"
      fi

      printf "${green}[ ? ] : $aur -S lxappearance ? [Y/n] : ${yellow}"
      read confirmation
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing lxappearance...\n"
        if ! $aur -S lxappearance ; then
          printf "${red}[ x ] : An error occured installing lxappearance with $aur !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed lxappearance !\n"
      fi

      printf "${green}[ ? ] : $aur -S polybar ? [Y/n] : ${yellow}"
      read confirmation

      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing polybar...\n"
        if ! $aur -S polybar ; then
          printf "${red}[ x ] : An error occured installing polybar with $aur !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed polybar !\n"
      fi

      printf "${green}[ ? ] : $aur -S mini-matrix ? [Y/n] : ${yellow}"
      read confirmation
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing mini-matrix...\n"
        if ! $aur -S mini-matrix ; then
          printf "${red}[ x ] : An error occured installing mini-matrix with $aur !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed mini-matrix !\n"
      fi
    ;;
    b)

      if ! command -v apt &>>/tmp/skwal-dotfiles/skwal-dotfiles.log; then
        printf "${red}[ x ] : apt not found !\n"
        exit 1
      fi

      printf "${green}[ ? ] : apt install rofi ? [Y/n] : ${yellow}"
      read confirmation 
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing rofi...\n"
        if ! sudo apt install rofi ; then
          printf "${red}[ x ] : An error occured installing rofi with apt !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed rofi !\n"
      fi

      printf "${green}[ ? ] : Install picom [Y/n] : ${yellow}"
      read confirmation
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing build dependencies...\n"


        if ! sudo apt install meson uthash-dev libconfig-dev libgl-dev libdbus-1-dev libev-dev libx11-xcb-dev libxcb-damage0-dev libxcb-sync-dev libxcb-xinerama0-dev libxcb-present-dev libxcb-glx0-dev build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev ; then
          printf "${red}[ x ] : An error occured installing build dependencies with apt !\n"
          exit 1
        fi

      

        printf "${blue}[ i ] : Cloning picom...\n"
        rm -rf picom
        if ! git clone https://github.com/yshui/picom.git &>>/tmp/skwal-dotfiles/skwal-dotfiles.log ; then
          printf "${red}[ x ] : An error occured cloning picom !\n"
          exit 1
        fi
        cd picom

        git submodule update --init --recursive &>>/tmp/skwal-dotfiles/skwal-dotfiles.log

        printf "${blue}[ i ] : Building picom...\n"

        if ! meson --buildtype=release . build ; then
          printf "${red}[ x ] : An error occured building picom !\n"
          exit 1
        fi

        if ! ninja -C build ; then
          printf "${red}[ x ] : An error occured installing picom !\n"
          exit 1
        fi

        if ! sudo ninja -C build install ; then
          printf "${red}[ x ] : An error occured installing picom !\n"
          exit 1
        fi

        printf "${green}[ v ] : Installed picom !\n"
        cd ..
        rm -rf picom

      fi

      printf "${green}[ ? ] : apt install nitrogen ? [Y/n] : ${yellow}"
      read confirmation
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing nitrogen...\n"
        if ! sudo apt install nitrogen ; then
          printf "${red}[ x ] : An error occured installing nitrogen with apt !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed nitrogen !\n"
      fi

      printf "${green}[ ? ] : apt install i3-gaps ? [Y/n] : ${yellow}"
      read confirmation
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing i3-gaps...\n"
        if ! sudo apt install software-properties-common ; then
          printf "${red}[ x ] : An error occured installing software-properties-common with apt !\n"
          exit 1
        fi
        if ! sudo add-apt-repository ppa:regolith-linux/release ; then
          printf "${red}[ x ] : An error occured adding ppa regolith-linux/release with apt-add-repository !\n"
          exit 1
        fi
        if ! sudo apt update ; then
          printf "${red}[ x ] : An error occured updating apt repos !\n"
          exit 1
        fi

        if ! sudo apt install i3-gaps ; then
          printf "${red}[ x ] : An error occured installing i3-gaps with apt !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed i3-gaps !\n"
      fi

      printf "${green}[ ? ] : apt install lxappearance ? [Y/n] : ${yellow}"
      read confirmation
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing lxappearance...\n"
        if ! sudo apt install lxappearance ; then
          printf "${red}[ x ] : An error occured installing lxappearance with apt !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed lxappearance !\n"
      fi

      printf "${green}[ ? ] : Install polybar [Y/n] : ${yellow}"
      read confirmation

      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing polybar...\n"
        rm -rf polybar
        if ! git clone --recursive https://github.com/polybar/polybar &>>/tmp/skwal-dotfiles/skwal-dotfiles.log ; then
          printf "${red}[ x ] : An error occured cloning polybar !\n"
          exit 1
        fi
        
        cd polybar
        if ! ./build.sh ; then
          printf "${red}[ x ] : An error occured building polybar !\n"
          exit 1
        fi
        printf "${green}[ v ] : Installed polybar !\n"
      fi

      printf "${green}[ ? ] : Install mini-matrix [Y/n] : ${yellow}"
      read confirmation
      if [ -z "$confirmation" ] || [[ "${confirmation,,}" == "y" ]]; then
        printf "${blue}[ i ] : Installing mini-matrix...\n"
        rm -rf mini-matrix
        if ! git clone https://github.com/SkwalExe/mini-matrix.git &>>/tmp/skwal-dotfiles/skwal-dotfiles.log ; then
          printf "${red}[ x ] : An error occured cloning mini-matrix !\n"
          exit 1
        fi
        cd mini-matrix
        if ! make ; then
          printf "${red}[ x ] : An error occured building mini-matrix !\n"
          exit 1
        fi
        cd ..
        printf "${green}[ v ] : Installed mini-matrix !\n"
      fi

  esac
  printf "${green}[ v ] : All required programs installed !\n"

else
  printf "${yellow}[ i ] : Ignoring packages installation\n" 

fi

printf "\n\n"

printf "${blue}[ i ] : Cloning dotfiles...\n"
rm -rf dotfiles
if ! git clone https://github.com/SkwalExe/dotfiles.git &>>/tmp/skwal-dotfiles/skwal-dotfiles.log ; then
  printf "${red}[ x ] : An error occured cloning dotfiles !\n"
  exit 1
fi
printf "${green}[ v ] : Cloned dotfiles !\n"

cd dotfiles
cd .config 

printf "${green}[ ? ] : Copy i3 config [Y/n] : ${yellow}"
read confirmation
if [ -z "$confirmation" ] || [[ ${confirmation,,} == "y" ]]; then
  printf "${blue}[ i ] : Copying i3 config...\n"
  mkdir -p ~/.config/i3
  if [ -f ~/.config/i3/config ]; then
    mv ~/.config/i3/config ~/.config/i3/config.$RANDOM.bak
    printf "${green}[ v ] : Created backup of i3 config in ~/.config/i3/ !\n"
  fi
  if ! cp i3/config ~/.config/i3/config ; then
    printf "${red}[ x ] : An error occured copying i3 config !\n"
    exit 1
  fi
  printf "${green}[ v ] : Copied i3 config !\n"
fi

printf "${green}[ ? ] : Copy picom config [Y/n] : ${yellow}"
read confirmation
if [ -z "$confirmation" ] || [[ ${confirmation,,} == "y" ]]; then
  printf "${blue}[ i ] : Copying picom config...\n"
  if [ -f ~/.config/picom.conf ]; then
    mv ~/.config/picom.conf ~/.config/picom.conf.$RANDOM.bak
    printf "${green}[ v ] : Created backup of picom config in ~/.config/ !\n"
  fi
  if ! cp picom.conf ~/.config/picom.conf ; then
    printf "${red}[ x ] : An error occured copying picom config !\n"
    exit 1
  fi
  printf "${green}[ v ] : Copied picom config !\n"
fi

 
printf "${green}[ ? ] : Copy rofi config [Y/n] : ${yellow}"
read confirmation
if [ -z "$confirmation" ] || [[ ${confirmation,,} == "y" ]]; then
  printf "${blue}[ i ] : Copying rofi config...\n"
  mkdir -p ~/.config/rofi
  if [ -f ~/.config/rofi/config.rasi ]; then
    mv ~/.config/rofi/config.rasi ~/.config/rofi/config.rasi.$RANDOM.bak
    printf "${green}[ v ] : Created backup of rofi config in ~/.config/rofi/ !\n"
  fi
  if ! cp rofi/config.rasi ~/.config/rofi/config.rasi ; then
    printf "${red}[ x ] : An error occured copying rofi config !\n"
    exit 1
  fi
  printf "${green}[ v ] : Copied rofi config !\n"
fi

printf "${green}[ ? ] : Copy polybar config [Y/n] : ${yellow}"
read confirmation
if [ -z "$confirmation" ] || [[ ${confirmation,,} == "y" ]]; then
  printf "${blue}[ i ] : Copying polybar config...\n"
  mkdir -p ~/.config/polybar
  if [ -d ~/.config/polybar ]; then
    mv ~/.config/polybar ~/.config/polybar.$RANDOM.bak
    printf "${green}[ v ] : Created backup of polybar config in ~/.config/polybar/ !\n"
  fi
  if ! cp -r polybar ~/.config/polybar ; then
    printf "${red}[ x ] : An error occured copying polybar config !\n"
    exit 1
  fi
  printf "${green}[ v ] : Copied polybar config !\n"
fi

printf "${green}[ ? ] : Copy gtk config [Y/n] : ${yellow}"
read confirmation
if [ -z "$confirmation" ] || [[ ${confirmation,,} == "y" ]]; then
  printf "${blue}[ i ] : Copying gtk config...\n"
  mkdir -p ~/.config/gtk-3.0
  if [ -f ~/.config/gtk-3.0/gtk.css ]; then
    mv ~/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css.$RANDOM.bak
    printf "${green}[ v ] : Created backup of gtk config in ~/.config/gtk-3.0/ !\n"
  fi
  if ! cp gtk-3.0/gtk.css ~/.config/gtk-3.0/ ; then
    printf "${red}[ x ] : An error occured copying gtk config !\n"
    exit 1
  fi
  printf "${green}[ v ] : Copied gtk config !\n"
fi

printf "${green}[ ? ] : install gnome-terminal profile [Y/n] : ${yellow}"
read confirmation
if [ -z "$confirmation" ] || [[ ${confirmation,,} == "y" ]]; then
  if ! dconf dump /org/gnome/terminal/legacy/profiles:/ > ~/gnome-terminal-profiles-backup.dconf; then 
    printf "${red}[ x ] : An error occured creating gnome-terminal profile backup !\n"
    exit 1
  fi
  
  printf "${green}[ v ] : Created gnome-terminal profile backup !\n"
  if ! dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profile.dconf; then
    printf "${red}[ x ] : An error occured installing gnome-terminal profile !\n"
    exit 1
  fi
  
  printf "${green}[ v ] : Installed gnome-terminal profile !\n"
fi

printf "\n\n"
printf "${green}[ v ] : Finished !\n"
