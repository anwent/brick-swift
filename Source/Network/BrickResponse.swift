//
// Created by zh on 2021/6/28.
//

public enum BrickResponse<T: BrickModel> {
    case error(String?)
    case success(T)
}

extension BrickResponse {
    
    var result: T? {
        guard case let .success(r) = self else {
            return nil
        }
        return r
    }

    var error: String? {
        guard case let .error(e) = self else {
            return nil
        }
        return e
    }
    
    var isSuccessful: Bool {
        let code = result?.code ?? -999
        return code == Providers.instance.successfulCode
    }
}
