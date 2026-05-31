@echo off
echo ========================================
echo WebViewApp - Android Studio 启动脚本
echo ========================================
echo.
echo 请确保已安装 Android Studio
echo.
echo 项目位置: %~dp0
echo.
echo 如果 Android Studio 未自动打开，请手动打开项目
echo.
pause

REM 尝试使用 start 命令打开（可能需要关联 .gradle 或项目文件）
start "" "%~dp0"
