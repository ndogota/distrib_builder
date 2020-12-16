#!/bin/bash

source './src/bash/color.sh'
source './src/bash/tools_manhelper.sh'

number_of_arguments=$#

# this line make an array of arguments =/= $@ meaning all the arguments
array_of_args=("$@")

# the function of --usageflag flag, we are a loop for every flags
usage_flag_function() {
  if [[ $number_of_arguments -gt 2 ]]
  then
    for ((i = 2 ; i < $number_of_arguments ; i++))
    do
      man ${array_of_args[0]} | grep -- " ${array_of_args[$i]} "
    done
  else
    echo -e "${RED}Invalid syntax, use the script without arguments to see the valid syntax${NC}"
    exit 1
  fi
}

# the function of --describe flag
# we added the available sections when the syntax is invalid
describe_function() {
  if [[ $number_of_arguments -gt 2 ]]
  then
    if [[ $(print_man_section ${array_of_args[0]} | grep -w ${array_of_args[2]}) ]]
    then
      print_section_data ${array_of_args[0]} ${array_of_args[2]}
    else
      echo -e "${RED}Invalid syntax, the sections available are :${NC}"
      print_man_section ${array_of_args[0]}
      exit 1
    fi
  else
    print_section_data ${array_of_args[0]} SYNOPSIS
    print_section_data ${array_of_args[0]} DESCRIPTION
  fi
}

# verify what flag we are using and use the function we need
check_script_flags() {
  if [[ ${array_of_args[1]} = "--usageflag" ]]
  then
    usage_flag_function
  elif [[ ${array_of_args[1]} = "--describe" ]]
  then
    describe_function
  else
    echo -e "${RED}Invalid syntax, use the script without arguments to see the valid syntax${NC}"
    exit 1
  fi
}

# check the syntax before searching in man
check_for_man_page() {
  if [[ $number_of_arguments -gt 1 ]]
  then
      check_script_flags
  else
      echo -e "${RED}Invalid syntax, use the script without arguments to see the valid syntax${NC}"
      exit 1
  fi
}

# check arguments and start to processing them
check_arguments() {
  if [[ $number_of_arguments -gt 0 ]]
  then
    check_for_man_page
  else
    print_text_file $information_text
  fi
}

main() {
  declare_variables
  check_system_command man
  check_arguments
}

main
