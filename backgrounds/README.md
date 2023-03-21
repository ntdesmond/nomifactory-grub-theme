# Switching backgrounds

This folder contains backgrounds that can be used as `background.png`.

[`switch_background.sh`](./switch_background.sh) switches `background.png` between the backgrounds in this folder.

To see a new image after each reboot, you may add this script to `crontab`:

```sh
@reboot cd /boot/grub*/themes/nomifactory-grub-theme/backgrounds/ && bash switch_background.sh
```
