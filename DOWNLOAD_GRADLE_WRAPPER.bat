@echo off
chcp 65001 >nul
echo ========================================
echo Gradle Wrapper 下载工具
echo ========================================
echo.

echo 正在检查 Java...
java -version
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Java
    echo 请先安装 JDK 17 或更高版本
    pause
    exit /b 1
)

echo.
echo 正在下载 Gradle Wrapper...
echo.

REM 创建临时目录
if not exist "temp" mkdir temp

REM 尝试使用 curl 下载
where curl >nul 2>&1
if %errorlevel% equ 0 (
    echo 使用 curl 下载...
    curl -L -o "temp\gradle-wrapper.jar.tmp https://raw.githubusercontent.com/gradle/gradle/v8.0.0/gradle/wrapper/gradle-wrapper.jar
    if %errorlevel% equ 0 (
        move /Y "temp\gradle-wrapper.jar.tmp" "gradle\wrapper\gradle-wrapper.jar"
        if %errorlevel% equ 0 (
            echo.
            echo ========================================
            echo ✅ 下载成功！
            echo Gradle Wrapper 已保存到: gradle\wrapper\gradle-wrapper.jar
            echo ========================================
            echo.
            goto cleanup
        )
    )
)

echo.
echo [提示] 下载失败或需要手动下载
echo.
echo 请手动下载方法:
echo 1. 访问: https://github.com/gradle/gradle/raw/v8.0.0/gradle/wrapper/gradle-wrapper.jar
echo 2. 将文件保存到: gradle\wrapper\gradle-wrapper.jar
echo.
echo 或在 Android Studio 中打开项目也会自动生成 Gradle Wrapper
echo.

:cleanup
if exist "temp" rmdir /s /q temp
pause
