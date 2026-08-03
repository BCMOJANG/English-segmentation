# 音频分割工具

纯前端音频分割工具，基于静音检测自动切割，无需服务器。

## 功能

- 拖拽/点选上传音频（MP3、WAV、OGG、FLAC、M4A）
- 可调参数：静音长度、阈值、保留静音
- 自动分割、实时进度与日志
- 在线播放、单段下载、一键 ZIP 打包
- 波形图（可开关）、深色/浅色主题
- 单 HTML 文件，双击即用

## 使用

双击 `index.html` 打开即可。

## 技术

- 单 HTML 文件，无外部依赖
- Web Worker 内联处理音频，不阻塞主线程
- AudioContext 解码 → 单声道混音 → 分帧 RMS 静音检测 → 16-bit WAV 编码
- 手写 ZIP 打包（Store + CRC32，UTF-8 文件名）

## 浏览器

Chrome 76+ / Firefox 69+ / Safari 14.1+ / Edge 79+
