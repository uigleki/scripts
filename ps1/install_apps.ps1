$apps = @(
    "7zip.7zip",
    "Cloudflare.Warp",
    "Cryptomator.Cryptomator",
    "DuongDieuPhap.ImageGlass",
    "GermanCoding.SyncTrayzor",
    "Git.Git",
    "HeroicGamesLauncher.HeroicGamesLauncher",
    "KDE.KDEConnect",
    "Klocman.BulkCrapUninstaller",
    "Microsoft.PowerToys",
    "Mozilla.Firefox",
    "Sandboxie.Plus",
    "Tailscale.Tailscale",
    "Valve.Steam",
    "agalwood.Motrix",
    "c0re100.qBittorrent-Enhanced-Edition",
    "mpv.net",
    "zhongyang219.TrafficMonitor.Lite"
)

foreach ($app in $apps) {
    winget install -e --id=$app
}
