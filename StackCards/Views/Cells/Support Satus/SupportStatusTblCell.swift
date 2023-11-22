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
    
    public func configure(supportProcessModel: SupportProcessModel) {
        let currentSupportIndex = supportProcessModel.uiCode.currentProcessIndex
        
        for (index, process) in supportProcessModel.uiCode.listProcess.enumerated() {
            let supportProcessView = SupportProcessView()
            
            
            supportProcessView.configure(from: process)
            processStack.addArrangedSubview(supportProcessView)
            
            supportProcessView.clipsToBounds = false
            supportProcessView.imageArea.clipsToBounds = false
            
        }
        
        processStack.layoutIfNeeded()
    

        var centerStatusPoints: [CGPoint] = []
        
        //Variable for get ImageStatusSize just once time
        var didGetImageStatusSize = false
        var sizeImageStatus: CGSize = .zero
        var processLines: [UIView] = []

        
        //Loop for getting sizeImageStatus and centerStatusPoints
        for view in processStack.subviews {
            if let view = view as? SupportProcessView {
                if !didGetImageStatusSize {
                    sizeImageStatus = view.imageStatus.bounds.size
                    didGetImageStatusSize = true
                }
                centerStatusPoints.append(view.convert(view.imageStatus.center, to: processStack))
            }
        }
        
        
        //Loop for draw process lines and store them in processLines list
        for i in 0..<centerStatusPoints.count-1 {
            let curCenterPoint = centerStatusPoints[i]
            let nextCenterPoint = centerStatusPoints[i+1]
            
            let heightConnectLine = 2
            let halfImageStatusWidth = sizeImageStatus.width / 2
            
            let connectLine = UIView(frame: CGRect(
                x: Int(curCenterPoint.x + CGFloat(sizeImageStatus.width) / 2) + 1,
                y: Int(curCenterPoint.y) - heightConnectLine / 2,
                width: Int(nextCenterPoint.x - curCenterPoint.x - 2 -  halfImageStatusWidth * 2),
                height: 2
            ))
            
            connectLine.backgroundColor = .red
            
            processLines.append(connectLine)

            if i == currentSupportIndex - 1 {
                connectLine.backgroundColor = .clear
            }
            
            
            processStack.addSubViews(connectLine)
 
        }
        
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
//            let animProcessLines = processLines[currentSupportIndex - 1]
//            animProcessLines.backgroundColor = .blue
//            let oldWidth = animProcessLines.frame.width
//            animProcessLines.frame.size.width = 0
//            
//            UIView.animate(withDuration: 1.0, animations: {
//                animProcessLines.frame.size.width = oldWidth // Adjust this value for the desired distance
//            })
//         
//        }
        
    }
 
    

        
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
