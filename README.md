* 修改系统的音量提示
* 静音按钮时无法监听，还没有找到解决办法
* 使用方法：

```
@interface BaseViewController : UIViewController
```

修改为

```
@interface BaseViewController : CLVolumeViewController
```
