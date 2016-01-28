# 合并视频文件 (Merge Video Files)

## 如何使用 (How to use)
- 使用youtube-dl下载到的多个零散视频，可能会像下面这个样子，此时想合并成一个完整的视频
		- 发布会全程-XMTQyOTYzOTIwNA_part1.flv
		- 发布会全程-XMTQyOTYzOTIwNA_part2.flv
		- 发布会全程-XMTQyOTYzOTIwNA_part3.flv
		- 发布会全程-XMTQyOTYzOTIwNA_part4.flv
		- 发布会全程-XMTQyOTYzOTIwNA_part5.flv
- 把此脚本和视频文件放在同一个文件夹中，并执行脚本即可
- 最终得到一个完整的视频文件：发布会全程.flv

* 此脚本不会删除任何文件，如果有同名的视频文件，不会覆盖
* 此脚本可反复执行，脚本会自动检测，已合并的文件不会再执行合并
* 只要能用youtube-dl下载下来的视频，理论上都可合并（此处指同一格式视频文件）
* 列在/tmp/finished_file_name.tmp中的文件，将不会再执行合并（此文件自动生成）
* 已被合并过的原文件将会移动到当前路径下的finished._.file文件夹中保留
