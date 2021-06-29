//
// Created by zh on 2021/6/25.
//

import UIKit

open class BrickTableView: UITableView {
    
    required public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required public init() {
        super.init(frame: .zero, style: .plain)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
