//
//  SupportProgress.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import Foundation

struct SupportProcess {
    let title: String
    let time: String
    let date: String
    
    init(title: String, time: String = "08:15", date: String = "30/10/2023") {
        self.title = title
        self.time = time
        self.date = date
    }
}
