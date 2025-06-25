#!/bin/bash
timer_dir=/etc/eye-timer
systemd_user_dir=/etc/systemd/user


if [ "$(id -u)" -eq 0 ]; then
    echo "This script should be ran by the user, not as root."
    exit 1
fi

echo creating timer directory $timer_dir
sudo mkdir $timer_dir
echo mvoing notification script to timer directory
sudo cp ./notification-script.sh $timer_dir
echo making notification script executable
sudo chmod +x $timer_dir/notification-script.sh
echo moving service file and timer file to systemd directory $systemd_user_dir
sudo cp ./eye-reminder.service $systemd_user_dir
sudo cp ./eye-reminder.timer $systemd_user_dir

echo reloading systemd and starting the eye reminder timer.
systemctl --user daemon-reload
systemctl --user enable eye-reminder.timer
systemctl --user start eye-reminder.timer

echo installation complete.
