# scripts

🛠️ Personal scripts collection

## ✨ Features

- System setup automation
- Development environment configuration
- Various utility scripts

## System Setup

### Linux by nix

See [dotfiles](https://github.com/uigleki/dotfiles)

### Windows

1. Download [Win11](https://www.microsoft.com/software-download/windows11)
2. Upgrade to Pro version
3. Configure critical settings:
   - Set sleep & hibernate timeouts: Never
   - Disable Delivery Optimization
4. Update system to latest version
5. Enable Windows features:
   - Hyper-V
   - Virtual Machine Platform
   - Windows Subsystem for Linux
6. Update Microsoft Store applications
7. [Gruvbox Light theme](https://windowsterminalthemes.dev/?theme=Gruvbox+Light) for Terminal

```powershell
wsl --update
iwr -useb https://raw.githubusercontent.com/uigleki/scripts/main/ps1/install_apps.ps1 | iex
```

Optional Optimizations:

1. Disable HAGS (Hardware-Accelerated GPU Scheduling)
   - Consider keeping if using high-end GPU
2. Disable CABC (Content Adaptive Brightness Control)
   - Fixes severe brightness reduction issues
3. Disable fast startup
   - If experiencing boot issues

Also see [toolkit](https://github.com/uigleki/toolkit)

## 📄 License

[AGPL-3.0](LICENSE)
