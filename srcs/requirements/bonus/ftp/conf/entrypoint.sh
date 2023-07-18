#!/bin/sh

if ! grep -q "^${WP_USER}:" /etc/group; then
    addgroup -g 4242 ${WP_USER}
fi

# Check if the user exists
if ! id "${WP_USER}" &>/dev/null; then
    adduser -G ${WP_USER} ${WP_USER} << EOF
${WP_PASSWORD}
${WP_PASSWORD}
EOF
fi

mkdir -p /home/${WP_USER}/ftp/files
chown -R nobody:nogroup /home/${WP_USER}/ftp
chmod 755 -R /home/${WP_USER}/ftp
chown -R ${WP_USER}:${WP_USER} /home/${WP_USER}/ftp/files

exec vsftpd /etc/vsftpd.conf
