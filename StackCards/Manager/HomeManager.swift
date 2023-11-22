//
//  HomeManager.swift
//  StackCards
//
//  Created by k2 tam on 22/11/2023.
//

import Foundation
import SwiftyJSON


struct HomeManager {
    public static var shared = HomeManager()
    
     static func callAPIForSupportProcessModel(completion: @escaping ((SupportProcessModel?) -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            guard let data = SampleData.sampleProcessList.data(using: .utf8) else {
                completion(nil)
                return
            }
            
            if let json = try? JSON(data: data){
                completion(SupportProcessModel(json: json["uiCode"]))
                return
            }
        }
       
    }
    
}
