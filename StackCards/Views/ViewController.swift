////
////  ViewController.swift
////  StackCards
////
////  Created by k2 tam on 16/11/2023.
////
//
//import UIKit
//
//
//class RatingView: UITableViewCell {
//    var cards = Array<Card>.init(repeating: Card(question: "Bạn thấy dịch vụ bảo trì tại nhà thế nào ?"), count: 3)
//    
//    lazy var cardStack: UIView = {
//        let stack = UIView()
//        stack.clipsToBounds = false
//        return stack
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(hex: "#F5F5F5")
//        self.view.addSubViews(cardStack)
//        
//        
//        cardStack.frame.size = CGSize(width: UIScreen.main.bounds.width - 32, height: 250)
//        cardStack.center = self.view.center
//        
//        addCards()
//
//    }
//
// 
//    
//    private func addCards() {
//        let cardOffSet: CGFloat = 10
//        
//        for (index, card) in cards.enumerated() {
//            let offsetIndex = cards.count - 1 - index
//            let cardView = CardView()
//            cardView.configure(question: "\(card.question)")
//            cardView.delegate = self
////            
//            cardStack.addSubview(cardView)
//
//            
//            cardView.frame.size = CGSize(width: cardStack.bounds.width - 32, height: cardStack.bounds.height - 40)
//            
//            cardView.center = CGPoint(
//                x: cardStack.bounds.midX + CGFloat(offsetIndex * Int(cardOffSet)),
//                y:  cardStack.bounds.midY +  CGFloat(offsetIndex * Int(cardOffSet)))
//
//        }
//        
//        
//    }
//}
//
//extension ViewController: CardViewDelegate {
//    func didTapCloseCard(cardClosed: CardView) {
//        UIView.animate(withDuration: 0.25, animations: {
//            cardClosed.alpha = 0
//        }) { _ in
//            cardClosed.removeFromSuperview()
//            
//            
//            
//            UIView.animate(withDuration: 0.2) {
//                for cardView in self.cardStack.subviews {
//                    if let cardView = cardView as? CardView {
//
//                        let newFrame = cardView.frame.offsetBy(dx: -10, dy: -10)
//                        cardView.frame = newFrame
//                    }
//                }
//            }
//        }
//        
//        
//        
//        
//    }
//    
//    
//}
//
//
//
//
//
