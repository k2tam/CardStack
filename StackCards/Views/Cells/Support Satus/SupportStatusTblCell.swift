//
//  SupportStatusTblCell.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import UIKit

struct ProcessAndItsLine{
    let process: SupportProcess
    let line: UIView
}



class SupportStatusTblCell: UITableViewCell {
    static let cellIdentifier = "SupportStatusTblCell"
    
    @IBOutlet weak var processArea: UIView!
    @IBOutlet weak var processStack: UIStackView!
    
    var listProcessModel: [SupportProcess] = []
    var listProcessAndItsLine: [ProcessAndItsLine] = [] {
        didSet {
            animateProcessLine()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        processArea.layer.cornerRadius = 8
        processStack.distribution = .fillEqually
        
        
    }
    
    public func configure(supportProcessModel: SupportProcessModel) {
        self.listProcessModel = supportProcessModel.uiCode.listProcess
        
       
        addProcessesToProcessStack()
        
        drawProcessLines()
        
    }
    
    func addProcessesToProcessStack() {
        for (index, process) in self.listProcessModel.enumerated() {
            let supportProcessView = SupportProcessView()
            
            
            supportProcessView.configure(from: process)
            processStack.addArrangedSubview(supportProcessView)
            
            processStack.layoutIfNeeded()
            
        }
    }
    
    
    private func drawProcessLines() {
        var centerStatusPoints: [CGPoint] = []
        
        //Variable for get ImageStatusSize just once time
        var didGetImageStatusSize = false
        var sizeImageStatus: CGSize = .zero
        
        
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
            
            //Each process lines is own by the right process
            let processOwnThisLine = self.listProcessModel[i+1]
            
            let curCenterPoint = centerStatusPoints[i]
            let nextCenterPoint = centerStatusPoints[i+1]
            
            let heightConnectLine = 2
            let halfImageStatusWidth = sizeImageStatus.width / 2
            
            let processLine = UIView(frame: CGRect(
                x: Int(curCenterPoint.x + CGFloat(sizeImageStatus.width) / 2) + 1,
                y: Int(curCenterPoint.y) - heightConnectLine / 2,
                width: Int(nextCenterPoint.x - curCenterPoint.x - 2 -  halfImageStatusWidth * 2),
                height: 2
            ))
            
            processLine.backgroundColor = UIColor(hex: "#B0B0B0")
            listProcessAndItsLine.append(ProcessAndItsLine(process: processOwnThisLine, line: processLine))
            
            processStack.addSubViews(processLine)
        }
        
    }
    
    private func animateProcessLine() {
        
        for process in listProcessAndItsLine {
            if process.process.isActive {
                
                
                let activeProcessLine = UIView()
                activeProcessLine.frame.origin = CGPoint(x: process.line.frame.origin.x, y: process.line.frame.origin.y)
                activeProcessLine.frame.size = CGSize(width: process.line.bounds.width, height: process.line.bounds.height)
                activeProcessLine.backgroundColor = UIColor(hex: process.process.leftLineColor)

                
                processStack.addSubview(activeProcessLine)
                
                processStack.layoutIfNeeded()

                
//                UIView.animate(withDuration: 1.0, animations: {
//                    activeProcessLine.frame.size.width = process.line.frame.width
//                })
            }
        }
    }
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
