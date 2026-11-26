package ohos_app_cangjie_entry.more
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

let txt: String = 'ObservableTextItemViewBinder: '

@Entry
@Component
public class MoreApisPlayground {
    var items: MultiTypeArrayList = MultiTypeAdapter.createArray()

    @State
    var observable: String = txt
    let scroller: Scroller = Scroller()

    @State
    var buffer: Int64 = 0

    @Builder
    func MyListItem(s: Int64, i: Int64) {
        Column() {
            Button("observable item(${s})")
            .shape(ShapeType.Capsule)
            .width(220)
            .fontSize(16)
            .borderRadius(1)
            .backgroundColor(0xCCCCCC)
            .border(width: 1.px, color: Color.BLACK)
            .fontColor(Color.BLACK)
        }
    }

    protected func aboutToAppear() {
        var num = 0
        while (num < 19) {
            this.items.append(num)
            num++
        }
    }

    func build () {
        Column() {
            TitleBar()
            Column() {
                Row(10) {
                    Button("ADD")
                    .borderRadius(6)
                    .backgroundColor(0xCCCCCC)
                    .fontColor(Color.BLACK)
                    .layoutWeight(1)
                    .shape(ShapeType.Normal)
                    .onClick({env =>
                        let time: Int64 = DateTime.now().nanosecond
                        this.items.append(time)
                        this.scroller.scrollToIndex(Int32(this.items.size))
                    })
                    Button('REMOVE')
                    .borderRadius(6)
                    .shape(ShapeType.Normal)
                    .backgroundColor(0xCCCCCC)
                    .fontColor(Color.BLACK)
                    .layoutWeight(1)
                    .onClick({event =>
                        this.items.remove(this.items.size -1)
                        this.scroller.scrollToIndex(Int32(this.items.size))
                    })
                    Button('CLEAR')
                    .borderRadius(6)
                    .shape(ShapeType.Normal)
                    .backgroundColor(0xCCCCCC)
                    .fontColor(Color.BLACK)
                    .layoutWeight(1)
                    .onClick({event =>
                        this.items[0] =  this.items.size
                    })
                }
                Scroll() {
                    Text(this.observable).fontSize(14).fontColor(0x8CF22F).padding(15)
                }.backgroundColor(Color.BLACK).height(75.percent).width(100.percent).align(Alignment.TopStart)
            }.height(25.percent)
            Column() {
                MultiTypeAdapter(
                    array: this.items,
                    child: MultiTypeAdapter.convertType(this.MyListItem),
                    attribute: Attributes(
                        onScrollIndex: {firstIndex: Int64, lastIndex: Int64 =>
                            this.appendTerminalLine("observable first item(${(this.items[firstIndex] as ToString)})\n observable last item(${(this.items[lastIndex] as ToString)})")
                        }
                    )
                )
            }.width(100.percent).height(70.percent).alignItems(HorizontalAlign.Start)
        }
    }
    func appendTerminalLine(line: String): Unit {
        if (this.buffer == 3) {
            this.observable = txt
            this.buffer = 0
        }
        this.observable += "\n" + line
        this.buffer++
    }
}