# Add the SSD
```bash
sudo nano /etc/fstab;
```
# Confirm the device name
```bash
lsblk -f && 
```
# Make directory and mount

```bash
sudo mkdir -p /mnt/xavier_ssd && sudo mount /dev/nvme0n1 /mnt/xavier_ssd
```
