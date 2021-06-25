//
// Created by zh on 2021/6/17.
//

import RxSwift
import RxCocoa
import UIKit

open class BrickViewModel: NSObject {

    public let bag = DisposeBag()

    // mark: toast
    private let _successToast = BehaviorRelay<String?>(value: nil)
    private let _errorToast = BehaviorRelay<String?>(value: nil)
    private let _stateToast = BehaviorRelay<String?>(value: nil)
    private let _loadingToast = BehaviorRelay<String?>(value: nil)

    // mark: network
    internal let activityIndicator = ActivityIndicator()

    // mark: navigator
    private let _showViewController = BehaviorRelay<BrickViewController?>(value: nil)
    private let _presentViewController = BehaviorRelay<BrickViewController?>(value: nil)

    // mark: alertController
    private let _presentAlertController = BehaviorRelay<UIAlertController?>(value: nil)

}

extension BrickViewModel {
    var successToast: Driver<String?> {
        return _successToast.asDriver()
    }

    var errorToast: Driver<String?> {
        return _errorToast.asDriver()
    }

    var stateToast: Driver<String?> {
        return _stateToast.asDriver()
    }

    var loadingToast: Driver<String?> {
        return _loadingToast.asDriver()
    }
}

extension BrickViewModel {
    var showViewController: Driver<BrickViewController> {
        return _showViewController
                .flatMap {
                    Observable.from(optional: $0)
                }
                .asDriverOnErrorJustComplete()
    }

    var presentViewController: Driver<BrickViewController> {
        return _presentViewController
                .flatMap {
                    Observable.from(optional: $0)
                }
                .asDriverOnErrorJustComplete()
    }

    var presentAlertController: Driver<UIAlertController> {
        return _presentAlertController
                .flatMap {
                    Observable.from(optional: $0)
                }
                .asDriverOnErrorJustComplete()
    }
}
