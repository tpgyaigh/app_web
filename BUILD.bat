@echo off
chcp 65001 >nul
echo ========================================
echo WebViewApp - Gradle 构建脚本
echo ========================================
echo.

REM 检查是否在正确的目录
if not exist "build.gradle" (
    echo [错误] 未找到 build.gradle 文件
    echo 请确保在项目根目录运行此脚本
    echo 当前目录: %CD%
    pause
    exit /b 1
)

REM 检查是否安装了Gradle
gradle --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [警告] 未检测到系统Gradle
    echo 尝试使用 gradlew.bat...
)

echo.
echo 开始编译...
echo.

REM 使用gradlew.bat构建
if exist "gradlew.bat" (
    call gradlew.bat assembleDebug
    if %errorlevel% equ 0 (
        echo.
        echo ========================================
        echo ✅ 编译成功！
        echo.
        echo APK位置: app\build\outputs\apk\debug\app-debug.apk
        echo ========================================
    ) else (
        echo.
        echo ========================================
        echo ❌ 编译失败
        echo ========================================
    )
) else (
    echo [错误] 未找到 gradlew.bat
    echo.
    echo 请使用以下方法之一：
    echo 1. 安装 Android Studio 并打开项目
    echo 2. 下载 Gradle 并配置环境变量
    echo.
    echo 访问 https://gradle.org/install 获取安装指南
)

echo.
pause
