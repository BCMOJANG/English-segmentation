# 音频分割工具

纯前端音频分割工具，基于静音检测自动切割，无需服务器。

## 功能

- 拖拽/点选上传音频（MP3、WAV、OGG、FLAC、M4A）
- 可调参数：静音长度、阈值、保留静音
- 自动按静音分割，实时进度与日志
- 在线播放、单独下载（WAV）
- 一键下载全部（ZIP）
- 波形图（可开关）、深色/浅色主题
- 单 HTML 文件，双击即用

## 使用

直接双击 `index.html` 打开即可。

## 技术

### 音频处理流程

1. AudioContext.decodeAudioData() 解码音频
2. 混音为单声道（分块异步执行，避免阻塞 UI）
3. 分帧（10ms/帧）计算 RMS 能量值
4. 低于阈值的连续帧标记为静音段
5. 在静音段之间切出非静音片段（含保留静音 padding）
6. 每片段编码为 16-bit PCM WAV
7. 手写 ZIP 打包（Store 模式 + CRC32，支持 UTF-8 文件名）

### 架构

- 单 HTML 文件，无外部依赖
- Web Worker 内联处理音频，不阻塞主线程
- 解码进度按文件大小动态估算
- 回传音频数据使用 Transferable 避免内存拷贝

### 版本检测

- 启动时访问 GitHub Pages 的 version.txt 检查更新
- 版本不一致时显示横幅，可直接下载最新版

## 浏览器

Chrome 76+ / Firefox 69+ / Safari 14.1+ / Edge 79+

## 开发工具

- [opencode](https://opencode.ai) — AI 编程助手
