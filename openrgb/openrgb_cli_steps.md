### Get Trixie build

```bash
wget https://codeberg.org/OpenRGB/OpenRGB/releases/download/release_candidate_1.0rc2/openrgb_1.0rc2_amd64_trixie_0fca93e.deb
```
### Install OpenRGB

```bash
dpkg -i openrgb_1.0rc2_amd64_trixie_0fca93e.deb
apt --fix-broken install -y
```

### Verify and turn off RGB

```bash
openrgb --version
openrgb --device 0 --mode static --color 000000
```

### Setup systemd service

```bash
nvim /etc/systemd/system/rgb-off.service
```

```bash
[Unit]
Description=Turn off RGB on boot
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/usr/bin/openrgb --device 0 --mode static --color 000000
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

### Enable service

```
systemctl daemon-reload
systemctl enable rgb-off.service
systemctl start rgb-off.service
```

### Verify service status

```
systemctl status rgb-off.service
```
