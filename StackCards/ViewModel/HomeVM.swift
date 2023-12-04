//
//  HomeVM.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import Foundation


protocol HomeVMDelegate: AnyObject {
    func didGetNewHomeData()
}

enum eHomeTblItem {
    case supportRatingQuests([SupportRatingQuest])
    case supportStatus(SupportProcessModel)
    case dummy
    case space
}


class HomeVM {
    var sampleListRatings = [
        SupportRatingQuest(question: "1 Quý khách đánh giá chất lượng hỗ trợ tại nhà thế nào ?"),
        SupportRatingQuest(question: "2 Quý khách đánh giá chất lượng hỗ trợ tại nhà thế nào ?"),
        SupportRatingQuest(question: "3 Quý khách đánh giá chất lượng hỗ trợ tại nhà thế nào ?"),
        SupportRatingQuest(question: "4 Quý khách đánh giá chất lượng hỗ trợ tại nhà thế nào ?"),
        SupportRatingQuest(question: "5 Quý khách đánh giá chất lượng hỗ trợ tại nhà thế nào ?"),
    ]
    
    var homeTblVData: [eHomeTblItem] = []
    
    var listSupportRatingsQuest: [SupportRatingQuest] = []

    var supportProcessModel: SupportProcessModel? = nil
    
    var delegate: HomeVMDelegate?
    
    
    func composeData() {
        var temp: [eHomeTblItem] = []
        homeTblVData = []
        
        
        if !listSupportRatingsQuest.isEmpty{
            temp.append(.supportRatingQuests(listSupportRatingsQuest))
        }
        
        if let supportProcessModel = supportProcessModel {
            temp.append(.supportStatus(supportProcessModel))
            
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)
            temp.append(.dummy)

        }
  
        //Add Space
        for (index, item) in temp.enumerated() {
            homeTblVData.append(item)
            if index != temp.count - 1 {
                homeTblVData.append(.space)
            }
        }
        
        //Update new data
        delegate?.didGetNewHomeData()
        
        
    }
    
    
  
    func fetchHomeData() {
            self.listSupportRatingsQuest = self.sampleListRatings
            self.composeData()
        
        
        
        HomeManager.callAPIForSupportProcessModel {[weak self] supportProcessModel in
            self?.supportProcessModel = supportProcessModel
            self?.composeData()

        }
    }
    
   
    
    
    
    
}
