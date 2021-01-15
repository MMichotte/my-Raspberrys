# my-Raspberrys
Project to organize and maintain my Raspberry pi's.

1. Create a folder for your new ubuntu-server with your configuration files (see example)
2. Burn Ubuntu-server image on SD-card
3. Run './scripts/configure_sd.sh'
4. Insert sd card in your device and let it boot! (use ping x.x.x.x to see when your device is available)
5. SSH into it and change user password.
6. Reboot the device. 
7. Run './scripts/post_first_boot.sh'
8. Run './scripts/install_pkgs.sh'
9. Run './scripts/install_services.sh'
 