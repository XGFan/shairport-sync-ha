### 注意事项
这个60是根据小米音箱的音量线性幅度反推的值，不同的音箱，值可能不同。
https://github.com/XGFan/shairport-sync-ha/blob/ffeff9c08dc2b2cd6ef414ca26bc105c96e8f5b2/audio_alsa.c#L2068

第一次启动可能会报错异常退出，需要Configuration里设置Audio的Input和Output

相关记录： https://xulog.com/article/shairport-sync-in-home-assistant