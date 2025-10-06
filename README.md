# MiniOS Dracut

Dracut modules and tools for building MiniOS-compatible initramfs images.

## Contents

- **mkdracut** - Script to build MiniOS initramfs
- **90minios** - Core MiniOS dracut module
- **99minios-cleanup** - Cleanup module
- **90-minios.conf** - MiniOS dracut configuration

## Installation

```bash
dpkg-buildpackage -b -uc -us
sudo dpkg -i ../minios-dracut_*.deb
```

## Usage

```bash
sudo mkdracut -k $(uname -r)        # Basic
sudo mkdracut -k $(uname -r) -n -c  # With network and cloud support
```

Options: `-k` kernel, `-o` output, `-n` network, `-c` cloud, `-d` debug

## License

GPL-3.0+ - MiniOS Linux <https://minios.dev>
