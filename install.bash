curl -fsSL https://get.docker.com | sh
mkdir -p /var/log/remnanode
apt install logrotate
tee /etc/logrotate.d/remnanode > /dev/null <<EOF
/var/log/remnanode/*.log {
		size 50M
		rotate 5
		compress
		missingok
		notifempty
		copytruncate
}
EOF
logrotate -vf /etc/logrotate.d/remnanode
docker compose up -d
