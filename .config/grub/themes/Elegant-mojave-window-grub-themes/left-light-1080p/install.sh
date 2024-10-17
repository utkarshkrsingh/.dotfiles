#!/bin/bash

# Grub2 Theme

ROOT_UID=0
THEME_DIR="/usr/share/grub/themes"
THEME_NAME=Elegant-mojave-window-left-light

MAX_DELAY=20                                        # max delay for user to enter root password

#COLORS
CDEF=" \033[0m"                                     # default color
CCIN=" \033[0;36m"                                  # info color
CGSC=" \033[0;32m"                                  # success color
CRER=" \033[0;31m"                                  # error color
CWAR=" \033[0;33m"                                  # waring color
b_CDEF=" \033[1;37m"                                # bold default color
b_CCIN=" \033[1;36m"                                # bold info color
b_CGSC=" \033[1;32m"                                # bold success color
b_CRER=" \033[1;31m"                                # bold error color
b_CWAR=" \033[1;33m"                                # bold warning color

# echo like ...  with  flag type  and display message  colors
prompt () {
  case ${1} in
    "-s"|"--success")
      echo -e "${b_CGSC}${@/-s/}${CDEF}";;          # print success message
    "-e"|"--error")
      echo -e "${b_CRER}${@/-e/}${CDEF}";;          # print error message
    "-w"|"--warning")
      echo -e "${b_CWAR}${@/-w/}${CDEF}";;          # print warning message
    "-i"|"--info")
      echo -e "${b_CCIN}${@/-i/}${CDEF}";;          # print info message
    *)
    echo -e "$@"
    ;;
  esac
}

# Welcome message
prompt -s "\n ${THEME_NAME} - Grub2 Theme \n"

# Check command avalibility
function has_command() {
  command -v $1 > /dev/null
}

prompt -w "Checking for root access...\n"

# Checking for root access and proceed if it is present
if [ "$UID" -eq "$ROOT_UID" ]; then

  # Create themes directory if not exists
  prompt -i "Checking for the existence of themes directory...\n"
  [[ -d ${THEME_DIR}/${THEME_NAME} ]] && rm -rf ${THEME_DIR}/${THEME_NAME}
  mkdir -p "${THEME_DIR}/${THEME_NAME}"

  # Copy theme
  prompt -i "Installing ${THEME_NAME} theme...\n"

  cp -a ${THEME_NAME}/* ${THEME_DIR}/${THEME_NAME}

  # Set theme
  prompt -i "Setting ${THEME_NAME} as default...\n"

  # Backup grub config
  cp -an /etc/default/grub /etc/default/grub.bak

  grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub

  echo "GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"" >> /etc/default/grub

  # Update grub config
  prompt -i "Updating grub config...\n"
  if has_command update-grub; then
    update-grub
  elif has_command grub-mkconfig; then
    grub-mkconfig -o /boot/grub/grub.cfg
  # Check for OpenSuse (regular or microOS)
  elif has_command zypper || has_command transactional-update; then
    grub2-mkconfig -o /boot/grub2/grub.cfg
  # Check for Fedora (regular or Atomic)
  elif has_command dnf || has_command rpm-ostree; then
    # Check for UEFI
    if [[ -f /boot/efi/EFI/fedora/grub.cfg ]]; then
      prompt -s "Find config file on /boot/efi/EFI/fedora/grub.cfg ...\n"
      grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
    # Check for BIOS
    elif [[ -f /boot/grub2/grub.cfg ]]; then
      prompt -s "Find config file on /boot/grub2/grub.cfg ...\n"
      grub2-mkconfig -o /boot/grub2/grub.cfg
    fi
  fi

  # Success message
  prompt -s "\n All done! \n"
else
  # Error message
  prompt -e "[ Error! ] -> Run me as root "

  # persisted execution of the script as root
  read -p "[ trusted ] specify the root password : " -t${MAX_DELAY} -s
  [[ -n "$REPLY" ]] && {
    sudo -S <<< $REPLY $0
  } || {
    prompt  "Operation canceled  Bye"
    exit 1
  }
fi
