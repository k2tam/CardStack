//
//  SupportProcessView.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import UIKit

class SupportProcessView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var leftProcessLine: UIView!
    @IBOutlet weak var rightProcessLine: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("SupportProcessView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setupLayer()
    }
    
    
     func setupLayer() {
         rightProcessLine.roundCorners(corners: [.topLeft, .bottomLeft], radius: rightProcessLine.bounds.height / 2)
         leftProcessLine.roundCorners(corners: [.topRight, .bottomRight], radius: leftProcessLine.bounds.height / 2)

    }
    
    
    
}
