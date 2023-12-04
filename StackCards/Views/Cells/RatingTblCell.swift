//
//  RatingTblCell.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import UIKit

class RatingTblCell: UITableViewCell {
    static let cellIdentifier = "RatingTblCell"
    
    let cardOffSet: CGFloat = 10
    let cardHeight: CGFloat = 258
    
    
    lazy var cardStack: UIView = {
        let stack = UIView()
        stack.clipsToBounds = false
        return stack
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(hex: "#F5F5F5")

        contentView.addSubViews(cardStack)
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    public func configure(listRatings: [SupportRatingQuest]) {
        //Clear previous view in stack
        for view in cardStack.subviews {
            view.removeFromSuperview()
        }
        
        
        cardStack.frame.size = CGSize(width: contentView.frame.width - 16 - 16, height: contentView.frame.height)
//        cardStack.center = contentView.center
        
        cardStack.frame.origin = CGPoint(
            x: contentView.frame.minX + 16,
            y: contentView.frame.minY)
        
        
        addCards(listRatings: listRatings)
        
        
    }
    
    
    private func addCards(listRatings: [SupportRatingQuest]) {
        let numCards = listRatings.count
        
        for (index, card) in listRatings.reversed().enumerated() {
            let offsetIndex = listRatings.count - 1 - index
            let cardView = CardView()
            cardView.configure(question: "\(card.question)")
            cardView.delegate = self
            
            
            //Hidden all the cards from 3 index
            if index < listRatings.count - 3 {
                cardView.isHidden = true
            }
          
            
            cardStack.addSubview(cardView)
            
            
            //            cardView.center = CGPoint(
            //                x: cardStack.bounds.midX + CGFloat(offsetIndex * Int(cardOffSet)),
            //                y:  cardStack.bounds.midY +  CGFloat(offsetIndex * Int(cardOffSet)))
            
            cardView.frame.size = CGSize(width: cardStack.bounds.width - cardOffSet * 2, height: cardHeight)
            

            
            cardView.frame.origin = CGPoint(
                x: cardStack.frame.origin.x - 16 + CGFloat(offsetIndex * Int(cardOffSet)),
                y: cardStack.frame.origin.y  +  CGFloat(offsetIndex * Int(cardOffSet)))

        }
        
        
    }

}

extension RatingTblCell: CardViewDelegate {
    func didTapCloseCard(cardClosed: CardView) {
        
        
        UIView.animate(withDuration: 0.25, animations: {
            cardClosed.alpha = 0
        }) { _ in

            
            cardClosed.removeFromSuperview()
            
            let cardsViewCount = self.cardStack.subviews.count
            
            
            //Make the next third card become visible
            if cardsViewCount >= 3 {
                let indexCardNextIn = cardsViewCount - 1 - 2
                self.cardStack.subviews[indexCardNextIn].isHidden = false
            }
         
            
            UIView.animate(withDuration: 0.2) {
                for cardView in self.cardStack.subviews {
                    if let cardView = cardView as? CardView {

                        let newFrame = cardView.frame.offsetBy(dx: -10, dy: -10)
                        cardView.frame = newFrame
                    }
                }
                
                
            }
            
          
            //Handle the last card view
            if self.cardStack.subviews.count ==  1{
                if let lastCardView = self.cardStack.subviews[0] as? CardView {
                    lastCardView.frame.size.width = self.contentView.frame.width - 16 - 16
                    
                    
                    //Modify constraints to stretch the height of card view
                    lastCardView.topConstraintOfStarsStack.constant += self.cardOffSet
                    lastCardView.bottomConstraintOfStarsStack.constant += self.cardOffSet
                    lastCardView.layoutSubviews()
                    
                    lastCardView.frame.size.height += 20
                }
                
              
            }
        }
  
    }
}
