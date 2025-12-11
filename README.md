# Simple Battery Monitor

A lightweight bash script for monitoring battery status on Linux systems in real-time.

## Features

- Automatic installation of `acpi` if not present
- Real-time battery percentage display
- Shows charging/discharging status
- Displays remaining time until full charge or empty battery
- Updates every 0.5 seconds on the same line
- Compatible with major Linux distributions

## Supported Distributions

- Ubuntu / Ubuntu Server
- Debian
- Arch Linux
- Fedora
- CentOS / RHEL
- openSUSE
- And other distributions with apt, dnf, yum, pacman, or zypper

## Installation & Usage

### Run directly without downloading

```bash
bash <(curl -sL https://raw.githubusercontent.com/dddevid/Simple-Battery-Monitor/refs/heads/main/battery_monitor.sh)
```

Or with wget:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/dddevid/Simple-Battery-Monitor/refs/heads/main/battery_monitor.sh)
```

### Download and run

```bash
curl -O https://raw.githubusercontent.com/dddevid/Simple-Battery-Monitor/refs/heads/main/battery_monitor.sh
chmod +x battery_monitor.sh
./battery_monitor.sh
```

## Requirements

- Bash shell
- Root/sudo access (only required if `acpi` needs to be installed)
- `acpi` package (automatically installed if missing)

## Usage

Simply run the script and it will display battery information that updates every 0.5 seconds:

```
Battery: 85% - Discharging (02:34:12 remaining)
```

Press `Ctrl+C` to exit.

## Output Examples

- `Battery: 100% - Full`
- `Battery: 75% - Discharging (03:21:45 remaining)`
- `Battery: 45% - Charging (01:15:30 until full)`

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
