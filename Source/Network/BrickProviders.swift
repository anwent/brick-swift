//
// Created by zh on 2021/6/28.
//

public protocol BrickNetworkInterface {}


public struct Providers: BrickNetworkInterface {

    public private(set) var successfulCode: Int
    public private(set) var logEnable: Bool
    
    public static var instance: Providers = Providers()

    private init() {
        successfulCode = 200
        logEnable = false
    }

}

extension Providers {
    /// 配置Http成功状态码， 默认 200
    public mutating func config(successfulCode code: Int) -> Self {
        successfulCode = code
        return self
    }
    
    /// log
    public mutating func config(logEnable enable: Bool) -> Self {
        logEnable = enable
        return self
    }
}
