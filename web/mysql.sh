source './src/bash/color.sh'

echo -e "${GREEN}Starting the mysql.sh script...${NC}"

echo -e "${GREEN}Installing wget from the apt repository...${NC}"
sudo apt install wget

# installing the deb
cd /tmp
wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.15-1_all.deb

# installing mysql-server
echo -e "${GREEN}Updating repository and installing mysql-server...${NC}"
sudo apt update
sudo apt install mysql-server

echo -e "${GREEN}Starting the secure installation of mysql...${NC}"
# starting the secure installation of mysql
sudo mysql_secure_installation
