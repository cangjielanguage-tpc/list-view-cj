/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */

package multitype

import ohos.state_macro_manage.Component
import ohos.state_macro_manage.Builder
import ohos.state_macro_manage.State
import ohos.state_macro_manage.Prop
import ohos.state_macro_manage.Link
import ohos.state_macro_manage.BuilderParam
import ohos.state_manage.ObservedProperty
import ohos.state_manage.SubscriberManager
import ohos.state_manage.ViewStackProcessor
import ohos.state_manage.LocalStorage
import ohos.component.DataChangeListener
import ohos.component.IDataSource
import ohos.component.Column
import ohos.component.List
import ohos.component.LegalCallCheck
import ohos.component.If
import ohos.component.ListItem
import ohos.component.ForEach
import ohos.component.Axis
import ohos.component.CustomView
import ohos.component.Sticky
import ohos.component.StickyStyle
import ohos.component.ViewBuilder
import ohos.component.LazyForEach
import ohos.component.FakeComponent
import ohos.component.EdgeEffect
import ohos.base.*
import cj_res_multitype.app
import std.collection.ArrayList


/**
 * @brief IMultiTypeItem interface, an interface for implementing multiple types of entities.
 * 
 * @version 1.0.0
 * @since cangjie-build-support-1.0.5
 */
public interface IMultiTypeItem {
}

class MultiTypeItemDataSource <: IDataSource<IMultiTypeItem> {
    let data_: ArrayList<IMultiTypeItem>

    public init(data: ArrayList<IMultiTypeItem>) {
        this.data_ = data.clone()
    }

    var listener: ?DataChangeListener = None

    public func totalCount(): Int64 {
        return data_.size
    }

    public func getData(index: Int64): IMultiTypeItem {
        return data_[index]
    }

    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        this.listener = listener
    }

    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        this.listener = None
    }

    public func notifyChange(i: Int64): Unit {
        if (let Some(v) <- this.listener) {
            for (j in i..=this.data_.size) {
                v.onDataChange(j)
            }
        }
    }
}


/**
 * @brief List of multiple types of project data
 *
 * @version 1.0.0
 * @since cangjie-build-support-1.0.5
 * @author liyanqing14
 */
public class MultiTypeItemDataList <: Collection<IMultiTypeItem> {
    var data: MultiTypeItemDataSource

    /**
     * @brief Construct a MultiTypeItemDataList with an initial capacity size of default 16
     *
     * @since cangjie-build-support-1.0.5
     */
    public init() {
        this.data = MultiTypeItemDataSource(ArrayList<IMultiTypeItem>())
    }

    /**
     * @brief Construct a MultiTypeItemDataList that contains all elements in the specified array.
     *
     * @param data Specify array
     * @since cangjie-build-support-1.0.5
     */
    public init(data: ArrayList<IMultiTypeItem>) {
        this.data = MultiTypeItemDataSource(data)
    }

    /**
     * @brief Construct a MultiTypeItemDataList with a specified initial number of elements and a specified rule function. This constructor sets the capacity of MultiTypeItemDataList based on the parameter size.
     *
     * @param size capacity
     * @param initElement Specify rule function
     * @since cangjie-build-support-1.0.5
     */
    public init(size: Int64, initElement: (Int64) -> IMultiTypeItem) {
        this.data = MultiTypeItemDataSource(ArrayList<IMultiTypeItem>(size, initElement))
    }

    /**
     * @brief Construct a MultiTypeItemDataList that contains all elements in the specified array.
     *
     * @param elements Specify array
     * @since cangjie-build-support-1.0.5
     */
    public init(elements: Array<IMultiTypeItem>) {
        this.data = MultiTypeItemDataSource(ArrayList<IMultiTypeItem>(elements))
    }

    /**
     * @brief Construct a MultiTypeItemDataList that contains all elements in the specified array.
     *
     * @param elements Specify array
     * @since cangjie-build-support-1.0.5
     */
    public init(elements: Collection<IMultiTypeItem>) {
        this.data = MultiTypeItemDataSource(ArrayList<IMultiTypeItem>(elements))
    }

    /**
     * @brief Check if MultiTypeItemDataList is empty.
     * 
     * @since cangjie-build-support-1.0.5
     */
    public override func isEmpty(): Bool {
        return this.data.data_.isEmpty()
    }

    /**
     * @brief Return the iterators of the elements in this MultiTypeItemDataList.
     * 
     * @since cangjie-build-support-1.0.5
     */
    public override func iterator(): Iterator<IMultiTypeItem> {
        return this.data.data_.clone().iterator()
    }

    public prop size: Int64 {
        get() {return this.data.data_.size}
    }

    /**
     * @brief Delete the element at the specified position in this MultiTypeItemDataList.
     * 
     * @param i
     * @since cangjie-build-support-1.0.5
     */
    public func remove(i: Int64) {
        this.data.data_.remove(i)
        this.data.notifyChange(i)
    }

    /**
     * @brief Insert the specified element at the designated location in this MultiTypeItemDataList.
     * 
     * @param i
     * @param item
     * @since cangjie-build-support-1.0.5
     */
    public func insert(i: Int64, item: IMultiTypeItem) {
        this.data.data_.insert(i, item)
        this.data.notifyChange(i)
    }

    /**
     * @brief Append the specified element to the end of this MultiTypeItemDataList.
     * 
     * @param item
     * @since cangjie-build-support-1.0.5
     */
    public func append(item: IMultiTypeItem) {
        this.data.data_.append(item)
        this.data.notifyChange(this.size)
    }

    /**
     * @brief Replace the element at the specified position in this list with the specified element using the subscript operator.
     * 
     * @param i
     * @param value
     * @since cangjie-build-support-1.0.5
     */
    public operator func [](i: Int64, value!: IMultiTypeItem): Unit {
        this.data.data_[i] = value
        this.data.notifyChange(i)
    }

    /**
     * @brief The value of the element at the index position.
     * 
     * @param index
     * @since cangjie-build-support-1.0.5
     */
    public operator func [](index: Int64): IMultiTypeItem {
        this.data.data_[index]
    }

    /**
     * @brief Return an array containing all elements in the correct order from this list.
     * 
     * @since cangjie-build-support-1.0.5
     */
    public override func toArray(): Array<IMultiTypeItem> {
        return this.data.data_.toArray()
    }
}


@Component
public class MultiTypeAdapter {
    var array: MultiTypeItemDataList

    @BuilderParam
    var child: (IMultiTypeItem, Int64) -> Unit

    @Prop
    var attribute: Attributes

    func build() {
        Column {
            List(
                space: this.attribute.space,
                initialIndex: Int32(this.attribute.initialIndex)
            ) {
                LazyForEach(
                    this.array.data,
                    itemGeneratorFunc: {
                        item: IMultiTypeItem, i: Int64 =>
                        ListItem() { =>
                            this.child(item, i)
                        }
                        .sticky(this.attribute.sticky)
                        .editable(this.attribute.editMode)
                    }
                )
            }
            .listDirection(this.attribute.listDirection) // 设置List组件排列方向。
            .divider(
                strokeWidth: this.attribute.dividerStrokeWidth,
                color: this.attribute.dividerColor,
                startMargin: this.attribute.dividerStartMargin,
                endMargin: this.attribute.dividerEndMargin
            ) //用于设置ListItem分割线样式，默认无分割线。
            .edgeEffect (this.attribute.edgeEffect) //设置组件的滑动效果。
            .chainAnimation(this.attribute.chainAnimation)  //设置当前List是否启用链式联动动效，开启后列表滑动以及顶部和底部拖拽时会有链式联动的效果。
            .onScrollIndex({firstIndex, lastIndex =>
                if (let Some(v) <- this.attribute.onScrollIndex) {
                    v(Int64(firstIndex), Int64(lastIndex))
                }
            }) //列表滑动时触发，获取滑动起始位置索引值和滑动结束位置索引值。
            .editMode(this.attribute.editMode)  //设置当前List组件是否处于可编辑模式。
            .onItemDelete ({index =>
                    if (let Some(vv) <- this.attribute.onItemDelete) {
                        vv(index)
                    }
                    return true
                }
            )  //当List组件在编辑模式时，点击ListItem右边出现的删除按钮时触发。
            .width (this.attribute.width)
            .height(this.attribute.height)
            .padding(
                top: this.attribute.topPadding,
                right: this.attribute.rightPadding,
                bottom: this.attribute.bottomPadding,
                left: this.attribute.leftPadding
            )
            .margin(
                top: this.attribute.topMargin,
                right: this.attribute.rightMargin,
                bottom: this.attribute.bottomMargin,
                left: this.attribute.leftMargin
            )
            .backgroundColor(this.attribute.backgroundColor)
        }
    }
}

