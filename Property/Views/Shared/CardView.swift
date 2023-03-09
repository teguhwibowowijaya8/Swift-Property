//
//  CardView.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit


class CardView: UIView {
    var cornerRadius: CGFloat = 10 {
        didSet {
            configure()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
