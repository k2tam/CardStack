//
//  HomeVM.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import Foundation

enum eHomeTblItem {
    case rating
    case supportStatus
    case space
}


class HomeVM {
    var homeItems: [eHomeTblItem] = [.rating,.space,.supportStatus]
    
    var listRatings = Array<Card>.init(repeating: Card(question: "Bạn thấy dịch vụ bảo trì tại nhà thế nào ?"), count: 3)
    
    var listProcess = [
        SupportProcess(title: "Tiếp nhận"),
        SupportProcess(title: "Cử nhân viên"),
        SupportProcess(title: "Đã đến"),
        SupportProcess(title: "Hoàn tất"),
    ]
    
    
}
