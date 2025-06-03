# Day 3 — Nginx Web Server + SSL/TLS

## Install Nginx

**Commands:**
```bash
sudo apt update
sudo apt install nginx -y
sudo systemctl status nginx
e

## Host a Simple Web Page

**Commands:**
```bash
echo "<h1>Welcome to My First Web Server</h1>" | sudo tee /var/www/html/index.html
curl ifconfig.me

## SSL/TLS with Let's Encrypt

**Commands:**
```bash
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx
sudo certbot renew --dry-run

## Nginx Security Hardening

**Commands:**
```bash
# Hide Nginx version
sudo nano /etc/nginx/nginx.conf
# Add inside http block:
server_tokens off;

# Disable unwanted HTTP methods
sudo nano /etc/nginx/sites-available/default
# Add inside server block:
if ($request_method !~ ^(GET|POST|HEAD)$ ) {
    return 444;
}

# Reload Nginx to apply changes
sudo systemctl reload nginx

## Nginx Log Analysis

**Commands:**
```bash
# Find top IP addresses accessing server
sudo awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -nr | head

# Find most common HTTP response codes
sudo awk '{print $9}' /var/log/nginx/access.log | sort | uniq -c | sort -nr
