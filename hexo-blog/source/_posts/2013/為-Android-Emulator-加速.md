---
title: 為 Android Emulator 加速
date: 2013-07-17 16:58:14
tags:
  - Android
category:
  - Development  
---
一直以黎 Android emulator 最為人垢為病就係佢嘅啟動速度同埋運行速度。用返 Intel Atom x86 唧 system image 會幫到少少但係唔多。直到上年 Intel 出左 Intel Hardware Accelerated Execution (HAX) 情況就完全改善。以往由 Android 唧 boot animation 到入到去左 screen lock 要成幾分鐘嘅時間，而家用 10秒就攪掂!

## 安裝 HAX
首先 CPU 支援 VT,現今大部份 CPU 已經技援。然後去 Android SDK Manager 入面嘅 Extras 安裝 Intel x86 Emulator Accelerator (HAXM)。 不過依個安裝動作實際只係下載，要完成安裝要去返 SDK Path 入面搵返黎。例如 Mac 入面會下載到 `SDK Path /extras/intel/Hardware_Accelerated_Execution_Manager`,打開 IntelHAXM.dmg, 然後執行入面既 pkg 完成安裝。

之後執行 Emulator, 如果成功嘅話就會喺 Console 見到 `Emulator] HAX is working and emulator runs in fast virt mode`。如果想睇下 Android emulator 喺部 Macbook Air 行得有幾快可以睇以下嘅 video

{% youtube 1jwX_n8B3mI %}
