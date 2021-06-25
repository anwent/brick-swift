//
// Created by zh on 2021/6/25.
//

import RxSwift

public extension Reactive where Base: BrickTextField {

    var textChanged: Observable<String?> {
        return Observable.merge(
                self.base.rx.observe(String.self, "text"),
                self.base.rx.controlEvent(.editingChanged).withLatestFrom(self.base.rx.text)
        )
    }

}