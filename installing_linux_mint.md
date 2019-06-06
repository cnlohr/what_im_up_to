CNLohr's guide for installing Linux Mint 19.1

For installation:
 * Do a custom install.  Resize windows, if you wanna keep it.  These parts are TOTALLY optional.  You can use any of the installation options.
 * 1024 MB for /boot (Ext4)
 * rest - 1024 for / (Ext4)
 * ending: swap.
 * Encrypt home folder.

Running for the first time:
 * Login
 * Uncheck show dialog at startup.
 * Start menu -> Mouse -> Touchpad -> Uncheck Enable Natural Scrolling
 * Start menu -> Desktop Settings -> Windows -> Manager -> Metacity
 * Start menu -> Driver Manager -> Install that sweet sweet NVIDIA Stuff. (Do this last, and restart)

Execute from command-line:
 * `sudo usermod -aG dialout <username>`
 * `sudo apt-get remove btrfs-tools btrfs-progs --purge` #btrfs tools slow your computer down a lot on boot.  Nix em.
 * `sudo apt-get remove brltty --purge` #brltty is EVIL.  IT messes with devices you plug into your computer that show up as COM ports.
 * `sudo systemctl disable ModemManager.service`
 * `sudo apt-get update`
 * `sudo apt-get dist-upgrade`
 * `sudo apt-get install build-essential chromium-browser aisleriot git python2`
 * `sudo nano /etc/default/grub`
   * `GRUB_CMDLINE_LINUX_DEFAULT="vga=normal nofb"`
   * `GRUB_GFXPAYLOAD_LINUX=text`
 * sudo nano /etc/grub.d/10_linux
   * Comment out the inside of any `load_video` lines.
   * Change gfxmode to text.
 * sudo update-grub2

Setting up firefox:
 * Add search bar
 * Properties for bar -> Change search settings.  At bottom find more search engines.
 * Click on the google G.
 * Go back into the settings.  Make Google default.

Just FYI: On some laptops, you need to first boot and install in discrete mode before you can switch to hybird mode.