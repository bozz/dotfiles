#!/usr/bin/env bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[1;93m"
ENDCOLOR="\033[0m"

echo -e "${YELLOW}==================${ENDCOLOR}"
echo -e "${YELLOW}Dotfiles Bootstrap${ENDCOLOR}"
echo -e "${YELLOW}==================${ENDCOLOR}"
echo -e "...checking system"

if ! command -v node &> /dev/null
then
    echo "node could not be found"
    exit 1
else
  echo "node exits!"
fi

