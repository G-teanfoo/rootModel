# rootModel
### 详细用法及扩展请参考http://www.chjsun.top/2017/06/14/rootModel/
### 目的
  在项目中有时候我们需要创建一个全局的model，这个model可以在任何地方共享数据，
  而在内存中（实例）只有一个，那这个model就要用单例模式创建,
  然而项目中有可能不止一个model，如果每个都需要创建的话，就太费事了，而且单例代码都是一样的，只是copy到不同的model中,这样就会很麻烦。
  本工程就是为了解决这个问题而创建的
### 说明 
例如

	name
	
	sex
	
	sleep
	
	state
	
	run
	
	。。。
	
这些属性的值变化后，要想在任意位置使用它， 最好就是创建一个模型进行保存。最好就是使用单例
然而使用本demo中的model
只需要继承cjmodel即可
大大简化了代码量，
提供很多实用的方法进行操作

### 用法
  就两个文件，所以就不放在cocoapods上了。
 
 ```
  1，打开工程，直接将model文件夹下的两个文件拽到自己的项目中就OK了
  2，创建一个model，继承于CJModel
  3，在.h文件中声明属性，例如 @property(nonatomic, copy)NSString *name;
  4，over
```
#
### 说明
子类model在实现的时候，可以通过 ```[childModel shareModel]```的方式创建 

也可以通过```[[childModel alloc] init]```的方式创建

两种创建方式都是创建出单例对象
  
  
  
