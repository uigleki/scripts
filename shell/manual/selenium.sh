#!/usr/bin/env bash
set -eo pipefail

sudo pacman -S --noconfirm python-pip geckodriver
pip install selenium
