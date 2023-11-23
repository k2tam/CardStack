//
//  SupportProcessView.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import UIKit



class SupportProcessView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var iconProcess: UIImageView!
    
    @IBOutlet weak var imageStatus: UIImageView!
    
    
    
    @IBOutlet weak var processTitle: UILabel!
    @IBOutlet weak var processTime: UILabel!
    @IBOutlet weak var processDate: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        commonInit()
    }

    
    public func configure(from process: SupportProcess){
        
        
        configForTextTitle(textTitleUI: process.textTitle)
        configForTextTime(textTimeUI: process.textTime)
        configForTextDate(textDateUI: process.textDate)
        
        
    }
    
    private func configForTextTitle(textTitleUI: TextProcess) {
        processTitle.text = textTitleUI.text
        processTitle.font = UIFont.systemFont(ofSize: CGFloat(textTitleUI.size), weight: .medium)
    }
    
    private func configForTextTime(textTimeUI: TextProcess) {
        processTime.text = textTimeUI.text
//        processTime.font = UIFont.systemFont(ofSize: CGFloat(textTimeUI.size), weight: .medium)
        processTime.font = UIFont.systemFont(ofSize: 10, weight: .medium)
    }
    
    private func configForTextDate(textDateUI: TextProcess) {
        processDate.text = textDateUI.text
//        processDate.font = UIFont.systemFont(ofSize: CGFloat(textDateUI.size), weight: .medium)
        processDate.font = UIFont.systemFont(ofSize: 10, weight: .medium)
    }

    
    private func commonInit(){
        Bundle.main.loadNibNamed("SupportProcessView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    
   
    
    
    
}
