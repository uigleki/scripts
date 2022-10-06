# 仓库地址
$url = "https://gitlab.com/glek/scripts/raw/main/win"

# 提示
Write-Output "记得关闭 bitlocker 和安全启动，禁用快速启动，关闭时间同步，硬件时钟设置为 UTC。"

# 下载常用软件
winget install Git.Git
winget install 7zip.7zip
winget install Microsoft.PowerToys
winget install Mozilla.Firefox
winget install CrowTranslate.CrowTranslate
winget install Klocman.BulkCrapUninstaller

# 小鹤双拼 键位
Invoke-WebRequest "$url/xhup.reg" -OutFile "xhup.reg"
reg import "xhup.reg"
Remove-Item "xhup.reg"

# UTC 时间 (需要管理员权限)
Reg add HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation /v RealTimeIsUniversal /t REG_DWORD /d 1

# 键盘映射
$dest = "$env:LOCALAPPDATA/Microsoft/PowerToys"
mkdir -fp "$dest/Keyboard Manager"
Invoke-WebRequest "$url/powertoys/settings.json" -OutFile "$dest/settings.json"
Invoke-WebRequest "$url/powertoys/keyboard/settings.json" -OutFile "$dest/Keyboard Manager/settings.json"
Invoke-WebRequest "$url/powertoys/keyboard/default.json" -OutFile "$dest/Keyboard Manager/default.json"
