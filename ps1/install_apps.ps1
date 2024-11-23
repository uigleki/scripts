$apps = @(
    "7zip.7zip",
    "AppFlowy.AppFlowy",
    "Canonical.Ubuntu",
    "Clementine.Clementine",
    "Cloudflare.Warp",
    "Cryptomator.Cryptomator",
    "Git.Git",
    "KDE.CrowTranslate",
    "KDE.KDEConnect",
    "Klocman.BulkCrapUninstaller",
    "MacType.MacType",
    "Mega.MEGASync",
    "Microsoft.PowerToys",
    "Microsoft.VisualStudioCode",
    "Mozilla.Firefox",
    "Telegram.TelegramDesktop",
    "Valve.Steam",
    "agalwood.Motrix",
    "c0re100.qBittorrent-Enhanced-Edition",
    "mpv.net"
)

foreach ($app in $apps) {
    winget install -e --id=$app
}
