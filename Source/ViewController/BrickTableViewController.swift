//
// Created by zh on 2021/6/29.
//

import UIKit
import SnapKit

open class BrickTableViewController<T: BrickTableView>: BrickViewController {

    open private(set) lazy var tableView: T = {
        let tableView = T()
        registerTableViewCell()
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        return tableView
    }()
    
    open override func makeUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    open func registerTableViewCell() {
        fatalError("register tableView cell has not been implemented")
    }

}
