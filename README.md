# rootModel

### 详细用法及扩展请参考<a href="http://www.chjsun.top/2017/06/14/rootModel/" target="rootModel">www.chjsun.top/2017/06/14/rootModel</a>
### 目的
  有时候我们的需要创建很多个全局都可以共享数据的模型。把模型放在内存中保存下来<br/>
  同时也想创建一些不需要共享的模型，用完自动销毁。<br/>
  本工程就是为了解决这个问题而创建的<br/>
  本项目小巧玲珑，适合大部分项目开发
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
只需要继承CJRootModel即可
大大简化了代码量，
提供很多实用的方法进行操作

### 导入
#### 1， cocoapods
先看看能不能搜索到

	pod search CJRootModel
如果搜索不到，估计需要更新下搜索库

	pod repo update
更新后

	rm ~/Library/Caches/CocoaPods/search_index.json
删除索引后重新搜索，就应该有了<br/>
然后就可以引入到项目中

	pod 'CJRootModel'

#### 2， 手动引入

	将项目下载下来
	将项目中RootModel文件下的两个文件复制到项目中

### 用法
```
  0，创建一个model，继承于CJRootModel
  1，在.h文件中声明属性，例如 @property(nonatomic, copy)NSString *name;
```

### 说明
子类创建模型可以通过```+ shareModel```创建出单例模型<br/>
亦可以通过```init```创建出<span style="color:#f00">非</span>单例模型<br/>
提供json转模型、字典转模型、模型转字典、模型转json的功能<br/>
头文件里有详细的方法说明


  
  
  
