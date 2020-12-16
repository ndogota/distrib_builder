#!/bin/bash

source './src/bash/color.sh'
source './src/bash/tools_install.sh'

number_of_arguments=$#
number_of_folders=0

# this line make an array of arguments =/= $@ meaning all the arguments
array_of_args=("$@")

# declare an array with the list of folders
declare -a array_of_folders=()

launch_script() {
  for file in "${array_of_folders[$1]}/"*.sh
  do
    # execute the script and break if execution fails
    bash "$file" -H || break
  done
}

# install all scripts from all folders
all_install() {
  echo "Are you sure to install scripts from all folders ?"
  echo "Do you want to continue? [Y/n]"
  read input
  if [ "$input" = "Y" ] || [ "$input" = "y" ] || [ "$input" = "yes" ]
  then
    echo -e "${GREEN}Installing scripts from all folders...${NC}"
    for (( i=0; i < $number_of_folders; i++))
    do
      launch_script $i
    done
  else
    exit 1
  fi
}

# install the specific folder from the input
install_folder() {
  if [ $1 -gt 0 ] && [ $1 -le $number_of_folders ]
  then
    let "input--"
    echo -e "${GREEN}Installing scripts from the ${array_of_folders[$input]} folders...${NC}"
    launch_script $input
  else
    echo -e "${RED}The digit value is not between 0 and $number_of_folders${NC}"
  fi
}

# proessing the choice to know what to do
processing_the_choice() {
  echo "enter (1 - $number_of_folders) [Default All]:"]
  read input
  if [[ -z "$input" ]]
  then
    all_install
  # check if the input is a digital number
  elif [[ -n ${input//[0-9]/} ]]
  then
    echo -e "${RED}The input contain non-digit characters${NC}"
  else
    install_folder $input
  fi
}

# displaying the main menu
display_install_menu() {
  make_array_folders
  echo -e "${BLUE}found $number_of_folders folders:${NC}"
  for (( i=0, j=1; i < $number_of_folders; i++, j++))
  do
    echo "  $j - ${array_of_folders[$i]}"
  done
  processing_the_choice
}

# add all available folder in a array
make_array_folders() {
  for i in $(ls -d */)
  do
    if [[ ${i} = "src/" ]]
    then
      continue
    else
      array_of_folders+=(${i%%/})
      let "number_of_folders++"
    fi
  done
}

# checking arguments to know what to do
check_arguments() {
  if [[ $number_of_arguments -eq 0 ]]
  then
    display_install_menu
  elif [ ${array_of_args[0]} = "--help" ] && [ $number_of_arguments -eq 1 ]
  then
    print_text_file $information_text
  else
    echo -e "${RED}Invalid syntax, use --help.${NC}"
    exit 1
  fi
}

main() {
  declare_variables
  check_arguments
}

main
