//
// Created by zh on 2021/6/28.
//

import HandyJSON

open class BrickModel: HandyJSON {

    /// 错误码
    var code: Int?
    /// 错误信息
    var message: String?

    /// 当前页数
    var currentPage: Int?
    /// 总页数
    var totalPage: Int?

    required public init() {}
    
    public func mapping(mapper: HelpingMapper) {}
    
}

extension BrickModel {
    var hasMoreData: Bool {
        return (totalPage ?? -1) > (currentPage ?? -1)
    }
}