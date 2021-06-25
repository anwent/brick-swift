//
// Created by zh on 2021/6/25.
//

import RxSwift
import UIKit

public extension Reactive where Base: BrickTableView {

    var reloadData: Binder<Void> {
        return Binder(self.base) { (tv, _) in
            tv.reloadData()
        }
    }

    func reloadSections(with animation: UITableView.RowAnimation = .none) -> Binder<IndexSet> {
        return Binder(self.base) { (tv, set) in
            tv.reloadSections(set, with: animation)
        }
    }

    func reloadRows(with animation: UITableView.RowAnimation = .none) -> Binder<[IndexPath]> {
        return Binder(self.base) { (tv, rows) in
            tv.reloadRows(at: rows, with: animation)
        }
    }

}

class A {
    func test() {

    }
}
