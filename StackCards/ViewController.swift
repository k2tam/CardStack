//
//  ViewController.swift
//  StackCards
//
//  Created by k2 tam on 16/11/2023.
//

import UIKit


class ViewController: UIViewController {
    var cards = Array<Card>.init(repeating: Card(), count: 18)
    
    
    lazy var cardStack: UIView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.clipsToBounds = true
        stack.backgroundColor = .brown
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.view.addSubViews(cardStack)
        addConstraints()
        addCards()
    }
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
            cardStack.heightAnchor.constraint(equalToConstant: 250),
            cardStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            cardStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            cardStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cardStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    private func addCards() {
        let cardOffSet: CGFloat = 10
        
        for (index, card) in cards.enumerated() {
            let offsetIndex = cards.count - 1 - index
            let cardView = CardView()
            cardView.configure(question: "\(index)")
            cardView.delegate = self
            
            cardView.frame.size = CGSize(width: 300, height: 200)
            
            cardView.frame = CGRect(
                x: Int(cardStack.center.x) + (offsetIndex * Int(cardOffSet)),
                y: Int(cardStack.center.y) + ( offsetIndex * Int(cardOffSet)),
                width: 300,
                height: 200)
            
            cardStack.addSubview(cardView)
            
            
   
        }
        
        
    }
}

extension ViewController: CardViewDelegate {
    func didTapCloseCard(cardClosed: CardView) {
        UIView.animate(withDuration: 0.25, animations: {
            cardClosed.alpha = 0
        }) { _ in
            cardClosed.removeFromSuperview()
            
            
            
            UIView.animate(withDuration: 0.15) {
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



