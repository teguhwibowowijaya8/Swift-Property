//
//  SectionHeader.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 07/03/23.
//

import UIKit

class SectionHeader: UIView {
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = TextSize.title
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
    }
    
    func configure(title: String = "Title", rightComponent: UIView? = nil) {
        titleLabel.text = title
        
        self.backgroundColor = .clear
        self.addSubview(titleLabel)
        
        titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        if let rightComponent = rightComponent {
            rightComponent.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(rightComponent)
            
            rightComponent.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            NSLayoutConstraint.activate([
                titleLabel.rightAnchor.constraint(equalTo: rightComponent.leftAnchor, constant: 8),
                
                rightComponent.topAnchor.constraint(equalTo: self.topAnchor),
                rightComponent.rightAnchor.constraint(equalTo: self.rightAnchor),
                rightComponent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
        } else {
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        }
    }
}
