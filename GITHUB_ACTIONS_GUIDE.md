# GitHub Actions 自动编译 Android APK

## 🚀 快速开始

将项目推送到 GitHub 后，系统会**自动编译 APK**！

---

## 📋 步骤

### 1. 将代码推送到 GitHub

```powershell
# 进入项目目录
cd f:\20260530\APP

# 初始化 Git
git init
git add .
git commit -m "Initial commit"

# 推送到 GitHub（需要先创建仓库）
git remote add origin https://github.com/你的用户名/你的仓库名.git
git branch -M main
git push -u origin main
```

### 2. 自动编译

推送代码后，GitHub Actions 会**自动开始编译**！

### 3. 下载 APK

编译完成后，去下载：
- 打开你的 GitHub 仓库
- 点击 **Actions** 标签
- 找到最新的 workflow 运行
- 下载 Artifacts（生成的APK）

---

## 📦 文件说明

### 已创建的文件

| 文件 | 说明 |
|------|------|
| [`.github/workflows/build-android.yml`](file:///f:/20260530/APP/.github/workflows/build-android.yml) | GitHub Actions 自动编译配置 |
| [`DOWNLOAD_GRADLE_WRAPPER.bat`](file:///f:/20260530/APP/DOWNLOAD_GRADLE_WRAPPER.bat) | 下载 Gradle Wrapper 脚本 |

---

## ⚙️ 配置说明

### GitHub Actions 配置功能

- ✅ 自动在 `push` 和 `pull_request` 时编译
- ✅ 使用 JDK 17
- ✅ 编译 Debug 和 Release 两个版本
- ✅ 自动上传 APK 作为 Artifacts
- ✅ 保留 30 天

---

## 📂 完整项目推送前检查

确保这些文件存在：

```
f:\20260530\APP\
├── app/
│   ├── src/main/
│   │   ├── java/...
│   │   ├── res/...
│   │   └── AndroidManifest.xml
│   └── build.gradle
├── gradle/
│   └── wrapper/
│       └── gradle-wrapper.properties
├── .github/
│   └── workflows/
│       └── build-android.yml   ✅ 新增
├── build.gradle
├── settings.gradle
├── gradle.properties
└── .gitignore
```

---

## 🔧 关于 Gradle Wrapper

### ⚠️ 重要提示

GitHub Actions 需要 `gradle-wrapper.jar` 文件！

#### 获取方法1：用 Android Studio 打开（推荐）

1. 用 Android Studio 打开项目
2. 等待 Gradle 同步完成
3. 会自动生成 `gradle-wrapper.jar`

#### 获取方法2：手动下载

下载地址：
```
https://github.com/gradle/gradle/raw/v8.0.0/gradle/wrapper/gradle-wrapper.jar
```

保存位置：
```
f:\20260530\APP\gradle\wrapper\gradle-wrapper.jar
```

---

## 📥 下载编译好的 APK

### 步骤

1. 打开 GitHub 仓库页面
2. 点击顶部 **Actions** 标签
3. 点击最新的工作流运行
4. 在页面底部找到 **Artifacts** 部分
5. 下载 `app-debug` 和 `app-release-unsigned`

---

## 🎯 使用示例

### 1. 首次推送

```powershell
cd f:\20260530\APP

# 确保有 gradle-wrapper.jar
# 用 Android Studio 打开项目，或手动下载

git init
git add .
git commit -m "First commit"
git branch -M main
git remote add origin https://github.com/你的用户名/你的仓库.git
git push -u origin main
```

### 2. 修改后推送

```powershell
cd f:\20260530\APP

git add .
git commit -m "Update something"
git push

# 等待 GitHub Actions 自动编译
```

### 3. 查看编译状态

- 打开 GitHub 仓库
- 看右上角是否有 ✅ 或 ❌ 图标
- 点击进入 Actions 页面查看详情

---

## 🐛 常见问题

### Q: Actions 失败，提示找不到 gradlew
**A**: 需要有 `gradle-wrapper.jar` 文件！

用 Android Studio 打开项目，它会自动生成。

### Q: 编译很慢
**A**: 首次编译需要下载依赖，正常。

### Q: 如何手动触发编译？
**A**: 去 Actions 页面，选择工作流，点击 "Run workflow"

### Q: Release APK 不能安装？
**A**: Release APK 需要签名。你可以用 Debug 版本测试。

---

## 📱 下一步

1. ✅ 将代码推送到 GitHub
2. ✅ 等待自动编译
3. ✅ 下载 APK 到手机
4. ✅ 安装测试

---

## 📄 相关文档

- [ANDROID_BUILD_GUIDE.md](file:///f:/20260530/APP/ANDROID_BUILD_GUIDE.md) - Android 本地构建指南
- [PROJECT_SUMMARY.md](file:///f:/20260530/APP/PROJECT_SUMMARY.md) - 项目总结
- [README.md](file:///f:/20260530/APP/README.md) - 项目说明
