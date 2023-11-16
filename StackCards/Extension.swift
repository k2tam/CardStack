//
//  Extension.swift
//  StackCards
//
//  Created by k2 tam on 16/11/2023.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...){
        views.forEach { view in
            self.addSubview(view)
        }
    }
}

