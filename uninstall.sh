#!/bin/bash
timer_dir=/etc/eye-timer
systemd_user_dir=/etc/systemd/user

if [ "$(id -u)" -eq 0 ]; then
    echo "This script should be run by the user, not as root."
    exit 1
fi

echo "Stopping and disabling the eye reminder timer."
systemctl --user stop eye-reminder.timer
systemctl --user disable eye-reminder.timer

echo "Removing service and timer files from systemd directory $systemd_user_dir."
sudo rm $systemd_user_dir/eye-reminder.service
sudo rm $systemd_user_dir/eye-reminder.timer

echo "Reloading systemd daemon."
systemctl --user daemon-reload

echo "Removing timer directory $timer_dir and notification script."
sudo rm -r $timer_dir

echo "Uninstall completed."
