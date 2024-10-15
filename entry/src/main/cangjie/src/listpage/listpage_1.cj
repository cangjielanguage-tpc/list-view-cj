/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */
/**
 * Created on 2024/10/15
 */
package ohos_app_cangjie_entry.listpage

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
import std.time.DateTime
import std.math.round

public class Post {
    var res: CJResource
    var title:  String
    public init(res: CJResource, title: String) {
        this.res = res
        this.title = title
    }
}

public class PostList {
    var posts: ArrayList<Post>
    public init(posts: ArrayList < Post >) {
        this.posts = posts
    }
}
@Entry
@Component
public class ListPage {
    var PREFIX: String = "这是一条长长的达到两行的标题文字"
    var post00: Post = Post(@r(app.media.img_00), this.PREFIX + "post00")
    var post01: Post = Post(@r(app.media.img_01), this.PREFIX + "post01")
    var post10: Post = Post(@r(app.media.img_10), this.PREFIX + "post10")
    var post11: Post = Post(@r(app.media.img_11), this.PREFIX + "post11")
    var posts: MultiTypeArrayList = MultiTypeAdapter.createArray()
    protected func aboutToAppear() {
        this.posts.append(this.post00)
        this.posts.append(this.post01)
        this.posts.append(this.post10)
        this.posts.append(this.post11)
        this.posts.append(this.post00)
        this.posts.append(this.post01)
        this.posts.append(this.post00)
        this.posts.append(this.post00)
      }
    @Builder
    func f1(p: Post, i: Int64) {
        Column() {
          TitleMore(title : STRING("title0"))
          MoreGrid(posts: this.posts)
        }
        .alignItems(HorizontalAlign.Start)
        .width(100.percent)
    }

    func build() {
        Stack() {
            Column() {
                TitleBar()
                Scroll() {
                    Column() {
                        MultiTypeAdapter(
                            array: this.posts,
                            child: MultiTypeAdapter.convertType(this.f1),
                            attribute: Attributes ()
                        )
                    }
                }.height(94.percent)
            }
        }
    }
}

extend String {
    func repeat(c: Int64): String {
        var s = StringBuilder(this)
        for (i in 0..c) {
            s.append(this)
        }
        return s.toString()
    }
    func repeat(c: Float64): String {
        var s = StringBuilder(this)
        for (i in 0..Int64(c)) {
            s.append(this)
        }
        return s.toString()
    }
}


@Component
class MoreGrid {
    var rowsTemplate: String = ""
    var mHeight: Int64 = 0
    var posts: MultiTypeArrayList = MultiTypeArrayList()
    let scroller: Scroller = Scroller()
    protected func aboutToAppear() {
        let rows = round(Float64(this.posts.size / 2));
        this.rowsTemplate = '1fr '.repeat(rows);
        this.mHeight = Int64(rows * 150.0);
    }

    func build() {
            Grid(scroller) {
                ForEach(this.posts.toArray(),
                    itemGeneratorFunc: {item: Any, i: Int64 =>
                        Column() {
                            Image((item as Post).getOrThrow().res)
                            .objectFit(ImageFit.Contain)
                            .height(90)
                            .width(100.percent)
                            .renderMode(ImageRenderMode.Original)
                            Text((item as Post).getOrThrow().title)
                            .width(180)
                            .fontSize(15)
                        }
                        .width(100.percent)
                        .height(130)
                        .margin(left: 15, right: 15)
                        .backgroundColor(Color.WHITE)
                    })
            }
            .rowsTemplate(this.rowsTemplate)
            .columnsTemplate("1fr 1fr")
            .columnsGap(8)
            .rowsGap(8)
            .height(this.mHeight)
    }

}