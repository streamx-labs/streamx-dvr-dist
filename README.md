# StreamX DVR

[![Latest release](https://img.shields.io/github/v/release/streamx-labs/streamx-dvr-dist?sort=semver&label=release)](https://github.com/streamx-labs/streamx-dvr-dist/releases/latest)
[![Release date](https://img.shields.io/github/release-date/streamx-labs/streamx-dvr-dist)](https://github.com/streamx-labs/streamx-dvr-dist/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/streamx-labs/streamx-dvr-dist/total)](https://github.com/streamx-labs/streamx-dvr-dist/releases)
[![Docker image](https://github.com/streamx-labs/streamx-dvr-dist/actions/workflows/docker.yml/badge.svg)](https://github.com/streamx-labs/streamx-dvr-dist/actions/workflows/docker.yml)
[![ghcr.io](https://img.shields.io/badge/ghcr.io-streamx--labs%2Fstreamx--dvr-2496ED?logo=docker&logoColor=white)](https://github.com/streamx-labs/streamx-dvr-dist/pkgs/container/streamx-dvr)
<br>
[![Platforms](https://img.shields.io/badge/platforms-macOS%20%7C%20Windows%20%7C%20Linux%20%7C%20Docker-informational)](#downloads)
[![Architectures](https://img.shields.io/badge/arch-x86__64%20%7C%20arm64-informational)](#downloads)
[![macOS](https://img.shields.io/badge/macOS-notarized-success?logo=apple&logoColor=white)](#macos)
[![Swift Package Manager](https://img.shields.io/badge/SPM-iOS%2015%20%7C%20tvOS%2015-F05138?logo=swift&logoColor=white)](#swift-package-for-app-developers)

StreamX DVR is a self-hosted DVR for the StreamX app. It records live IPTV channels from your Xtream or M3U provider, downloads past programmes through catch-up, and plays the recordings back on your iPhone, iPad and Apple TV over your local network.

Run it on a Mac, a Windows PC, a Linux server, a NAS or a Raspberry Pi. Everything is configured from a built-in web admin.

## Features

- **Scheduled and recurring recordings**, with start-early and end-late padding.
- **Catch-up downloads** of programmes that already aired, and an automatic catch-up fallback when a live recording fails.
- **Provider-aware**: never opens more simultaneous streams than your provider allows.
- **Commercial detection** (optional, Comskip) with skip markers in the StreamX player. The original video is never modified.
- **Stream copy, no transcoding**: recordings keep the original quality and use little CPU.
- **Secure pairing**: a 6-digit code pairs each device; every request is signed and stream credentials are encrypted at rest.
- **Automatic discovery** on the local network (Bonjour).
- **Desktop app** for macOS and Windows with notifications and signed updates; **self-updating** Linux service; **Docker** image.

## Downloads

<!-- release-downloads:start -->
Latest release: **[0.1.16](https://github.com/streamx-labs/streamx-dvr-dist/releases/tag/v0.1.16)**

| Platform | Desktop app / installer | Headless server |
|---|---|---|
| macOS (Apple Silicon) | [StreamX DVR.dmg](https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.16/streamx-dvr-companion_0.1.16_darwin-aarch64.dmg) | [streamx-dvr_0.1.16_darwin-aarch64.tar.gz](https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.16/streamx-dvr_0.1.16_darwin-aarch64.tar.gz) |
| Windows (x64) | [Installer (.exe)](https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.16/streamx-dvr-companion_0.1.16_windows-x86_64-setup.exe) | [streamx-dvr_0.1.16_windows-x86_64.zip](https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.16/streamx-dvr_0.1.16_windows-x86_64.zip) |
| Linux (x64) | [setup.sh](#linux-systemd) | [streamx-dvr_0.1.16_linux-x86_64.tar.gz](https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.16/streamx-dvr_0.1.16_linux-x86_64.tar.gz) |
| Linux (arm64, Raspberry Pi) | [setup.sh](#linux-systemd) | [streamx-dvr_0.1.16_linux-aarch64.tar.gz](https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.16/streamx-dvr_0.1.16_linux-aarch64.tar.gz) |

Docker: `ghcr.io/streamx-labs/streamx-dvr:0.1.16` · Checksums: [SHA256SUMS](https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.16/SHA256SUMS)
<!-- release-downloads:end -->

All files, including previous versions, are on the [Releases](https://github.com/streamx-labs/streamx-dvr-dist/releases) page.

**Which one should I pick?**

| You have… | Install |
|---|---|
| A Mac or a Windows PC | The [desktop app](#desktop-app): it includes the server, FFmpeg and Comskip. |
| A Linux machine with systemd (Debian 13, Ubuntu 25.04+, Raspberry Pi OS trixie 64-bit) | The [Linux installer](#linux-systemd). |
| Docker, a NAS, or an older Linux (Ubuntu 24.04, Debian 12, Raspberry Pi OS bookworm) | The [Docker image](#docker). |
| Anything else | A [headless server archive](#headless-server). |

A recording needs the machine awake. For unattended recording, prefer an always-on machine (NAS, Raspberry Pi, desktop) over a laptop.

## Desktop app

### macOS

Requires macOS 13 or later on an Apple Silicon Mac. The app is signed with a Developer ID and notarized by Apple.

1. Open the `.dmg` and drag **StreamX DVR** into Applications.
2. Launch it. It lives in the menu bar and starts the server.
3. On first launch, the Pairing page opens with a code to enter in the StreamX app.

### Windows

Requires Windows 10 or 11 (x64) and the Microsoft Edge WebView2 Runtime (preinstalled on Windows 11).

1. Run the `-setup.exe` installer. The installer is not Authenticode-signed yet, so SmartScreen may ask you to confirm (**More info → Run anyway**).
2. Launch **StreamX DVR** from the Start menu. It lives in the system tray and starts the server.

From the menu-bar or tray icon: server status, **Open Web Admin…**, **Pair a Device…**, **Logs…**, **Check for Update**. The app restarts the server if it stops and shows a notification for every recording outcome.

## Linux (systemd)

For 64-bit x86 or ARM hosts with systemd.

1. **Install FFmpeg 7 or newer first.** The script does not install it and stops if `ffmpeg` or `ffprobe` is missing or older than version 7:

   ```bash
   sudo apt update && sudo apt install -y ffmpeg
   ffmpeg -version | head -n 1      # must show version 7 or newer
   ```

   Debian 13, Ubuntu 25.04 or later and Raspberry Pi OS trixie (64-bit) ship FFmpeg 7. Ubuntu 24.04, Debian 12 and Raspberry Pi OS bookworm ship an older version: use the [Docker image](#docker) instead, or put static FFmpeg and ffprobe 7 builds on `PATH`.

2. **Run the installer:**

   ```bash
   curl -fsSL https://github.com/streamx-labs/streamx-dvr-dist/releases/latest/download/setup.sh | sudo bash
   ```

   On a first install it asks for a password for the StreamX DVR web admin. This is not a Linux account password: no system user is changed.

The script verifies the release checksum, creates a `streamx-dvr` system user, installs the server in `/opt/streamx-dvr/` (data in `data/`, recordings in `recordings/`), and starts the `streamx-dvr` service on port 8181. Logs: `journalctl -u streamx-dvr`.

- **Updates** are automatic when enabled in the admin Settings, and never start during a recording or within 10 minutes of one. Update by hand with `sudo -u streamx-dvr /opt/streamx-dvr/streamx-dvr update --data-dir /opt/streamx-dvr/data`, or by running `setup.sh` again.
- **Rollback**: stop the service, `sudo -u streamx-dvr touch /opt/streamx-dvr/data/update.hold`, copy `/opt/streamx-dvr/streamx-dvr.previous` over `/opt/streamx-dvr/streamx-dvr`, start the service. Delete `update.hold` to resume automatic updates.
- **Uninstall**: `sudo systemctl disable --now streamx-dvr`, delete `/etc/systemd/system/streamx-dvr.service` and `/opt/streamx-dvr` (this deletes your recordings), then `sudo userdel streamx-dvr`.

## Docker

Multi-arch image for `linux/amd64` and `linux/arm64`, with FFmpeg 7.1, running as uid/gid 1000.

```bash
docker run -d --name streamx-dvr --restart unless-stopped --network host \
  -v /path/to/data:/data -v /path/to/recordings:/recordings \
  ghcr.io/streamx-labs/streamx-dvr:latest
```

Or with Docker Compose:

```yaml
services:
  streamx-dvr:
    image: ghcr.io/streamx-labs/streamx-dvr:latest
    container_name: streamx-dvr
    restart: unless-stopped
    network_mode: host
    volumes:
      - /path/to/data:/data
      - /path/to/recordings:/recordings
```

- **Networking**: host networking lets the StreamX app discover the server automatically. Without it, publish the port with `-p 8181:8181` and pair by IP address and port 8181.
- **Permissions**: both folders must be writable by uid 1000: `sudo chown -R 1000:1000 /path/to/data /path/to/recordings`.
- **Admin password**: `docker exec -it streamx-dvr streamx-dvr admin set-password`.
- **Pairing code**: `docker exec -it streamx-dvr streamx-dvr pair`.
- **Updates**: pull a newer tag and recreate the container (`docker compose pull && docker compose up -d`). The container never updates itself.
- **Tags**: `latest`, `<major>.<minor>` (for example `0.1`) and the exact version (for example `0.1.13`).
- Commercial detection is not available in the image (Comskip is not included).

## Headless server

1. Download and extract the archive for your platform.
2. Install FFmpeg and ffprobe 7 or newer and put them on `PATH` (or pass `--ffmpeg-path`). For commercial detection, also put Comskip on `PATH`.
3. Start the server:

```bash
./streamx-dvr --data-dir ./data --recordings-dir ./recordings          # macOS, Linux
.\streamx-dvr.exe --data-dir .\data --recordings-dir .\recordings      # Windows PowerShell
```

`streamx-dvr --help` lists every option; each one can also be set as an environment variable.

## Set up and pair

1. Open the web admin at `http://<server-address>:8181/`. Without a password, it only opens on the server machine itself: set one in **Settings** (or `streamx-dvr admin set-password`) to reach it from another device.
2. Optionally adjust the recordings folder, default padding and provider connection limits in **Settings**. Providers come from the StreamX app: nothing to enter on the server.
3. Open pairing from the **Pairing** page (or run `streamx-dvr pair`) to get a 6-digit code.
4. In the StreamX app, open **Settings → Advanced → Recording DVR**, pick the server found on your network (or enter its address and port 8181), and enter the code.

You can then schedule recordings from the guide, a channel or the player, and watch them in **My recordings**. Requires a StreamX app version with DVR support.

## Verify your download

Every release includes `SHA256SUMS`:

```bash
sha256sum --ignore-missing -c SHA256SUMS      # Linux
shasum -a 256 --ignore-missing -c SHA256SUMS  # macOS
```

Desktop app updates and the Linux self-update are also verified against a signing key built into the app before they install.

## Security and privacy

- StreamX DVR is designed for your **local network**. Do not expose port 8181 to the internet.
- Your provider URLs and credentials stay on your server, encrypted at rest. They are never sent back to the app or written to logs.
- While a recording runs, the stream URL is on FFmpeg's command line, so other user accounts on the same machine can see it. Run the server where you trust the other local users.

## Swift package (for app developers)

This repository is also the Swift package `StreamXPairing` (iOS 15 and tvOS 15, arm64), used by the StreamX app to pair with and sign requests for a StreamX DVR server.

<!-- release-spm:start -->
```swift
.package(url: "https://github.com/streamx-labs/streamx-dvr-dist.git", from: "0.1.16")
```
<!-- release-spm:end -->

Add the `StreamXPairing` product to your target. Package versions follow the server releases.

## Third-party software

- The desktop app bundles a minimal build of [FFmpeg](https://ffmpeg.org), licensed under the GNU LGPL v2.1.
- It also bundles [Comskip](https://github.com/erikkaashoek/Comskip) as a separate executable, licensed under the GNU GPL v2 or later.

Each release includes the corresponding FFmpeg and Comskip source archives, their build scripts and license texts.
