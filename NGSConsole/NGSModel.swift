//
// NGSConsole
// NGSModel 建立時間：2019/1/31 2:14 PM
	

import Foundation
import ObjectMapper

class TokenObject: Mappable {
    
    var token: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        token <- map["token"]
    }
}

class ChurchModel: Mappable {
    
    var data: String = ""
    var key: String = ""
    var iv: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
        key <- map["key"]
        iv <- map["iv"]
    }
}

class ChurchObject: Mappable {
    
    var url: String = ""
    var appid: String = ""
    var type: String = ""
    var id: String = ""
    var ios: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        appid <- map["appid"]
        type <- map["type"]
        id <- map["id"]
        ios <- map["ios"]
    }
}

class ARCModel: Mappable {
    
    var type: String = ""
    var data: String = ""
    var rt_code: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        data <- map["data"]
        rt_code <- map["rt_code"]
    }
}

class ARCObject: Mappable {
    
    var url: String = ""
    var type: String = ""
    var show_url: String = ""
    var appid: String = ""
    var comment: String = ""
    var createAt: String = ""
    var updateAt: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        type <- map["type"]
        show_url <- map["show_url"]
        appid <- map["appid"]
        comment <- map["comment"]
        createAt <- map["createAt"]
        updateAt <- map["updateAt"]
    }
}
