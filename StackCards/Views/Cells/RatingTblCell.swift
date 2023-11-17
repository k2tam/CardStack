//
//  RatingTblCell.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import UIKit

class RatingTblCell: UITableViewCell {
    static let cellIdentifier = "RatingTblCell"
    
    var listRatings: [Card] = []
    
    lazy var cardStack: UIView = {
        let stack = UIView()
        stack.clipsToBounds = false
        return stack
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(hex: "#F5F5F5")

        contentView.addSubViews(cardStack)
        
        
        cardStack.frame.size = CGSize(width: contentView.bounds.width - 32, height: 250)
        cardStack.center = contentView.center
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            cardStack.frame.size = CGSize(width: contentView.frame.width, height: 250)
            cardStack.center = contentView.center
            addCards()

        }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    public func configure(listRatings: [Card]) {
        self.listRatings = listRatings
        
    }
    
    
    private func addCards() {
        let cardOffSet: CGFloat = 10
        
        for (index, card) in listRatings.enumerated() {
            let offsetIndex = listRatings.count - 1 - index
            let cardView = CardView()
            cardView.configure(question: "\(card.question)")
            cardView.delegate = self

            cardStack.addSubview(cardView)
            
            
            cardView.frame.size = CGSize(width: cardStack.bounds.width - 32, height: cardStack.bounds.height - 40)
            
            cardView.center = CGPoint(
                x: cardStack.bounds.midX + CGFloat(offsetIndex * Int(cardOffSet)),
                y:  cardStack.bounds.midY +  CGFloat(offsetIndex * Int(cardOffSet)))

        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

extension RatingTblCell: CardViewDelegate {
    func didTapCloseCard(cardClosed: CardView) {
        UIView.animate(withDuration: 0.25, animations: {
            cardClosed.alpha = 0
        }) { _ in
            cardClosed.removeFromSuperview()
            
            UIView.animate(withDuration: 0.2) {
                for cardView in self.cardStack.subviews {
                    if let cardView = cardView as? CardView {

                        let newFrame = cardView.frame.offsetBy(dx: -10, dy: -10)
                        cardView.frame = newFrame
                    }
                }
            }
        }
  
    }
}
