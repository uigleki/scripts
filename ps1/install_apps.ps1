$apps = @(
    "7zip.7zip",
    "AnyAssociation.Anytype",
    "Clementine.Clementine",
    "Cloudflare.Warp",
    "Cryptomator.Cryptomator",
    "DuongDieuPhap.ImageGlass",
    "GermanCoding.SyncTrayzor",
    "Git.Git",
    "HeroicGamesLauncher.HeroicGamesLauncher",
    "KDE.CrowTranslate",
    "KDE.KDEConnect",
    "Klocman.BulkCrapUninstaller",
    "Mega.MEGASync",
    "Microsoft.PowerToys",
    "Microsoft.VisualStudioCode",
    "Mozilla.Firefox",
    "Sandboxie.Plus",
    "Tailscale.Tailscale",
    "Telegram.TelegramDesktop",
    "Valve.Steam",
    "agalwood.Motrix",
    "c0re100.qBittorrent-Enhanced-Edition",
    "mpv.net",
    "zhongyang219.TrafficMonitor.Lite"
)

foreach ($app in $apps) {
    winget install -e --id=$app
}
