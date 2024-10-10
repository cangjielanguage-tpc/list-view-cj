/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */

package ohos_app_cangjie_entry.common
import ohos.component.Column
import ohos.component.Text
import ohos.component.Blank
import ohos.component.Image
import ohos.component.ImageFit
import ohos.component.Row
import ohos.component.Button
import ohos.component.ViewBuilder
import ohos.component.CustomView
import ohos.component.CJEntry
import ohos.component.HorizontalAlign
import ohos.component.loadNativeView
import ohos.component.CustomDialogController
import ohos.component.CustomDialogControllerOptions
import ohos.component.Offset
import ohos.component.DialogAlignment
import ohos.state_manage.LocalStorage
import ohos.state_manage.ObservedProperty
import ohos.state_manage.SubscriberManager
import ohos.base.*
import ohos.state_macro_manage.CustomDialog
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.State
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.Builder
import ohos.state_macro_manage.r
import ohos.state_manage.ViewStackProcessor
import ohos.component.LegalCallCheck
import std.collection.ArrayList
import multitype.IMultiTypeItem
import multitype.MultiTypeAdapter
import multitype.Attributes

import encoding.json.JsonValue
import encoding.json.ToJson
import encoding.json.JsonString
import serialization.serialization.DataModel
import ohos.hilog.*
import ohos.router.*

import cj_res_entry.app

@Component
public class TitleBar {
    var dialogController: CustomDialogController = CustomDialogController(
        CustomDialogControllerOptions(
            builder: MyDialog(),
            autoCancel: true,
            alignment: DialogAlignment.Top,
            customStyle: true,
            offset: Offset(50.vp, 100.vp)
        )
    )

    func build() {
        Row() {
            Text(@r(app.string.app_name))
            .fontSize(18)
            .padding(
                left: 15,
                right: 15
            )
            .fontColor(Color.WHITE)
            Blank()
            Text('MORE ->')
            .fontSize(18)
            .fontColor(0xffffff)
            .margin(left: 5, right: 12 )
            Image(@r(app.media.app_icon))
                .width(40)
                .height(100.percent)
                .objectFit(ImageFit.Contain)
                .padding(right: 15)
                .onClick({event =>
                  this.dialogController.open()
                })

        }
        .width(100.percent)
        .height(50)
        .backgroundColor(0xFF4081)
    }
}


@CustomDialog
class MyDialog {
    var controller: Option<CustomDialogController> = Option.None
    func build() {
        Column {
            Text("NormalPage").fontSize(18).padding(15)
              .onClick({event =>
                Router.push(url:"pages/normal/NormalPage"
                )
              })
              Text("MultiSelectablePage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"pages/selectable/MultiSelectablePage"
                  )
                })
              Text("CommunicateWithPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"pages/communication/CommunicateWithBinderPage"
                  )
                })
              Text("BilibiliPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"pages/bilibili/BilibiliPage"
                  )
                })
              Text("WeiboPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"WeiboPage"
                  )
                })
              Text("OneDataToManyPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"OneDataToManPage"
                  )
                })
              Text("TestPayloadPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"pages/payload/TestPayloadPage"
                  )
                })
              Text("MoreApisPlaygroundPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"pages/more/MoreApisPlaygroundPage"
                  )
                })
        }
        .width(70.percent)
        .backgroundColor(Color.WHITE)
        .borderRadius(4)
        .alignItems(HorizontalAlign.Start)
    }
}
