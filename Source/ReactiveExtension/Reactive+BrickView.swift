//
// Created by zh on 2021/6/25.
//

import RxSwift

public extension Reactive where Base: BrickView {

    var endEditing: Binder<Bool> {
        return Binder<Bool>(self.base) { (view, isEndEdit) in
            view.endEditing(isEndEdit)
        }
    }

    var hidden: Binder<Bool> {
        return Binder<Bool>(self.base) { (view, isHidden) in
            view.isHidden = isHidden
        }
    }

}
