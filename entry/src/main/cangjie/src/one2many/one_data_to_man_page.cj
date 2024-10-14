/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */

package ohos_app_cangjie_entry.one2many
import ohos.component.Column
import ohos.component.Text
import ohos.component.Button
import ohos.component.ViewBuilder
import ohos.component.CustomView
import ohos.component.CJEntry
import ohos.component.HorizontalAlign
import ohos.component.loadNativeView
import ohos.state_manage.LocalStorage
import ohos.state_manage.ObservedProperty
import ohos.state_manage.SubscriberManager
import ohos.base.*
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.State
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.Builder
import ohos.state_manage.ViewStackProcessor
import ohos.component.LegalCallCheck
import std.collection.ArrayList
import multitype.IMultiTypeItem
import multitype.MultiTypeItemDataList
import multitype.MultiTypeAdapter
import multitype.Attributes

import ohos.hilog.*
import ohos.router.*

import ohos_app_cangjie_entry.common.*

class ItemsType <: IMultiTypeItem {
    public var itemType: Int64 = 0
    public var id: Int64 = 0
    public init(itemType: Int64, id: Int64) {
        this.itemType = itemType
        this.id = id
    }
}

@Entry
@Component
class OneDataToManPage {

    var items: MultiTypeItemDataList = unsafe {zeroValue<MultiTypeItemDataList>()}

    @State
    var index: Int64= 0

    @State
    var attr: Attributes = Attributes (
                    onScrollIndex: {firstIndex: Int64, lastIndex: Int64 =>
                        Hilog.error(999, "multitype", "firstIndex:${firstIndex}, lastIndex:${lastIndex}")
                    }
                )

    protected func aboutToAppear(){
        this.items = MultiTypeItemDataList()
        var num: Int64 = 0;
        while (num < 30) {
            if (num % 2 == 0) {
                this.items.append(ItemsType(1, num))
            } else {
                this.items.append(ItemsType(2, num))
            }
            num++
        }
    }

    @Builder
    func f1(item: IMultiTypeItem, i: Int64) {
        Column() {
            Text("title: ${(item as ItemsType).getOrThrow().id}, id:${i}")
                .fontSize(16)
                .padding(left: 15, right: 15, top: 15)
        }
        .width(100.percent)
        .alignItems(if ((item as ItemsType).getOrThrow().itemType % 2 == 1) {HorizontalAlign.Start} else {HorizontalAlign.End})
    }

    func build() {
        Column {
            TitleBar()
            MultiTypeAdapter(
                array: items,
                child: f1,
                attribute: attr
            )
        }.height(94.percent).width(100.percent)
    }

}
