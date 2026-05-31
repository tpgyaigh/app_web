# Android 项目构建指南

## ❌ 错误原因

你遇到了这个错误：
```
The goal you specified requires a project to execute but there is no POM in this directory
```

**原因**：你使用了 **Maven** (mvn) 来构建Android项目，但Android项目应该使用 **Gradle** 构建！

- Maven (`mvn`) - 用于Java后端项目
- Gradle (`gradle`) - 用于Android项目

---

## ✅ 正确的构建方法

### 方法1：使用 Android Studio（最简单，推荐）

1. **打开项目**
   - 启动 Android Studio
   - 选择 "Open an Existing Project"
   - 选择目录：`f:\20260530\APP`

2. **等待同步**
   - Android Studio会自动下载Gradle和依赖
   - 首次同步需要5-10分钟

3. **编译APK**
   - 点击菜单：Build → Build Bundle(s) / APK(s) → Build APK(s)
   - 等待编译完成

4. **找到APK**
   - Debug版本：`app\build\outputs\apk\debug\app-debug.apk`
   - Release版本：`app\build\outputs\apk\release\app-release.apk`

### 方法2：使用 Gradle 命令行

如果已安装Gradle：

```powershell
# 进入项目目录
cd f:\20260530\APP

# 编译Debug版本
gradle assembleDebug

# 编译Release版本
gradle assembleRelease
```

### 方法3：使用 gradlew.bat（推荐）

我已经为你创建了 `BUILD.bat` 脚本：

```powershell
# 双击运行或在命令行中执行
f:\20260530\APP\BUILD.bat
```

---

## 📋 项目信息

- **项目类型**: Android应用
- **构建工具**: Gradle
- **包名**: com.example.webviewapp
- **最低SDK**: API 21 (Android 5.0)
- **目标SDK**: API 33 (Android 13)

---

## 🔧 前置要求

### Windows环境
- JDK 17 或更高版本
- Android SDK (可通过Android Studio安装)
- 或仅安装 [Gradle](https://gradle.org/releases/)

### Android Studio（推荐）
下载地址：https://developer.android.com/studio

---

## 🚨 常见问题

### Q: 提示 "gradlew.bat 不是内部或外部命令"
**A**: 检查是否在正确的项目目录，或直接双击 `BUILD.bat`

### Q: 提示 "Could not find tools.jar"
**A**: 确保已安装JDK并配置 JAVA_HOME 环境变量

### Q: 提示 "Android SDK not found"
**A**: 安装Android Studio或手动下载Android SDK并配置 ANDROID_HOME

### Q: 编译太慢/卡住
**A**: 首次编译需要下载大量依赖，请耐心等待

---

## 📝 下一步

1. ✅ 双击 `f:\20260530\APP\BUILD.bat` 开始构建
2. 或 ✅ 打开Android Studio导入项目
3. ✅ 等待编译完成
4. ✅ 在手机/模拟器上安装APK测试

---

## 项目文件清单

```
f:\20260530\APP\
├── app/                          # 应用模块
│   ├── src/main/
│   │   ├── java/                 # Java源代码
│   │   ├── res/                  # 资源文件
│   │   └── AndroidManifest.xml   # 应用配置
│   └── build.gradle              # 模块构建配置
├── build.gradle                  # 项目构建配置
├── settings.gradle               # 项目设置
├── gradle.properties            # Gradle属性
├── gradlew.bat                   # Gradle wrapper脚本
├── BUILD.bat                     # 一键构建脚本（新增）
└── README.md                     # 项目说明
```

---

**如果仍有问题**，请告诉我具体的错误信息，我会帮你解决！
