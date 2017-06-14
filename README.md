# rootModel
### 目的
  在项目中有时候我们需要创建一个全局的model，这个model可以在任何地方使用，而在内存中（实例）只有一个，那这个model就要用单例模式创建,
  然而项目中有可能不止一个model，如果每个都需要创建的话，就太费事了，而且代码都是一样的，只是copy到不同的model中,这样就会很麻烦。
  本工程就是为了解决这个问题而创建的
#
#
### 用法
  就两个文件，所以就不放在cocoapods上了。
 
 ```
  1，打开工程，直接将model文件夹下的两个文件拽到自己的项目中就OK了
  2，创建一个model，继承于CJModel
  3，在.h文件中声明属性，例如 @property(nonatomic, copy)NSString *name;
  4，没有4了，一切就绪
```
#
### 说明
子类model在实现的时候，可以通过 ```[childModel shareModel]```的方式创建 

也可以通过```[[childModel alloc] init]```的方式创建
  
  
  
