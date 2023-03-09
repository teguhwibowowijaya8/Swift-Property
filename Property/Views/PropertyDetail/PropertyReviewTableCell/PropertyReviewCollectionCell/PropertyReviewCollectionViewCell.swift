//
//  PropertyReviewCollectionViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit

class PropertyReviewCollectionViewCell: UICollectionViewCell {
    static let identifier = "PropertyReviewCollectionViewCell"
    
    @IBOutlet weak var reviewCardView: CardView!
    @IBOutlet weak var reviewerImage: UIImageView!
    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var reviewerPosition: UILabel!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var reviewRatingView: UIView!
    
    var review: Review?
    var cellHeight: CGFloat = 0 {
        didSet {
            if cellHeight > 0 {
                self.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell() {
        guard let review = review else {return}
        
        if let image = review.image { reviewerImage.image = UIImage(named: image) }
        else { reviewerImage.image = UIImage(systemName: "person.fill") }
        
        reviewerName.text = review.reviewerName
        reviewerPosition.text = review.reviewerPosition
        reviewTextView.text = review.detail
        
        setupRatingView()
        setupComponentAttributes()
    }
    
    private func setupComponentAttributes() {
        reviewCardView.backgroundColor = .white
        
        reviewerImage.layer.cornerRadius = 12
        reviewerImage.clipsToBounds = true
        reviewerImage.backgroundColor = MainColor.purple.withAlphaComponent(0.3)
        reviewerImage.tintColor = MainColor.purple
        reviewerImage.contentMode = .scaleAspectFill
        
        reviewerName.font = TextSize.title2
        
        reviewerPosition.font = TextSize.detail
        reviewerPosition.textColor = MainColor.silver
        
        reviewTextView.textColor = MainColor.silver
        reviewTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func setupRatingView() {
        let starsStackView = StarsRatingStackView()
        starsStackView.setupStackView(rating: review?.rating)
        starsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        reviewRatingView.addSubview(starsStackView)
        
        NSLayoutConstraint.activate([
            starsStackView.topAnchor.constraint(equalTo: reviewRatingView.topAnchor),
            starsStackView.leftAnchor.constraint(equalTo: reviewRatingView.leftAnchor),
            starsStackView.bottomAnchor.constraint(equalTo: reviewRatingView.bottomAnchor),
            starsStackView.rightAnchor.constraint(lessThanOrEqualTo: reviewRatingView.rightAnchor),
            
            reviewRatingView.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
}
