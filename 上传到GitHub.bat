@echo off
chcp 65001 >nul
title 我的错题本 - 上传到GitHub

echo.
echo  ╔════════════════════════════════════════════╗
echo  ║     上传"我的错题本"到 GitHub Pages        ║
echo  ╚════════════════════════════════════════════╝
echo.

:: 检查是否已安装git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Git，请先安装 Git
    echo 下载地址: https://git-scm.com/download/win
    pause
    exit /b 1
)

:: 获取用户输入
echo 请提供以下信息：
echo.
set /p GH_TOKEN="1. GitHub Personal Access Token: "
set /p GH_USERNAME="2. 你的 GitHub 用户名: "

if "%GH_TOKEN%"=="" (
    echo [错误] Token 不能为空
    pause
    exit /b 1
)

if "%GH_USERNAME%"=="" (
    echo [错误] 用户名不能为空
    pause
    exit /b 1
)

set REPO_NAME=my-wrong-questions
set LOCAL_DIR=%~dp0

echo.
echo 正在准备上传...
echo.

:: 初始化git（如果还没有）
cd /d "%LOCAL_DIR%"
if not exist ".git" (
    git init
    git remote add origin https://github.com/%GH_USERNAME%/%REPO_NAME%.git
)

:: 配置git
git config user.name "%GH_USERNAME%"
git config user.email "%GH_USERNAME%@users.noreply.github.com"

:: 添加所有文件
git add .
git commit -m "feat: 初始上传我的错题本APP"

:: 设置远程仓库URL（包含token）
git remote set-url origin https://%GH_TOKEN%@github.com/%GH_USERNAME%/%REPO_NAME%.git

:: 推送到GitHub
echo.
echo 正在推送到 GitHub...
echo.
git push -u origin main --force

if %errorlevel% equ 0 (
    echo.
    echo  ╔════════════════════════════════════════╗
    echo  ║         上传成功！                      ║
    echo  ╚════════════════════════════════════════╝
    echo.
    echo  你的APP地址是：
    echo  https://%GH_USERNAME%.github.io/%REPO_NAME%/
    echo.
    echo  请等待1-2分钟让GitHub Pages生效
    echo.
) else (
    echo.
    echo [错误] 上传失败，请检查Token和用户名是否正确
    echo.
)

pause
