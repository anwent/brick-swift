//
// Created by zh on 2021/6/17.
//

import UIKit
import RxCocoa
import RxSwift

public protocol BrickToastDelegate: BrickViewController {
    func successToast(_ msg: String?)
    func errorToast(_ msg: String?)
    func stateToast(_ msg: String?)
    func loadingToast(_ msg: String?)
}

open class BrickViewController: UIViewController {

    public let bag = DisposeBag()

    open var toastDelegate: BrickToastDelegate?

    private(set) var viewModel: BrickViewModel

    init(viewModel vm: BrickViewModel) {
        viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }

    init(viewModel vm: BrickViewModel, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = vm
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    open func bindViewModel() {
        bindToast()
        bindNavigator()
    }

    open func bindToast() {
        _ = viewModel.successToast.drive(rx.showSuccessToast).disposed(by: bag)
        _ = viewModel.errorToast.drive(rx.showErrorToast).disposed(by: bag)
        _ = viewModel.stateToast.drive(rx.showStateToast).disposed(by: bag)
        _ = viewModel.loadingToast.drive(rx.showLoadingToast).disposed(by: bag)
    }

    open func bindNavigator() {
        _ = viewModel.showViewController.drive(rx.showViewController).disposed(by: bag)
        _ = viewModel.presentViewController.drive(rx.presentViewController).disposed(by: bag)
        _ = viewModel.presentAlertController.drive(rx.presentAlertController).disposed(by: bag)
    }
}



