package ohos_app_cangjie_entry.selectable

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import std.collection.ArrayList
import std.math.ceil

import multitype.MultiTypeAdapter
import multitype.Attributes
import multitype.MultiTypeArrayList
import ohos.webview.WebviewController
import ohos.hilog.*
import ohos.router.*
import ohos_app_cangjie_entry.common.*

@Entry
@Component
public class Index {
    var squares: MultiTypeArrayList = MultiTypeAdapter.createArray()

    @State
    var selectedSet: ArrayList<Int64> = ArrayList<Int64>()

    protected func aboutToAppear() {
        let squareGrid0: Array<SquareGrid> = [
            SquareGrid(0, false),
            SquareGrid(1, false),
            SquareGrid(2, false),
            SquareGrid(3, false),
            SquareGrid(4, false),
            SquareGrid(5, false),
            SquareGrid(6, false)
        ]

        let itemList0 = Square(CommonTitleBar.STRING("特别篇"), squareGrid0)
        this.squares.append(itemList0)
        let squareGrid1: ArrayList<SquareGrid> = ArrayList<SquareGrid>()
        for (j in 0..99) {
            squareGrid1.add(SquareGrid(j + 1, false))
        }
        let itemList1 = Square(CommonTitleBar.STRING("本篇"), squareGrid1.toArray())
        this.squares.append(itemList1)
    }

    @Builder
    func f1(s: Square, i: Int64) {
        Column() {
            TitleMore(title: s.title)
            MoreGrid(squareGrid: s.grids, selectedSet: this.selectedSet)
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
                            array: this.squares,
                            child: MultiTypeAdapter.convertType(this.f1),
                            attribute: Attributes ()
                        )
                    }
                }.height(94.percent)
            }
        }
    }
}


@Component
class MoreGrid {
    var rowsTemplate: String = ''
    var mHeight: Float64 = 0.0
    @State var squareGrid: Array<SquareGrid> = Array<SquareGrid>()
    var selectedSet: ArrayList<Int64> = ArrayList<Int64>()

    protected func aboutToAppear() {
        let rows = ceil(Float64(this.squareGrid.size) / 5.0);
        this.rowsTemplate = "1fr ".repeat(rows)
        this.mHeight = rows * 50.0;
    }

    func build () {
        Stack() {
            Grid {
                    ForEach(this.squareGrid, itemGeneratorFunc: {item: SquareGrid, i: Int64 =>
                      GridItem {
                        GridData(integerItem: item)
                      }.backgroundColor(0xE07679)
                    })
            }
        }
    }
}

@Component
class GridData {
  var integerItem: SquareGrid = SquareGrid(0, true)

  func build() {
    Column() {
      Text(this.integerItem.id.toString())
        .fontSize(14)
        .padding(10)
        .border(width: 2.px)
        .textAlign(TextAlign.Center)
        .width(100.percent)
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
