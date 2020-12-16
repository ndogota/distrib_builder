source './src/bash/color.sh'

echo -e "${GREEN}Starting the apache.sh script...${NC}"

echo -e "${GREEN}Updating the repository and installing apache2...${NC}"
sudo apt update
sudo apt install apache2
