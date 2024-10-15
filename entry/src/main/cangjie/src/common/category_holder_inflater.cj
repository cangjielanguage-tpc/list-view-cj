/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */
/**
 * Created on 2024/10/15
 */
package ohos_app_cangjie_entry.common
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*

public enum CommonTitleBar {
    | STRING(String)
    | RESOURCE(CJResource)

    public func isString() {
        match (this) {
            case STRING(_) =>true
            case _ => false
        }
    }

    public func getString(): String {
        match (this) {
            case STRING(v) => v
            case _ => throw Exception()
        }
    }

    public func getCJResource(): CJResource {
        match (this) {
            case RESOURCE(v) => v
            case _ => throw Exception()
        }
    }
}

@Component
public class TitleMore {

    var title: CommonTitleBar = CommonTitleBar.STRING("")

    func build() {
        Row() {
            Button() {
                Row() {
                    Image(@r(app.media.icon)).width(14).height(14).margin(right: 10)
                    if (this.title.isString()) {
                        Text(this.title.getString()).fontSize(18)
                    } else {
                        Text(this.title.getCJResource()).fontSize(18)
                    }
                }.alignItems(VerticalAlign.Center)
            }
            .backgroundColor(0xffffff).margin(left: 15)
            .shape(ShapeType.Normal)
            .stateEffect(true)
            Blank()
            Button() {
                Row() {
                    Text("更多").fontSize(18).fontColor(0x8a8a8a).margin(right: 5)
                    Image(@r(app.media.icon)).width(14).height(14).margin(right: 10)
                }.alignItems(VerticalAlign.Center)
            }
            .backgroundColor(0xffffff).margin(left: 15)
            .shape(ShapeType.Normal)
            .stateEffect(true)
        }
        .width(100.percent)
    }

}