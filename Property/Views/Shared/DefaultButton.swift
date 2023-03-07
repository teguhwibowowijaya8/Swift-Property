//
//  Button.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 07/03/23.
//

import UIKit

class DefaultButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        self.backgroundColor = MainColor.purple
        self.tintColor = .white
        self.layer.cornerRadius = 12
        
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func configureTitleLabel(isBold: Bool = false) {
        self.titleLabel?.font = isBold ? TextSize.title2 : TextSize.subTitle2
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = 0.5
        self.titleLabel?.lineBreakMode = .byTruncatingTail
        self.titleLabel?.numberOfLines = 1
    }
}
