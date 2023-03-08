//
//  CustomBackButtonView.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 08/03/23.
//

import UIKit

class CustomBackButtonView: UIButton {
    var title: String = "Title" {
        didSet {
            backTitle.text = title
        }
    }
    
    var onButtonSelected: (() -> Void)?
    
    private lazy var backImageView: UIImageView = {
        let backImage = UIImage(systemName: "chevron.left")
        let backImageView = UIImageView()
        backImageView.image = backImage
        backImageView.tintColor = MainColor.purple
        backImageView.contentMode = .scaleAspectFit
        
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backImageView.widthAnchor.constraint(equalToConstant: 20),
            backImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        return backImageView
    }()
    
    private lazy var backTitle: UILabel = {
        let backTitle = UILabel()
        backTitle.font = TextSize.title
        backTitle.translatesAutoresizingMaskIntoConstraints = false
        
        return backTitle
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    func configure() {
        self.addTarget(self, action: #selector(onButtonSelectedObjc), for: .touchUpInside)
        
        self.addSubview(backImageView)
        self.addSubview(backTitle)
        
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            backTitle.topAnchor.constraint(equalTo: self.topAnchor),
            backTitle.leftAnchor.constraint(equalTo: backImageView.rightAnchor, constant: 5),
            backTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backTitle.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    @objc func onButtonSelectedObjc() {
        onButtonSelected?()
    }
}
