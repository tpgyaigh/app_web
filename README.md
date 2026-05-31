# WebViewApp

一个简单的Android应用，用于将网页封装成原生App，支持配置网址。

## 功能特性

- 使用WebView加载网页
- 支持配置网址（IP地址或域名）
- 网址配置持久化保存
- 支持JavaScript和DOM存储
- 支持缩放功能
- 加载进度显示

## 使用方法

### 1. 配置Android SDK
在项目根目录创建 `local.properties` 文件，配置SDK路径：
```
sdk.dir=C:\\Users\\YourUsername\\AppData\\Local\\Android\\Sdk
```

### 2. 编译和运行
使用Android Studio打开项目，或使用Gradle命令：
```bash
./gradlew assembleDebug
```

### 3. 使用应用
1. 首次启动会自动打开设置页面
2. 输入网址（如：http://192.168.1.100 或 https://example.com）
3. 点击保存
4. 应用会自动加载配置的网页
5. 可以通过右上角菜单按钮重新配置网址

## 项目结构

```
app/
├── src/main/
│   ├── java/com/example/webviewapp/
│   │   ├── MainActivity.java      # 主界面，包含WebView
│   │   └── SettingsActivity.java  # 设置界面
│   ├── res/
│   │   ├── layout/                # 布局文件
│   │   ├── values/                # 字符串和颜色资源
│   │   └── menu/                  # 菜单资源
│   └── AndroidManifest.xml
└── build.gradle
```

## 权限说明

- INTERNET：访问网络
- ACCESS_NETWORK_STATE：检查网络状态
