package ohos_app_cangjie_entry.normal

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.resource_manager.AppResource
import ohos.resource_manager.__GenerateResource__
import std.collection.ArrayList
import multitype.MultiTypeAdapter
import multitype.Attributes
import multitype.MultiTypeArrayList
import ohos.webview.WebviewController

import ohos.hilog.*
import ohos.router.*
import ohos_app_cangjie_entry.common.*

class TXT {
    var name: String
    var path: AppResource
    
    public init(name: String, path: AppResource) {
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
//            .height(90)
//            .width(100.percent)
            .renderMode(ImageRenderMode.Original)
        }.backgroundColor(Color(0x123456))
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
                        topMargin: 100,
                        rightMargin: 100,
                        bottomMargin: 100,
                        leftMargin: 100,
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
                        width: -360,
                        height: -460,
                        backgroundColor: Color.BLACK
                )
            )
        }
    }


}

