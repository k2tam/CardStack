//
//  SupportProgress.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import Foundation
import SwiftyJSON

struct SupportProcessModel {
    let uiCode: UICode
    
    init(json: JSON){
        self.uiCode = UICode(json: json)
    }
}

struct UICode {
    var listProcess: [SupportProcess]
    
    init(json: JSON){
        self.listProcess = json["listProcess"].arrayValue.map({
            SupportProcess(json: $0)
        })
    }

}

struct SupportProcess {
    var isActive: Bool
    var imgIcon: String
    var imgStatus: String
    var leftLineColor: String
    var textTitle: TextProcess
    var textTime: TextProcess
    var textDate: TextProcess
    var action: ProcessAction
    
    init(json: JSON ){
        self.isActive = json["isActive"].boolValue
        self.imgIcon = json["imgIcon"].stringValue
        self.imgStatus = json["imgStatus"].stringValue
        self.leftLineColor = json["leftLineColor"].stringValue
        self.textTitle = TextProcess(json: json["textTitle"])
        self.textTime = TextProcess(json: json["textTime"])
        self.textDate = TextProcess(json: json["textDate"])
        self.action = ProcessAction(json: json["action"])
    }
    
}

enum eFontWeight: String {
    case medium = "medium"
    
}

struct TextProcess {
    var text: String
    var textColor: String
    var fontWeight: eFontWeight?
    var backgroundColor: String
    var size: Int
    var roundCorner: Int
    
    init(json: JSON){
        self.text = json["text"].stringValue
        self.textColor = json["textColor"].stringValue
        self.fontWeight = eFontWeight(rawValue: json["fontWeight"].stringValue)
        self.backgroundColor = json["backgroundColor"].stringValue
        self.size = json["size"].intValue
        self.roundCorner = json["roundCorner"].intValue
        
    }
}


struct ProcessAction {
    var dataAction: String
    var actionType: String
    
    init(json: JSON){
        self.dataAction = json["dataAction"].stringValue
        self.actionType = json["actionType"].stringValue
    }
}
