# declare variables we going to use in this script
declare_variables() {
  information_text="./src/txt/information_manhelper.txt"
}

# print text of a specific file
print_text_file() {
  cat $1
}

# $1 => package name $2 => section name
# stackoverflow : https://unix.stackexchange.com/questions/268730/easy-way-to-just-print-the-man-page-intro-or-description
print_section_data() {
  man "$1" | col -bx | awk -v S="$2" '$0 ~ S {cap="true"; print} $0 !~ S && /^[A-Z ]+$/ {cap="false"} $0 !~ S && !/^[A-Z ]+$/ {if(cap == "true")print}'
}

# $1 => package name
# stackoverflow : https://unix.stackexchange.com/questions/268730/easy-way-to-just-print-the-man-page-intro-or-description
print_man_section() {
 man "$1" | col -bx | awk '/^[A-Z ]+$/ {print}'
}

# check if the system command is installed
check_system_command() {
  # check if the value of : command -v is null =/= system command not installed
  if [[ $(command -v $1) ]]
  then
    return 0
  else
    echo -e "${RED}$1 is not installed, try to install it before using this script${NC}"
    exit 1
  fi
}
