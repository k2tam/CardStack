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
    
    lazy var imgRating: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.image = UIImage(named: "ic_rating")
        return imgV
    }()
    
    lazy var btnClose: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = UIColor(hex: "#888888")
        btn.addTarget(self, action: #selector(closeCardTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var tvQuestion: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var tvSatisfied: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.italicSystemFont(ofSize: 14)
        lb.textColor = UIColor(hex: "#3D3D3D")
        
        lb.text = "Hài lòng"
        return lb
    }()
    
    lazy var tvUnsatisfied: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.italicSystemFont(ofSize: 14)
        lb.textColor = UIColor(hex: "#3D3D3D")
        lb.text = "Không hài lòng"
        
        return lb
    }()
    
    lazy var starsStack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        
        self.addSubViews(btnClose, imgRating, tvQuestion, starsStack, tvUnsatisfied, tvSatisfied)
        
        setupStartsStack()

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
        self.layer.cornerRadius = 12
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            btnClose.heightAnchor.constraint(equalToConstant: 24),
            btnClose.widthAnchor.constraint(equalToConstant: 24),
            
            btnClose.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            btnClose.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            imgRating.widthAnchor.constraint(equalToConstant: 56),
            imgRating.heightAnchor.constraint(equalToConstant: 56),
            
            imgRating.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imgRating.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            tvQuestion.topAnchor.constraint(equalTo: imgRating.bottomAnchor, constant: 16),
            tvQuestion.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tvQuestion.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
//            tvQuestion.heightAnchor.constraint(equalToConstant: 27),
            
            starsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            starsStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            starsStack.topAnchor.constraint(equalTo: tvQuestion.bottomAnchor, constant: 16),
            
            tvUnsatisfied.topAnchor.constraint(equalTo: starsStack.bottomAnchor, constant: 16),
            tvUnsatisfied.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tvUnsatisfied.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            
            tvSatisfied.topAnchor.constraint(equalTo: starsStack.bottomAnchor, constant: 16),
            tvSatisfied.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            tvSatisfied.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),


                
        ])
    }
    
    private func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 12
        self.layer.masksToBounds = false
    }
    
    private func setupStartsStack() {
        for i in 0..<5{
            let star = UIImageView()
            star.translatesAutoresizingMaskIntoConstraints = false
            star.image = UIImage(named: "ic_star")
            star.tintColor = UIColor(hex: "#D1D1D1")
            
            starsStack.addArrangedSubview(star)
        }
    }
    
    
    @objc func closeCardTapped() {
        delegate?.didTapCloseCard(cardClosed: self)
    }
    
}
