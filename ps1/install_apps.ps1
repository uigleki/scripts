$apps = @(
    "7zip.7zip",
    "Canonical.Ubuntu",
    "Clementine.Clementine",
    "Cloudflare.Warp",
    "Cryptomator.Cryptomator",
    "Flow-Launcher.Flow-Launcher",
    "KDE.CrowTranslate",
    "KDE.KDEConnect",
    "Klocman.BulkCrapUninstaller",
    "MacType.MacType",
    "Mega.MEGASync",
    "Microsoft.PowerToys",
    "Microsoft.VisualStudioCode",
    "Mozilla.Firefox",
    "Obsidian.Obsidian",
    "Valve.Steam",
    "agalwood.Motrix",
    "c0re100.qBittorrent-Enhanced-Edition",
    "mpv.net",
)

foreach ($app in $apps) {
    winget install -e --id=$app
}
