/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */

package ohos_app_cangjie_entry.one2many
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import std.collection.ArrayList
import multitype.MultiTypeArrayList
import multitype.MultiTypeAdapter
import multitype.Attributes

import ohos.hilog.*
import ohos.router.*

import ohos_app_cangjie_entry.common.*

class ItemsType {
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

    var items: MultiTypeArrayList = MultiTypeAdapter.createArray()

    @State
    var index: Int64= 0

    @State
    var attr: Attributes = Attributes (
                    onScrollIndex: {firstIndex: Int64, lastIndex: Int64 =>
                        Hilog.error(999, "multitype", "firstIndex:${firstIndex}, lastIndex:${lastIndex}")
                    }
                )

    protected func aboutToAppear(){
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
    func f1(item: Any, i: Int64) {
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
