package ohos_app_cangjie_entry.payload

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
import ohos_app_cangjie_entry.common.*
import std.time.DateTime

@Entry
@Component
public class TestPayloadPage {
    var items: MultiTypeArrayList = MultiTypeAdapter.createArray()

    protected func aboutToAppear(){
        var num: Int64 = 0;
        while (num < 30) {
            if (num % 2 == 0) {
                this.items.append("00001-${num}")
            } else {
                this.items.append("00002-${num}")
            }
            num++
        }
    }

    @Builder
    func f2(item: String, i: Int64) {
          Column(10) {
            Text(item).fontSize(16).fontColor(Color.GRAY)
            Text("0002").fontSize(16).fontColor(Color.GRAY)
            Text("0003").fontSize(16).fontColor(Color.GRAY)
            Text("currentTimeMillis: ${DateTime.now()}").fontSize(16).fontColor(Color.GRAY)
          }.alignItems(HorizontalAlign.Start)
    }

    func build() {
        Column {
          TitleBar()
          MultiTypeAdapter(
                array: items,
//                child: this.f1,
                child: MultiTypeAdapter.convertType(this.f2),
                attribute: Attributes (
                    onScrollIndex: {firstIndex: Int64, lastIndex: Int64 =>
                        Hilog.error(999, "multitype", "firstIndex:${firstIndex}, lastIndex:${lastIndex}")
                    }
                )
            )
        }
    }
}
