#!/usr/bin/env bash
set -eo pipefail

flatpak install -y \
        org.libreoffice.LibreOffice \
        com.valvesoftware.Steam \
        com.google.Chrome
