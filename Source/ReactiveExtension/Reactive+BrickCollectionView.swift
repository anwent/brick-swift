//
// Created by zh on 2021/6/25.
//

import RxSwift

public extension Reactive where Base: BrickCollectionView {
    var reloadData: Binder<Void> {
        return Binder(self.base) { (cv, _) in
            cv.reloadData()
        }
    }

    var reloadSections: Binder<IndexSet> {
        return Binder(self.base) { (cv, set) in
            cv.reloadSections(set)
        }
    }

    var reloadRows: Binder<[IndexPath]> {
        return Binder(self.base) { (cv, items) in
            cv.reloadItems(at: items)
        }
    }
}
