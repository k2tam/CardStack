//
//  SupportStatusTblCell.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import UIKit

class SupportStatusTblCell: UITableViewCell {
    static let cellIdentifier = "SupportStatusTblCell"
    
    @IBOutlet weak var processArea: UIView!
    @IBOutlet weak var processStack: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        processArea.layer.cornerRadius = 8
        processStack.distribution = .fillEqually
        
    }
    
    public func configure(listProcess: [SupportProcess]) {
        
        for process in listProcess {
            let supportProcessView = SupportProcessView()
            processStack.addArrangedSubview(supportProcessView)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
