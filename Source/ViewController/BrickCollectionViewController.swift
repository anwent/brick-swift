//
//  BrickCollectionViewController.swift
//  BrickSwift
//
//  Created by zh on 2021/6/29.
//

import UIKit

open class BrickCollectionViewController<T: BrickCollectionView>: BrickViewController {
    
    private var layout: UICollectionViewLayout
    
    open private(set) lazy var collectionView: T = {
        let collectionView = T(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
        return collectionView
    }()
    
    init(viewModel vm: BrickViewModel, collectionViewLayout: UICollectionViewLayout) {
        layout = collectionViewLayout
        super.init(viewModel: vm)
    }
    
    open override func makeUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
