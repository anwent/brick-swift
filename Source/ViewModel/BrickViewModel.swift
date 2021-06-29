//
// Created by zh on 2021/6/17.
//

import RxSwift
import RxCocoa
import UIKit

open class BrickViewModel: NSObject {

    public let bag = DisposeBag()

    private let _successToast = BehaviorRelay<String?>(value: nil)
    private let _errorToast = BehaviorRelay<String?>(value: nil)
    private let _stateToast = BehaviorRelay<String?>(value: nil)
    private let _loadingToast = BehaviorRelay<String?>(value: nil)

    public let activityIndicator = BrickActivityIndicator()

    private let _showViewController = BehaviorRelay<BrickViewController?>(value: nil)
    private let _presentViewController = BehaviorRelay<BrickViewController?>(value: nil)
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

extension BrickViewModel: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("tableView(_:numberOfRowsInSection:) has not been implemented")
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("tableView(_:cellForRowAt:) has not been implemented")
    }
}

extension BrickViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fatalError("collectionView(_:numberOfItemsInSection:) has not been implemented")
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        fatalError("collectionView(_:cellForItemAt:) has not been implemented")
    }
}
