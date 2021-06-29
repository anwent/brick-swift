//
// Created by zh on 2021/6/25.
//

import UIKit

open class BrickCollectionView: UICollectionView {

    required public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
