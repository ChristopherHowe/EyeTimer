# Eye Timer

Eye Timer is a lightweight utility designed to help you protect your eyes by reminding you to take regular breaks from your screen. This project uses GNOME notifications and systemd timers to periodically prompt you to look away and rest your eyes.

## How it works

Eye Timer uses a systemd timer to run a small script at your chosen interval. The script sends a desktop notification reminding you to take a break, following the 20-20-20 rule (every 20 minutes, look at something 20 feet away for 20 seconds).

## Installation

```bash
chmod +x install.sh
./install.sh
```

This will install the notification script and systemd units to your user environment and start the timer.

## Uninstallation

```bash
chmod +x uninstall.sh
./uninstall.sh
```

This will stop and remove the timer and all installed files.

## Requirements

- Linux with systemd (tested on GNOME)
- `notify-send` (usually available via `libnotify-bin`)

## Customization

You can change the reminder interval by editing `eye-reminder.timer` and the notification message by editing `notification-script.sh` before running the install script.
