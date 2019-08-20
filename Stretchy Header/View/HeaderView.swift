//
//  HeaderView.swift
//  Stretchy Header
//
//  Created by Bruno Silva on 19/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "stretchy_header"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // custom code for lauyout
        
        addSubview(self.imageView)
        self.imageView.fillSuperview()
        
        //blur
        setupVisualEffectBlur()
        //gradient layer
        setupGradientLayer()
        //labels
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var animator: UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectBlur() {
        self.animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
        animator.fractionComplete = 0
    }
    
    fileprivate func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1]
        gradientLayer.frame = self.bounds
        gradientLayer.frame.origin.y -= self.bounds.height
        
        let gradientContainerView = UIView()
        addSubview(gradientContainerView)
        gradientContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientContainerView.layer.addSublayer(gradientLayer)
    }
    
    fileprivate func setupLabels() {
        let heavyLabel = UILabel()
        heavyLabel.text = "Surf the web for courses!"
        heavyLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        heavyLabel.textColor = .white

        let descriptionLabel = UILabel()
        descriptionLabel.text = "Please visit these above courses and let all your friends know about this!"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .justified
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [heavyLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
    
}
