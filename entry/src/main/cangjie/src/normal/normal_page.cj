/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */
/**
 * Created on 2024/10/15
 */
package ohos_app_cangjie_entry.normal

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

class TXT {
    var name: String
    var path: CJResource
    
    public init(name: String, path: CJResource) {
        this.name = name
        this.path = path
    }
}

@Entry
@Component
public class NormalPage {
    var arr: MultiTypeArrayList = MultiTypeAdapter.createArray()

    protected func aboutToAppear() {
        for (i in 0..100){
            if ((i % 4) == 0) {
                this.arr.append(TXT("${i}_name", @r(app.media.img_00)))
            } else if ((i % 4) == 1) {
                this.arr.append(TXT("${i}_name", @r(app.media.img_01)))
            } else if ((i % 4) == 2) {
                this.arr.append(TXT("${i}_name", @r(app.media.img_10)))
            } else {
                this.arr.append(TXT("${i}_name", @r(app.media.img_11)))
            }
        }
    }

    @Builder
    func f1(t: TXT, i: Int64) {
        Column() {
            Text(t.name).fontSize(16).fontColor(Color.GRAY)
            Image(t.path)
            .objectFit(ImageFit.Contain)
            .height(90)
            .width(100.percent)
            .renderMode(ImageRenderMode.Original)
        }
    }

    func build() {
        Column() {
            TitleBar()
            MultiTypeAdapter (
                array: this.arr,
                child: MultiTypeAdapter.convertType(this.f1),
                attribute: Attributes(
                        topPadding: 1,
                        rightPadding: 1,
                        bottomPadding: 1,
                        leftPadding: 1,
                        topMargin: 1,
                        rightMargin: 1,
                        bottomMargin: 1,
                        leftMargin: 1,
                        space: 2,
                        initialIndex: 0,
                        dividerStrokeWidth: 0.vp,
                        dividerColor: Color.BLACK,
                        dividerStartMargin: 0.vp,
                        dividerEndMargin: 0.vp,
                        listDirection: Axis.Vertical,
                        editMode: true,
                        edgeEffect: EdgeEffect.Spring,
                        chainAnimation: true,
                        sticky: Sticky.Normal,
                        backgroundColor: Color.WHITE
                )
            )
        }
    }


}

