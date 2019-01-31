//
// NGSConsole
// NGSManager 建立時間：2019/1/31 2:15 PM
	

import Foundation
import CryptoSwift

class NGSManager {
    
    public static var shared: NGSManager {
        get {
            objc_sync_enter(NGSManager.self)
            if instance == nil {
                instance = NGSManager()
            }
            objc_sync_exit(NGSManager.self)
            return instance!
        }
    }
    
    private init() {
        
    }
    
    private static var instance: NGSManager? = nil
    
    public var churchObject: NGSObject? = nil
    public var arcObject: ARCObject? = nil
    
    public func aes265Decode(data: Data, key: String, iv: String) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            let aesDec: AES = try AES(key: key.bytes, blockMode: CBC(iv: iv.bytes), padding: .pkcs7)
            let dec = try aesDec.decrypt(data.bytes)
            let desData: Data = Data(bytes: dec, count: dec.count)
            json = try JSONSerialization.jsonObject(with: desData, options: []) as? [String: Any] ?? [:]
        } catch {
            print("Error")
        }
        return json
    }
}
