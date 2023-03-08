//
//  ReviewCollectionViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 08/03/23.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
    static let identifier = "ReviewCollectionViewCell"
    
    private lazy var reviewCardView: CardView = {
        let reviewCardView = CardView()
        reviewCardView.translatesAutoresizingMaskIntoConstraints = false
        reviewCardView.backgroundColor = .white
        return reviewCardView
    }()
    
    private lazy var reviewerImageView: UIImageView = {
        let reviewerImageView = UIImageView()
        reviewerImageView.translatesAutoresizingMaskIntoConstraints = false
        reviewerImageView.layer.cornerRadius = 12
        reviewerImageView.clipsToBounds = true
        reviewerImageView.backgroundColor = MainColor.purple.withAlphaComponent(0.3)
        reviewerImageView.tintColor = MainColor.purple
        reviewerImageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            reviewerImageView.widthAnchor.constraint(equalToConstant: 40),
            reviewerImageView.heightAnchor.constraint(equalTo: reviewerImageView.widthAnchor)
        ])
        
        return reviewerImageView
    }()
    
    private lazy var reviewerNameLabel: UILabel = {
        let reviewerNameLabel = UILabel()
        reviewerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewerNameLabel.numberOfLines = 0
        reviewerNameLabel.font = TextSize.title2
        return reviewerNameLabel
    }()
    
    private lazy var reviewerPositionLabel: UILabel = {
        let reviewerPositionLabel = UILabel()
        reviewerPositionLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewerPositionLabel.font = TextSize.detail
        reviewerPositionLabel.textColor = MainColor.silver
        reviewerPositionLabel.numberOfLines = 0
        return reviewerPositionLabel
    }()
    
    private lazy var reviewTextView: UITextView = {
        let reviewTextView = UITextView()
        reviewTextView.translatesAutoresizingMaskIntoConstraints = false
        reviewTextView.isEditable = false
        reviewTextView.isSelectable = false
        reviewTextView.isScrollEnabled = false
        reviewTextView.textColor = MainColor.silver
        return reviewTextView
    }()
    
    private lazy var namePositionStackView: UIStackView = {
        let namePositionStackView = UIStackView()
        namePositionStackView.axis = .vertical
        namePositionStackView.distribution = .fillProportionally
        namePositionStackView.alignment = .top
        return namePositionStackView
    }()
    
    private lazy var headerCardStackView: UIStackView = {
       let headerCardStackView = UIStackView()
        headerCardStackView.axis = .horizontal
        headerCardStackView.distribution = .fillProportionally
        headerCardStackView.alignment = .top
        headerCardStackView.translatesAutoresizingMaskIntoConstraints = false
        headerCardStackView.spacing = 8
        return headerCardStackView
    }()
    
    private lazy var reviewRatingStackView: UIStackView = {
        let reviewRatingStackView = UIStackView()
        reviewRatingStackView.translatesAutoresizingMaskIntoConstraints = false
        return reviewRatingStackView
    }()
    
    var review: Review?
    
    func setupCell() {
        guard let review = review else {return}
        reviewerNameLabel.text = review.reviewerName
        reviewerPositionLabel.text = review.reviewerPosition
        reviewTextView.text = review.detail
        
        if let image = review.image { reviewerImageView.image = UIImage(named: image) }
        else { reviewerImageView.image = UIImage(systemName: "person.fill") }
        
        setupComponentsConstraints()
    }
    
    func setupComponentsConstraints() {
        namePositionStackView.addArrangedSubview(reviewerNameLabel)
        namePositionStackView.addArrangedSubview(reviewerPositionLabel)
        headerCardStackView.addArrangedSubview(reviewerImageView)
        headerCardStackView.addArrangedSubview(namePositionStackView)
        
        self.contentView.addSubview(reviewCardView)
        reviewCardView.addSubview(headerCardStackView)
        reviewCardView.addSubview(reviewTextView)
        reviewCardView.addSubview(reviewRatingStackView)
        
        NSLayoutConstraint.activate([
            reviewCardView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            reviewCardView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            reviewCardView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            reviewCardView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            headerCardStackView.topAnchor.constraint(equalTo: reviewCardView.topAnchor, constant: 10),
            headerCardStackView.leftAnchor.constraint(equalTo: reviewCardView.leftAnchor, constant: 20),
            headerCardStackView.rightAnchor.constraint(equalTo: reviewCardView.rightAnchor, constant: -20),
            
            reviewTextView.topAnchor.constraint(equalTo: headerCardStackView.bottomAnchor, constant: 8),
            reviewTextView.leftAnchor.constraint(equalTo: reviewCardView.leftAnchor, constant: 20),
            reviewTextView.rightAnchor.constraint(equalTo: reviewCardView.rightAnchor, constant: -20),
            
            reviewRatingStackView.topAnchor.constraint(equalTo: reviewTextView.bottomAnchor, constant: 8),
            reviewRatingStackView.leftAnchor.constraint(equalTo: reviewCardView.leftAnchor, constant: 20),
            reviewRatingStackView.rightAnchor.constraint(equalTo: reviewCardView.rightAnchor, constant: -20),
            reviewRatingStackView.bottomAnchor.constraint(equalTo: reviewCardView.bottomAnchor, constant: -10),
            reviewRatingStackView.heightAnchor.constraint(equalToConstant: 18)
        
        ])
    }
}
