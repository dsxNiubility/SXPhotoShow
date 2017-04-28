# SXPhotoShow
使用三种自定义布局做的照片秀

<br />
![image](https://github.com/dsxNiubility/SXPhotoShow/raw/master/screenshots/photo.gif)

UICollectionViewFlowLayout流水布局 是当下collectionView中常用且普通的布局方式。本代码也写了三种好看的布局，其中LineLayout和流水布局有很大的相同点就直接继承UICollectionViewFlowLayout，然后StackLayout，CircleLayout这两种都是直接继承自最原始的UICollectionViewLayout 布局方案。

### SXStackLayout
类似于扑克牌错位叠在一起的布局，暂时能做到的是两边对称。点击cell删除或是cell的数量发生改变时会重新布局，角度也会随之更改产生动画效果。

### SXLineLayout
是一条直线的布局，但是拖动的过程中，cell的大小会根据自己位置的改变而改变，滑到中间时最大，两边时最小。并且做了处理有一个吸附的效果，每次快要停止时都会把最靠近中间的cell放在正中间不歪。

### SXCircleLayout
这是一个环形的布局，位置也是会随着整体数量的改变而改变的。demo设置的是可以点击删除的，亲可以试试在删最后5个的时候会有炫酷效果发生。

#### 使用方法
>1.建立自己需要的项目，里面要先有collectionView和collectionCell（demo里是最朴实的写法）<br /><br />
2.将项目中的`Layout`文件夹拖入项目中。 里面有三种布局，想用哪种就导入哪种的头文件。<br /> 
`#import "SXStackLayout.h"` -- 对应的是上图的顶部 <br />  `#import "SXLineLayout.h"` -- 对应的是上图的中间<br />   `#import "SXCircleLayout.h"` -- 对应的是上图的下方<br /><br />
3.在ViewDidLoad方法中创建布局<br />
`SXCircleLayout *layout = [[SXCircleLayout alloc] init];`<br />
并在collection的初始化方法中填上这个引入的布局<br />
`UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 235)） collectionViewLayout:layout];`