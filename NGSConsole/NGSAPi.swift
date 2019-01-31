//
// NGSConsole
// NGSAPi 建立時間：2019/1/31 2:17 PM


import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper

class NGSAPi {

    private let provider = MoyaProvider<NGSService>()
    private let queue = SerialDispatchQueueScheduler.init(qos: .background)
    private let main = MainScheduler.instance

    public func requestNGSToken(one: String, two: String) -> Observable<TokenObject> {
        return provider.rx.request(.requestNGS(one: one, two: two)).asObservable().mapObject(TokenObject.self).subscribeOn(queue).observeOn(main)
    }

    public func requestARC() -> Observable<ARCModel> {
        return provider.rx.request(.requestARC()).asObservable().mapObject(ARCModel.self).subscribeOn(queue).observeOn(main)
    }
}
