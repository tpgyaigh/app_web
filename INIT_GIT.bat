@echo off
chcp 65001 >nul
echo ========================================
echo WebViewApp - Git 初始化脚本
echo ========================================
echo.

REM 检查是否已安装 Git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Git
    echo 请先安装 Git: https://git-scm.com/downloads
    pause
    exit /b 1
)

REM 检查是否已经是 Git 仓库
if exist ".git" (
    echo [提示] Git 仓库已初始化
    echo.
    echo 当前状态:
    git status
    echo.
    goto check_files
)

echo 正在初始化 Git 仓库...
git init
if %errorlevel% neq 0 (
    echo [错误] Git 初始化失败
    pause
    exit /b 1
)

:check_files
echo.
echo 检查必要文件...

REM 检查 gradle-wrapper.jar
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [警告] gradle-wrapper.jar 不存在
    echo.
    echo 请用以下方法之一获取:
    echo 1. 用 Android Studio 打开项目
    echo 2. 手动下载到 gradle\wrapper\gradle-wrapper.jar
    echo.
    echo 下载地址:
    echo https://github.com/gradle/gradle/raw/v8.0.0/gradle/wrapper/gradle-wrapper.jar
    echo.
    choice /C YN /M "是否继续（没有 gradle-wrapper.jar GitHub Actions 会失败）"
    if errorlevel 2 goto end
)

echo.
echo 正在添加文件...
git add .

echo.
echo 当前变更:
git status

echo.
echo ========================================
echo 接下来的步骤:
echo ========================================
echo.
echo 1. 创建 GitHub 仓库（如果还没有）
echo.
echo 2. 提交变更:
echo    git commit -m "Initial commit"
echo.
echo 3. 关联远程仓库（替换为你的仓库地址）:
echo    git remote add origin https://github.com/你的用户名/你的仓库名.git
echo.
echo 4. 推送代码:
echo    git branch -M main
echo    git push -u origin main
echo.
echo 5. GitHub Actions 会自动开始编译！
echo.
echo 详细说明请查看: GITHUB_ACTIONS_GUIDE.md
echo.

:end
pause
