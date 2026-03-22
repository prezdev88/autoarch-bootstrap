# AutoArch Bootstrap

AutoArch Bootstrap is an installation script for Arch Linux designed to set up your system quickly, including the i3 window manager. This script is intended for a fresh and clean installation of Arch Linux.

## Key Features
- **Fast Installation:** One-liner to get a fully functional i3 environment.
- **Robustness:** Automated backups of your configuration files before overwriting.
- **Idempotency:** Skip unnecessary reinstallations (e.g., yay).
- **Customization:** Support for HiDPI/2K screens.

## Installation
### Standard Installation

First, ensure you have git installed:

```bash
sudo pacman -Sy --noconfirm git
```

Then, clone the repository and run the installation script:

```bash
git clone https://github.com/prezdev88/autoarch-bootstrap.git && cd autoarch-bootstrap && ./install
```

### Fast Installation

Use the following command to download and run the installation script directly:

```bash
curl --output get https://raw.githubusercontent.com/prezdev88/autoarch-bootstrap/master/get && chmod +x get && ./get
```

## Usage and Arguments
The `install` (and `get`) scripts accept the following optional arguments:

- `./install --2k`: Enable HiDPI/2K settings (Polybar DPI `140`, specific Xresources).
- `./install --no-pause` (or `-y`): Run the installation in non-interactive mode (no pauses between steps).
- `./install --2k --no-pause`: Combine both for an automated HiDPI setup.

## Safe Configuration Management
Every time the script installs a configuration (i3, Polybar, Dunst, etc.), it checks if a configuration already exists in your home directory. If found, it automatically creates a backup with a timestamp (e.g., `~/.config/i3.bak.20231027_120000`) before applying the new settings.
