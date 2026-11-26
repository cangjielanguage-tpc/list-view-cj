package ohos_app_cangjie_entry.selectable
import ohos_app_cangjie_entry.common.*
public class SquareGrid {
    var id: Int64
    var isSelected: Bool
    
    public init(id: Int64, isSelected: Bool) {
        this.id = id
        this.isSelected = isSelected
    }
}

public class Square {
    public var title: CommonTitleBar
    public var grids: Array<SquareGrid>
    public init(title: CommonTitleBar, grids: Array < SquareGrid >) {
        this.title = title
        this.grids = grids
    }
}

