# Day 2 — SSH Hardening + Firewall + Logs

## SSH Hardening

**Commands:**
```bash
sudo nano /etc/ssh/sshd_config
# Edited the following:
PermitRootLogin no        # Disable root login
Port 2222                 # Change SSH port to avoid bot attacks
AllowUsers ubuntu          # Allow only specific users
PasswordAuthentication no  # Disable password-based SSH login
ClientAliveInterval 300    # Send keepalive every 5 min
ClientAliveCountMax 0      # Disconnect idle sessions

## Firewall (iptables)

**Commands:**
```bash
sudo iptables -F                                 # Flush all existing rules
sudo iptables -A INPUT -p tcp --dport 2222 -j ACCEPT # Allow SSH on 2222
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT   # Allow HTTP (Web Server)
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT  # Allow HTTPS
sudo iptables -A INPUT -i lo -j ACCEPT               # Allow localhost traffic
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT  # Allow return traffic
sudo iptables -P INPUT DROP                          # Drop all other incoming traffic

# Save the firewall rules
sudo apt install iptables-persistent
sudo netfilter-persistent save

## Log Parsing (SSH logs)

**Commands:**
```bash
# View all SSH-related log entries
sudo grep "sshd" /var/log/auth.log

# Find failed login attempts
sudo grep "Failed password" /var/log/auth.log

# Find successful logins
sudo grep "Accepted" /var/log/auth.log

# Find failed attempts from a specific IP
sudo grep "Failed password" /var/log/auth.log | grep "192.168.1.10"
