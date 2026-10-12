@echo off
chcp 65001 >nul
title 我的错题本 - 本地预览

echo.
echo  ╔══════════════════════════════════════════╗
echo  ║        我的错题本 - 本地服务器            ║
echo  ╚══════════════════════════════════════════╝
echo.
echo  正在启动本地服务器...
echo  启动后请用手机扫描下方二维码访问
echo  (手机和电脑需在同一WiFi网络)
echo.

cd /d "%~dp0"

python -m http.server 8080

echo.
pause
