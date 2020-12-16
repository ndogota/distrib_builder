source './src/bash/color.sh'

echo -e "${GREEN}Starting the iptables.sh script...${NC}"

# Remove configuration for all ports
echo -e "${GREEN}Droping all configuration...${NC}"
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT DROP

# Install packages
echo -e "${GREEN}Installing iptables...${NC}"
sudo apt-get install iptables -y
sudo apt-get install iptables-persistent -y

# Configure port 22 -> SSH
echo -e "${GREEN}Configure the port 22...${NC}"
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT

# Configure port 80 -> HTTP
echo -e "${GREEN}Configure the port 80...${NC}"
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT

echo -e "${GREEN}Saving iptables configuration...${NC}"
sudo iptables-save

echo -e "${GREEN}Set policy to the default configuration...${NC}"
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT

echo -e "${GREEN}Deleting all existing rules...${NC}"
sudo iptables -F INPUT
sudo iptables -F OUTPUT
sudo iptables -F FORWARD
