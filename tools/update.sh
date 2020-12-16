source './src/bash/color.sh'

echo -e "${GREEN}Starting the update.sh script...${NC}"

echo -e "${GREEN}Updating the repository and remove unused packages...${NC}"
sudo apt-get update
sudo apt autoremove

echo -e "${GREEN}Fixing cdrom deb source file (/etc/apt/sources.list)...${NC}"
sudo sed -i "/deb cdrom/d" /etc/apt/sources.list
