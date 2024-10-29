# MultiType4cj 接口文档
## multitype 包


### MultiTypeAdapter类(自定义UI组件类)
```cangjie
/*
 * 类名 - MultiTypeAdapter
 * 功能 - 为list组件创建多种条目类型的UI组件库.
 */
public class MultiTypeAdapter {
    /*
     * 构造函数 
     * 参数 array - 需要迭代的数据集合
     * 参数 child - 表示集合的每个数据使用的函数设置样式
     * 参数 attribute - 配置参数类, 见Attributes
     */
    public init (array!: MultiTypeArrayList, child!: (Any, Int64) -> Unit, attribute!: Attributes)
    
    /*
     * 功能 - (静态函数)创建一个MultiTypeArrayList集合
     * 
     * 返回值 MultiTypeArrayList - MultiTypeArrayList类型数组。
     */
    public static func createArray(): MultiTypeArrayList

    /*
     * 功能 - (静态函数)创建一个MultiTypeArrayList集合
     * 
     * 参数 data - 源数组数据
     * 返回值 MultiTypeArrayList - MultiTypeArrayList类型数组。
     */
    public static func createArray(data: ArrayList<Any>): MultiTypeArrayList
    
    /*
     * 功能 - (静态函数)创建一个MultiTypeArrayList集合
     * 
     * 参数 elements - 源数组数据
     * 返回值 MultiTypeArrayList - MultiTypeArrayList类型数组。
     */
    public static func createArray(elements: Array<Any>): MultiTypeArrayList
    
    /*
     * 功能 - (静态函数)创建一个MultiTypeArrayList集合
     * 
     * 参数 elements -  源Collection数据
     * 返回值 MultiTypeArrayList - MultiTypeArrayList类型数组。
     */
    public static func createArray(elements: Collection<Any>): MultiTypeArrayList
    
    /*
     * 功能 - (静态函数)创建一个MultiTypeArrayList集合
     * 
     * 参数 size - 长度。
     * 参数 initElement - 传入初始化函数。
     * 返回值 MultiTypeArrayList - MultiTypeArrayList类型数组。
     */
    public static func createArray(size: Int64, initElement: (Int64) -> Any): MultiTypeArrayList
    
    /*
     * 功能 - (静态函数) 转换 (T, Int64) -> Unit函数类型 到 (Any, Int64) -> Unit
     * 
     * 参数 fun - 泛型T的回调函数。
     * 返回值 (Any, Int64) -> Unit - 回调函数
     */
    public static func convertType<T>(fun: (T, Int64) -> Unit) : (Any, Int64) -> Unit
}
```


### Attributes类
```cangjie
/*
 * 类名 - Attributes
 * 功能 - MultiTypeAdapter 的参数配置类
 */
public class Attributes  {

    /*
     * 构造函数 
     * 参数 topPadding - 上内边距，组件内元素距组件顶部的尺寸。
     * 参数 rightPadding - 右内边距，组件内元素距组件右边界的尺寸。
     * 参数 bottomPadding - 下内边距，组件内元素距组件底部的尺寸。
     * 参数 leftPadding - 左内边距，组件内元素距组件左边界的尺寸。
     * 参数 topMargin - 上外边距，组件顶部距组件外元素的尺寸。
     * 参数 rightMargin - 右外边距，组件右边界距组件外元素的尺寸。
     * 参数 bottomMargin - 下外边距，组件底部距组件外元素的尺寸。
     * 参数 leftMargin - 左外边距，组件左边界距组件外元素的尺寸。
     * 参数 space - List构造函数中参数space的值, 列表项间距。
     * 参数 initialIndex - List构造函数中参数initialIndex的值, list内容长度需要超过list容器长度时生效。
     * 参数 dividerStrokeWidth - 用于设置ListItem分割线样式, 分割线的线宽。
     * 参数 dividerColor - 用于设置ListItem分割线样式, 分割线的颜色, 默认黑色。
     * 参数 dividerStartMargin - 用于设置ListItem分割线样式, 分割线距离列表侧边起始端的距离。
     * 参数 dividerEndMargin - 用于设置ListItem分割线样式, 分割线距离列表侧边结束端的距离。
     * 参数 listDirection - 设置List组件排列方向
     * 参数 editMode - 设置当前List组件是否处于可编辑模式。
     * 参数 edgeEffect - 设置组件的滑动效果。
     * 参数 chainAnimation - 设置当前List是否启用链式联动动效，开启后列表滑动以及顶部和底部拖拽时会有链式联动的效果。
     * 参数 onScrollIndex - 列表滑动时触发，获取滑动起始位置索引值和滑动结束位置索引值。
     * 参数 sticky - 设置List组件中的ListItem是否为吸顶item，以及其吸顶消失的效果。
     * 参数 width - 宽度
     * 参数 height - 高度
     * 参数 backgroundColor - 背景色 
     */
    public init (
        topPadding!: Int64 = 0,
        rightPadding!: Int64 = 0,
        bottomPadding!: Int64 = 0,
        leftPadding!: Int64 = 0,
        topMargin!: Int64 = 0,
        rightMargin!: Int64 = 0,
        bottomMargin!: Int64 = 0,
        leftMargin!: Int64 = 0,
        space!: Int64 = 0,
        initialIndex!: Int64 = 0,
        dividerStrokeWidth!: Length = 0.vp,
        dividerColor!: Color = Color.BLACK,
        dividerStartMargin!: Length = 0.vp,
        dividerEndMargin!: Length = 0.vp,
        listDirection!: Axis = Axis.Vertical,
        editMode!: Bool = false,
        edgeEffect!: EdgeEffect = EdgeEffect.None,
        chainAnimation!: Bool = false,
        onScrollIndex!: Option <(firstIndex: Int64,
        lastInde: Int64) -> Unit >= None,
        sticky!: Sticky = Sticky.None,
        width!: Option < Int64 >= None,
        height!: Option < Int64 >= None,
        backgroundColor!: Color = Color.WHITE
    )
}

```
### MultiTypeArrayList类
```cangjie
/*
 * 类名 - MultiTypeArrayList
 * 功能 - MultiTypeAdapter 的集合类
 */
public class MultiTypeArrayList <: Collection {

    /*
     * 构造函数 
     */
    public init ()

    /*
     * 构造函数 
     * 参数 data - 传入数组。
     */
    public init (data: ArrayList < Any >)

    /*
     * 构造函数 
     * 参数 size - 长度
     * 参数 initElement -  传入表达式
     */
    public init (size: Int64, initElement:(Int64) -> Any)

    /*
     * 构造函数 
     * 参数 elements - 传入数组。
     */
    public init (elements: Array < Any >)

    /*
     * 构造函数 
     * 参数 elements - 传入Collection。
     */
    public init (elements: Collection < Any >)

    /*
     * 功能 - 判断 MultiTypeArrayList 是否为空。
     * 
     * 返回值 Bool - 如果为空，则返回 true，否则，返回 false。
     */
    public override func isEmpty () : Bool

    /*
     * 功能 - 返回此 MultiTypeArrayList 中元素的迭代器。
     * 
     * 返回值 Iterator < Any > - MultiTypeArrayList 中元素的迭代器。
     */
    public override func iterator () : Iterator < Any >

    /*
     * 功能 - 删除此 MultiTypeArrayList 中指定位置的元素。
     * 
     * 参数 i - 指定位置
     * 返回值 - 返回删除数据, 以Any父类型返回
     */
    public func remove (i: Int64): Any

    /*
     * 功能 - 在此 MultiTypeArrayList 中的指定位置插入指定元素。
     * 
     * 参数 i - 插入元素的目标索引。
     * 参数 item -  要插入的 Any 类型元素。
     * 返回值 - Unit
     */
    public func insert (i: Int64, item: Any): Unit

    /*
     * 功能 - 将指定的元素附加到此 MultiTypeArrayList 的末尾。
     * 
     * 参数 item - Any 类型元素。
     * 返回值 - Unit
     */
    public func append (item: Any): Unit

    /*
     * 功能 - 通过下标运算符用指定的元素替换此列表中指定位置的元素。
     * 
     * 参数 i - 要设置的索引值。
     * 参数 value - 要设置的 Any 类型的值。
     * 返回值 Unit - Unit
     */
    public operator func [] (i: Int64, value!: Any) : Unit

    /*
     * 功能 - 返回对应下标的值
     * 
     * 参数 index - 索引值。
     * 返回值 Any - Any 类型的值。
     */
    public operator func [] (index: Int64) : Any

    /*
     * 功能 - 返回一个数组，其中包含此列表中按正确顺序排列的所有元素。
     * 
     * 返回值 Array < Any > - Any 类型数组。
     */
    public override func toArray () : Array < Any >
}

```
