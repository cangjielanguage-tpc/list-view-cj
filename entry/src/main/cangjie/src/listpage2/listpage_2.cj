/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */

package ohos_app_cangjie_entry.listpage2
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import std.collection.ArrayList
import multitype.MultiTypeAdapter
import multitype.Attributes
import multitype.MultiTypeArrayList
import ohos.webview.WebviewController

import ohos.hilog.*
import ohos.router.*
import cj_res_entry.app
import ohos_app_cangjie_entry.common.*

class UserType {
    var avatar: CJResource
    var name: String
    public init(avatar: CJResource, name: String) {
        this.avatar = avatar
        this.name = name
    }
}
class ContentType {
    var text: String
    var content_type: String
    public init(text: String, content_type: String) {
        this.text = text
        this.content_type = content_type
    }
}
class ItemsType {
    var content: ContentType
    var createTime: String
    var user: UserType

    public init(content: ContentType, createTime: String, user: UserType) {
        this.content = content
        this.createTime = createTime
        this.user = user
    }
}

@Entry
@Component
class ListPage2 {
    var items: MultiTypeArrayList = MultiTypeAdapter.createArray()

    @State
    var deleteItem: Bool = false

    @State
    var attr: Attributes = Attributes (
                    onScrollIndex: {firstIndex: Int64, lastIndex: Int64 =>
                        Hilog.error(999, "multitype", "firstIndex:${firstIndex}, lastIndex:${lastIndex}")
                    }
                )

    protected func aboutToAppear(){
        var num = 0
        while (num < 100) {
            if (num %2 ==0) {
                this.items.append(
                    ItemsType(
                        ContentType("A simple text Weibo: Hello World.","simple_text" ),
                        "Just now",
                        UserType(
                            @r(app.media.img_00),
                            "drakeet-${num}"
                        )
                    )
                )
            } else {
                this.items.append(
                    ItemsType(
                        ContentType("A simple text Weibo: JSON_FROM_SERVICE.","simple_image" ),
                        "Just now(JSON_FROM_SERVICE)",
                        UserType(
                            @r(app.media.img_10),
                            "drakeet-${num}"
                        )
                    )
                )
            }
            num++
        }
    }

    @Builder
    func f1(item: Any, i: Int64) {
            Row() {
              Image(@r(app.media.avatar_drakeet))
                .objectFit(ImageFit.Cover)
                .width(36)
                .height(36)
                .margin(15)

              Column() {
                Row() {
                  Text((item as ItemsType).getOrThrow().user.name).fontSize(16).fontWeight(FontWeight.W700)
                  Blank()
                  Text("close: ${i}").fontSize(16).fontWeight(FontWeight.W700)
                    .onClick({ env =>
                        this.deleteItem = !this.deleteItem
                        spawn {
                            this.items.remove(i)
                        }
                    })
                }.width(100.percent)
                .margin( top: 15 )

                BinderType(itemData: (item as ItemsType).getOrThrow())

                Text((item as ItemsType).getOrThrow().createTime).fontSize(14)
              }.width(75.percent).alignItems(HorizontalAlign.Start)
            }
            .width(100.percent)
            .alignItems(VerticalAlign.Top)
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

@Component
class BinderType {
    @Prop
    var itemData: ItemsType
    func build() {
        Column() {
            if (this.itemData.content.content_type == 'simple_text') {
                Text(this.itemData.content.text)
                .fontSize(15)
            } else {
                Image(this.itemData.user.avatar)
                .objectFit(ImageFit.Cover)
                .width(90)
                .height(90)
                .renderMode(ImageRenderMode.Original)
            }
        }
        .width(100.percent)
        .margin(top: 6, bottom: 6)
        .alignItems(HorizontalAlign.Start)
    }
}
