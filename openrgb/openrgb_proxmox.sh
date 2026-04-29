#!/bin/bash

# --- Download OpenRGB Trixie build ---
wget https://codeberg.org/OpenRGB/OpenRGB/releases/download/release_candidate_1.0rc2/openrgb_1.0rc2_amd64_trixie_0fca93e.deb

# --- Install OpenRGB and fix missing dependencies ---
dpkg -i openrgb_1.0rc2_amd64_trixie_0fca93e.deb
apt --fix-broken install -y

# --- Verify install and turn off RGB ---
openrgb --version
openrgb --device 0 --mode static --color 000000

# --- Create systemd service to turn off RGB on every boot ---
cat > /etc/systemd/system/rgb-off.service << 'EOF'
[Unit]
Description=Turn off RGB on boot
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/usr/bin/openrgb --device 0 --mode static --color 000000
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

# --- Enable and start the service ---
systemctl daemon-reload
systemctl enable rgb-off.service
systemctl start rgb-off.service

# --- Verify service is running correctly ---
systemctl status rgb-off.service
