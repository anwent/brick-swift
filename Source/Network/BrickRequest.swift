//
// Created by zh on 2021/6/28.
//

import Alamofire
import RxSwift
import HandyJSON

public struct BrickRequest<T: BrickModel> {
    public typealias AFResponseString = (AFDataResponse<String>)
}

extension BrickRequest {
    public static func send(_ service: BrickService) -> Observable<BrickResponse<T>> {
        return Observable.create { observable in
            _ = AF.request(service.baseURL,
                    method: service.method,
                    parameters: service.parameters,
                    encoding: service.encoding,
                    headers: service.headers) { urlRequest in
                urlRequest.timeoutInterval = service.timeout
            }.responseString(completionHandler: { response in
                switch response.result {
                case .success(let json):
                    guard let model = T.deserialize(from: json) else {
                        observable.onNext(.error(nil))
                        observable.onCompleted()
                        return
                    }
                    if model.code == Providers.instance.successfulCode {
                        observable.onNext(.success(model))
                    } else {
                        observable.onNext(.error(model.message))
                    }
                    observable.onCompleted()
                case .failure(let afError):
                    observable.onNext(.error(afError.localizedDescription))
                    observable.onCompleted()
                }
            }).cURLDescription { description in
                #if DEBUG
                if Providers.instance.logEnable {
                    print(description)
                }
                #endif
            }
            return Disposables.create()
        }
    }
}
