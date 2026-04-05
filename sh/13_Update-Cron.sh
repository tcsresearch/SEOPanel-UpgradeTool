# Edit crontab
crontab -e

# Ensure paths point to new installation
*/30 * * * * php /var/www/html/seopanel/cron.php
