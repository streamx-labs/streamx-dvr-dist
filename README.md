# StreamX DVR

A self-hosted DVR server for recording live IPTV programmes and serving recordings over your local network.

StreamX DVR supports Xtream and M3U sources, scheduled recordings, catch-up downloads, and HLS playback. The desktop companion provides a menu-bar or system-tray app with an embedded web admin.

StreamX app DVR integration is under development.

## Downloads

Download the latest release (https://github.com/streamx-labs/streamx-dvr-dist/releases/latest)

If no release is listed, the first public build has not been published yet.

| Platform | Desktop companion | Headless server |
|---|---|---|
| macOS — Apple Silicon | .dmg | .tar.gz |
| Windows — x64 | NSIS installer (-setup.exe) | .zip |
| Linux — x64 | — | .tar.gz |
| Linux — arm64 | — | .tar.gz |

Choose assets containing streamx-dvr-companion for the desktop app or streamx-dvr_ for the headless server.

Linux arm64 builds require a 64-bit operating system, including on Raspberry Pi.

## Desktop installation

### macOS

Requires macOS 13 or later and an Apple Silicon Mac.

1. Download and open the .dmg.
2. Drag StreamX DVR into Applications.
3. Launch the app and select Open Web Admin… from its menu-bar icon.

### Windows

Requires Windows 10/11 x64 and Microsoft Edge WebView2 Runtime.

1. Download and run the -setup.exe installer.
2. Launch StreamX DVR.
3. Select Open Web Admin… from its system-tray menu.

The desktop companion includes the server, FFmpeg and ffprobe.

Desktop packages are not yet notarized by Apple or Authenticode-signed for Windows. Signed updater artifacts use a separate signature system.

## Headless installation

1. Download and extract the archive for your platform.
2. Install FFmpeg and ffprobe version 7 or newer, available on PATH.
3. Start the server.

On macOS or Linux:

./streamx-dvr --data-dir ./data --recordings-dir ./recordings

On Windows PowerShell:

.\streamx-dvr.exe --data-dir .\data --recordings-dir .\recordings

Open http://127.0.0.1:8181 on the server machine.

Set an admin password in Settings before accessing the admin from another device. Recording and playback are intended for use on your local network.

## Updates and verification

The desktop companion supports signed updates through Check for Update.

Releases include:

- Desktop installers and headless server archives.
- Signed desktop updater artifacts and latest.json.
- SHA256SUMS for verifying downloaded files.
- The corresponding FFmpeg source archive, build script and LGPL license.

Keep your data and recordings directories when updating a headless installation.

## Docker

Docker distribution is planned. No official container image is published by this release workflow yet.

## FFmpeg

The desktop companion bundles a minimal LGPL build of FFmpeg.

Each release provides the matching FFmpeg sources, build script and GNU LGPL v2.1 license. Headless installations use your system-installed FFmpeg and ffprobe.
