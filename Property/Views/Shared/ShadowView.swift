//
//  CardView.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit


class ShadowView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure(
        cornerRadius: CGFloat = 20,
        borderWidth: CGFloat = 3,
        shadowColor: CGColor = UIColor.black.cgColor,
        shadowOpacity: Float = 0.5,
        shadowRadius: CGFloat = 5,
        shadowOffset: CGSize = CGSize(width: 2, height: 3)
    ) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = shadowColor
        
        self.layer.shadowColor = shadowColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
        self.layer.masksToBounds = false
    }
}
