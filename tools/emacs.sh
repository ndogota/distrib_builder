source './src/bash/color.sh'

echo -e "${GREEN}Starting the emacs.sh script...${NC}"

echo -e "${GREEN}Installing emacs from apt repository...${NC}"
sudo apt-get install -y emacs

echo -e "${GREEN}Verify if the std_comment.el file exist...${NC}"
# Verify if file isn't already here
if [ ! -f ~/.emacs.d/lisp/std_comment.el ]
then
  echo -e "${GREEN}Downloading the std_comment.el file...${NC}"
  wget https://raw.githubusercontent.com/etna-alternance/std_comment/master/std_comment.el
  read -p "What's your etna login ? " etna_login
  echo "(setq header-etna-login "$etna_login")" >> ./std_comment.el

  echo -e "${GREEN}Adding the file in the configuration of emacs...${NC}"
  # Add file ~/.emacs.d/lisp/std_comment.el
  mkdir -p ~/.emacs.d/lisp
  echo -e "${GREEN}Folders .emacs.d/lisp/ created successfully${NC}"
  mv ./std_comment.el ~/.emacs.d/lisp
  echo -e "${GREEN}File std_comment.el added successfully${NC}"
fi

# Add file ~/.emacs if not exist
if [ ! -f ~/.emacs ]
then
    echo "(add-to-list 'load-path \"~/.emacs.d/lisp/\")
    (load-file \"~/.emacs.d/lisp/std_comment.el\")" >> ~/.emacs
    echo -e "${GREEN}File .emacs added successfully${NC}"
fi
