source './src/bash/color.sh'

echo -e "${GREEN}Starting the php.sh script...${NC}"

echo -e "${GREEN}Update the repository and install libapache2...${NC}"
sudo apt update
sudo apt install libapache2-mod-php
echo -e "${GREEN}Restart apache2...${NC}"
sudo systemctl restart apache2

echo -e "${GREEN}Creating the index.php file with the phpinfo()...${NC}"
sudo touch /var/www/html/index.php
sudo bash -c 'echo "<?php phpinfo(); ?>" > /var/www/html/index.php'

echo -e "${GREEN}Launching firefox with the phpinfo() displayed...${NC}"
# Display phpinfo() directly in browser
firefox --url localhost/index.php
