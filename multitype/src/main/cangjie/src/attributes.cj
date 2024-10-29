/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */

package multitype

import ohos.component.Axis
import ohos.component.EdgeEffect
import ohos.component.Sticky
import ohos.base.*
import std.math.abs

/**
 * @brief The setting property class of MultiTypeAdapter component
 * 
 * @version 1.0.0
 * @since cangjie-build-support-1.0.5
 */
public class Attributes {
    var topPadding: Int64
    var rightPadding: Int64
    var bottomPadding: Int64
    var leftPadding: Int64
    var topMargin: Int64
    var rightMargin: Int64
    var bottomMargin: Int64
    var leftMargin: Int64
    var space: Int64 //列表项间距
    var initialIndex: Int64 //初次加载时起始位置
    var dividerStrokeWidth: Length
    var dividerColor: Color
    var dividerStartMargin: Length
    var dividerEndMargin: Length
    var listDirection: Axis //排列方向
    var editMode: Bool //是否处于可编辑模式
    var edgeEffect: EdgeEffect //滑动效果
    var chainAnimation: Bool //是否启用链式联动动效
    var onScrollIndex: Option<(firstIndex: Int64, lastIndex: Int64) -> Unit> //当前列表显示的起始位置和终止位置发生变化时触发
    var sticky: Sticky //吸顶效果
    var width: Option<Int64>
    var height: Option<Int64>
    var backgroundColor: Color


    /**
     * @brief Initialize constructor function.
     *
     * Achieve the desired display effect through various parameter settings.
     *
     * @param topPadding Top margin refers to the distance between the elements within a component and the top of the component.
     * @param rightPadding Right inner margin, the size of the element within the component from the right boundary of the component.
     * @param bottomPadding Bottom margin refers to the distance between the elements within a component and the bottom of the component.
     * @param leftPadding Left margin, the size of the element within the component from the left boundary of the component.
     * @param topMargin The top margin refers to the distance between the top of a component and the outer element of the component.
     * @param rightMargin Right inner margin, the size of the outer element of the component at the right boundary of the component.
     * @param bottomMargin Bottom margin refers to the distance between the bottom of a component and its outer elements.
     * @param leftMargin Left inner margin, the size of the element outside the component at the left boundary of the component.
     * @param space Container List property, spacing between list items.
     * @param initialIndex The container List property takes effect when the length of the list content exceeds the length of the list container. Set the item displayed at the starting position of the viewport when the current List is loaded for the first time, that is, display the first item. If the set value exceeds the index value of the last item in the current List, it will be set to not take effect.
     * @param dividerStrokeWidth The divider attribute of the container List, the line width of the dividing line.
     * @param dividerColor The divider attribute of the container List and the color of the dividing line.
     * @param dividerStartMargin The divider property of the container List, the distance between the dividing line and the starting edge of the side of the list.
     * @param dividerEndMargin The divider property of the container List, the distance between the dividing line and the end of the side of the list.
     * @param listDirection Set the arrangement direction of List components in the container List.
     * @param editMode Set whether the current List component is in editable mode in the container List.
     * @param edgeEffect Set the sliding effect of components in the container list.
     * @param chainAnimation In the container List, set whether to enable chain linkage effect for the current List. Once enabled, the list will have a chain linkage effect when sliding and dragging at the top and bottom.
     * @param onItemDelete In the container List, when the List component is in edit mode, clicking the delete button that appears on the right side of ListItem triggers it.
     * @param onScrollIndex In the container List, it is triggered when the list slides, obtaining the index values of the sliding start position and the sliding end position.
     * @param sticky Set the ListItem component in the container List to determine whether the current item is a ceiling item and the effect of its ceiling disappearing.
     * @param width The width of the Container List component
     * @param height The height of the Container List component
     * @param backgroundColor Background color of container List component
     * @since cangjie-build-support-1.0.5
     */
    public init(
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
            onScrollIndex!: Option<(firstIndex: Int64, lastInde: Int64) -> Unit> = None,
            sticky!: Sticky = Sticky.None,
            width!: Option < Int64 > = None,
            height!: Option < Int64 > = None,
            backgroundColor!: Color = Color.WHITE
    ) {
        this.topPadding = topPadding
        this.rightPadding = rightPadding
        this.bottomPadding = bottomPadding
        this.leftPadding = leftPadding
        this.topMargin = topMargin
        this.rightMargin = rightMargin
        this.bottomMargin = bottomMargin
        this.leftMargin = leftMargin
        this.space = space
        this.initialIndex = initialIndex
        this.dividerStrokeWidth = dividerStrokeWidth
        this.dividerColor = dividerColor
        this.dividerStartMargin = dividerStartMargin
        this.dividerEndMargin = dividerEndMargin
        this.listDirection = listDirection
        this.editMode = editMode
        this.edgeEffect = edgeEffect
        this.chainAnimation = chainAnimation
        this.onScrollIndex = onScrollIndex
        this.sticky = sticky
        this.width = if (let Some (v) <- width) {
            abs(v)
        } else {
            width
        }
        this.height = if (let Some (v) <- height) {
            abs(v)
        } else {
            height
        }
        this.backgroundColor = backgroundColor
    }
}


