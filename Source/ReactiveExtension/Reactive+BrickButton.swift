//
// Created by zh on 2021/6/25.
//

import RxSwift

public extension Reactive where Base: BrickButton {

    var enable: Binder<Bool> {
        return Binder<Bool>(self.base) { (btn, isEnable) in
            btn.isEnabled = isEnable
        }
    }

}