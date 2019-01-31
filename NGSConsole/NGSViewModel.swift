//
// NGSConsole
// NGSViewModel 建立時間：2019/1/31 2:18 PM


import Foundation
import RxSwift
import RxCocoa
import JWTDecode
import ObjectMapper

open class NGSViewModel {

    private let api = NGSAPi()

    open func fetch(serverOne: String, serverTwo: String) -> Observable<Bool> {
        return api.requestNGSToken(one: serverOne, two: serverTwo).flatMap({ [weak self] (object) -> Observable<Bool> in
            guard let w = self else { return Observable.just(false) }

            do {
                let result = try decode(jwt: object.token)
                let value = Mapper<ChurchModel>().map(JSON: result.body)
                guard let searchString = Data(base64Encoded: value?.data ?? "", options: Data.Base64DecodingOptions.ignoreUnknownCharacters) else { return Observable.just(false) }
                let searchResult = NGSManager.shared.aes265Decode(data: searchString, key: value?.key ?? "", iv: value?.iv ?? "")
                NGSManager.shared.churchObject = Mapper<ChurchObject>().map(JSON: searchResult)

                return w.api.requestARC().flatMap({ (model) -> Observable<Bool> in
                    var dic: [String: Any] = [:]
                    let base64Decode: Data = Data(base64Encoded: model.data, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
                    dic = try JSONSerialization.jsonObject(with: base64Decode, options: []) as? [String: Any] ?? [:]
                    let arc = Mapper<ARCObject>().map(JSON: dic)
                    if arc?.show_url == "1" {
                        NGSManager.shared.arcObject = arc
                        return Observable.just(true)
                    } else {
                        NGSManager.shared.arcObject = arc
                        return Observable.just(false)
                    }
                })
            } catch {
                NSLog(error.localizedDescription)
            }
            return Observable.just(false)
        })
    }
}
