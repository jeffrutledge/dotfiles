#!/bin/sh
#
# systemd
#
# This enables a service that locks on suspend

echo -e "\t - enabling suspend lock service."
sudo cp ./suspend@.service /etc/systemd/system/
sudo systemctl enable suspend@$USER
sudo systemctl start suspend@$USER

cursive_monagram_dir=~/safe/personal/graphics/sketches/cursive_monagram

if [ -f "$cursive_monagram_dir/cursive_monagram_solarized_1280x800.png" ] && [ -f "$cursive_monagram_dir/cursive_monagram_solarized_1920x1080.png" ]
then
  echo -e  "\t\t What lock image?"
  echo -e  "\t\t [1] cursive_monagram 1920x1080"
  echo -e  "\t\t [2] cursive_monagram 1280x800"
  echo -e  "\t\t [3] Nothing: make your own ~/.lock_screen_image.png"
  read -n 1 image_choice

  case "$image_choice" in
    1 )
      cp "$cursive_monagram_dir/cursive_monagram_solarized_1920x1080.png" ~/.lock_screen_image.png
      ;;
    2 )
      cp "$cursive_monagram_dir/cursive_monagram_solarized_1280x800.png" ~/.lock_screen_image.png
      ;;
    * )
      ;;
  esac
else
  echo -e "\t\t Rember to make your own ~/.lock_screen_image.png!"
fi

exit 0
