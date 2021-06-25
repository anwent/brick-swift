//
// Created by zh on 2021/6/17.
//

import RxSwift

extension Reactive where Base: BrickViewController {
    public var showSuccessToast: Binder<String?> {
        return Binder<String?>(self.base) { (vc, msg) in
            vc.toastDelegate?.successToast(msg)
        }
    }

    public var showErrorToast: Binder<String?> {
        return Binder<String?>(self.base) { (vc, msg) in
            vc.toastDelegate?.errorToast(msg)
        }
    }

    public var showStateToast: Binder<String?> {
        return Binder<String?>(self.base) { (vc, msg) in
            vc.toastDelegate?.stateToast(msg)
        }
    }

    public var showLoadingToast: Binder<String?> {
        return Binder<String?>(self.base) { (vc, msg) in
            vc.toastDelegate?.loadingToast(msg)
        }
    }
}

extension Reactive where Base: BrickViewController {
    public var showViewController: Binder<BrickViewController> {
        return Binder<BrickViewController>(self.base) { (vc, target) in
            vc.navigationController?.show(target, sender: nil)
        }
    }

    public var presentViewController: Binder<BrickViewController> {
        return Binder<BrickViewController>(self.base) { (vc, target) in
            vc.present(target, animated: true, completion: nil)
        }
    }
}

extension Reactive where Base: BrickViewController {
    var presentAlertController: Binder<UIAlertController?> {
        return Binder(self.base) { (vc, alert) in
            if let alertVC = alert {
                vc.view.setNeedsLayout()
                vc.view.layoutIfNeeded()
                vc.present(alertVC, animated: true, completion: nil)
            }
        }
    }
}