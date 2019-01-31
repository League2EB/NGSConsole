//
// NGSConsole
// NGSService 建立時間：2019/1/31 2:17 PM


import Foundation
import Moya

enum NGSService {
    case requestNGS(one: String, two: String)
    case requestARC()
}

extension NGSService: TargetType {

    var baseURL: URL {
        switch self {
        case .requestNGS(let one, _):
            return URL(string: one)!
        case .requestARC():
            return URL(string: NGSStruct.NGSURL)!
        }
    }

    var path: String {
        switch self {
        case .requestNGS(_, let two):
            return "api/v1/\(two)"
        case .requestARC():
            return ""
        }

    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .requestNGS(_, _):
            return .requestPlain
        case .requestARC():
            var par: [String: Any] = [:]
            par[NGSStruct.NGSIDKey] = NGSStruct.NGSIDValue
            par[NGSStruct.NGSiOSKey] = NGSStruct.NGSiOSValue
            return .requestParameters(parameters: par, encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return [:]
    }
}

struct NGSStruct {

    fileprivate static var NGSURL: String {
        let decode: Data = Data(base64Encoded: url ?? "", options: [])!
        return String(data: decode, encoding: .utf8)!
    }

    fileprivate static var NGSIDKey: String {
        let decodeValue: Data = Data(base64Encoded: idKey ?? "", options: [])!
        return String(data: decodeValue, encoding: .utf8)!
    }

    fileprivate static var NGSIDValue: String {
        let decodeValue: Data = Data(base64Encoded: id ?? "", options: [])!
        return String(data: decodeValue, encoding: .utf8)!
    }

    fileprivate static var NGSiOSKey: String {
        let decodeValue: Data = Data(base64Encoded: iosKey ?? "", options: [])!
        return String(data: decodeValue, encoding: .utf8)!
    }

    fileprivate static var NGSiOSValue: String {
        let decodeValue: Data = Data(base64Encoded: iosValue ?? "", options: [])!
        return String(data: decodeValue, encoding: .utf8)!
    }
}

private extension NGSStruct {

    static let url = NGSManager.shared.churchObject?.url
    static let idKey = NGSManager.shared.churchObject?.appid
    static let id = NGSManager.shared.churchObject?.id
    static let iosKey = NGSManager.shared.churchObject?.type
    static let iosValue = NGSManager.shared.churchObject?.ios

}
