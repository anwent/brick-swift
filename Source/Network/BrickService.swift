//
// Created by zh on 2021/6/28.
//

import Alamofire

public protocol BrickService {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
    var timeout: TimeInterval { get }
}
