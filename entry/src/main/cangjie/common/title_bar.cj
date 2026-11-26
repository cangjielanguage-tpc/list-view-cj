package ohos_app_cangjie_entry.common
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.resource_manager.__GenerateResource__
protected import std.collection.ArrayList
protected import multitype.MultiTypeAdapter
protected import multitype.Attributes
protected import ohos.hilog.*
protected import ohos.router.*

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
                Router.push(url:"NormalPage"
                )
              })
              Text("MultiSelectablePage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"Index"
                  )
                })
              Text("CommunicateWithPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"pages/communication/CommunicateWithBinderPage"
                  )
                })
              Text("ListPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"ListPage"
                  )
                })
              Text("ListPage2").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"ListPage2"
                  )
                })
              Text("OneDataToManyPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"OneDataToManPage"
                  )
                })
              Text("TestPayloadPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"TestPayloadPage"
                  )
                })
              Text("MoreApisPlaygroundPage").fontSize(18).padding(15)
                .onClick({event =>
                  Router.push(url:"MoreApisPlayground"
                  )
                })
        }
        .width(70.percent)
        .backgroundColor(Color.WHITE)
        .borderRadius(4)
        .alignItems(HorizontalAlign.Start)
    }
}
