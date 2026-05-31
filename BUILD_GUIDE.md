# APK编译指南

由于当前环境缺少完整的Android SDK和Gradle Wrapper JAR文件，请按以下步骤完成编译：

## 完整编译方法（推荐）

### 方法1：使用Android Studio（最简单）

1. 下载并安装 [Android Studio](https://developer.android.com/studio)
2. 打开Android Studio，选择 "Open an Existing Project"
3. 选择目录 `f:\20260530\APP`
4. 等待Gradle同步完成（首次会下载依赖）
5. 点击菜单：Build → Build Bundle(s) / APK(s) → Build APK(s)
6. 编译完成后，APK位于：`app\build\outputs\apk\debug\app-debug.apk`

### 方法2：使用命令行编译

#### 前置条件
- 安装JDK 17或更高版本
- 下载Android Command Line Tools

#### 步骤

1. **配置Android SDK**
   创建 `local.properties` 文件：
   ```properties
   sdk.dir=C:\\Users\\你的用户名\\AppData\\Local\\Android\\Sdk
   ```

2. **下载Gradle Wrapper**
   将 `gradle-wrapper.jar` 放入 `gradle\wrapper\` 目录

3. **编译命令**
   ```powershell
   # Windows
   .\gradlew.bat assembleDebug
   
   # 或 Release版本
   .\gradlew.bat assembleRelease
   ```

4. **获取APK**
   - Debug APK: `app\build\outputs\apk\debug\app-debug.apk`
   - Release APK: `app\build\outputs\apk\release\app-release.apk`

## 快速验证项目结构

项目文件已完整创建：
- ✅ 项目配置文件（build.gradle, settings.gradle等）
- ✅ AndroidManifest.xml
- ✅ Java源代码
- ✅ 资源文件
- ✅ Gradle配置

## 替代方案：在线构建服务

如果无法配置本地环境，可以使用：
- [AppVeyor](https://www.appveyor.com/)
- [GitHub Actions](https://github.com/features/actions)
- [GitLab CI/CD](https://docs.gitlab.com/ee/ci/)

## 项目配置信息

- 包名: `com.example.webviewapp`
- 最低SDK: API 24 (Android 7.0)
- 目标SDK: API 34 (Android 14)
- 版本: 1.0 (versionCode 1)
