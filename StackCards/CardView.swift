//
//  CardView.swift
//  StackCards
//
//  Created by k2 tam on 16/11/2023.
//

import UIKit

protocol CardViewDelegate: AnyObject {
    func didTapCloseCard(cardClosed: CardView)
}


class CardView: UIView {
    weak var delegate: CardViewDelegate?
    
    let btnClose: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.addTarget(self, action: #selector(closeCardTapped), for: .touchUpInside)
        return btn
    }()
    
    let tvQuestion: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 13)
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubViews(btnClose, tvQuestion)
        addConstraints()
        
        
        setupLayer()
        addShadow()
    }
    
    public func configure(question: String){
        tvQuestion.text = question
    }
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayer(){
        self.layer.cornerRadius = 10
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            btnClose.heightAnchor.constraint(equalToConstant: 24),
            btnClose.widthAnchor.constraint(equalToConstant: 24),
            
            btnClose.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            btnClose.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            tvQuestion.widthAnchor.constraint(equalToConstant: 40),
            tvQuestion.heightAnchor.constraint(equalToConstant: 20),
            
            tvQuestion.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tvQuestion.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
        ])
    }
    
    private func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }
    
    
    @objc func closeCardTapped() {
        delegate?.didTapCloseCard(cardClosed: self)
    }
  
}
