* 修改系统的音量提示
* 静音按钮时无法监听，还没有找到解决办法
* 请使用真机运行DEMO

* 使用方法：

```
@interface BaseViewController : UIViewController
```

修改为

```
@interface BaseViewController : CLVolumeViewController
```

before:
![Image text](https://github.com/coooliang/CLVolumeViewController/blob/master/IMG_0051.png)

after:
![Image text](https://github.com/coooliang/CLVolumeViewController/blob/master/IMG_0050.png)

