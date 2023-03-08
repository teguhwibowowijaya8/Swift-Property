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
    @IBOutlet weak var reviewRatingStackView: UIStackView!
    
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
        
        setupComponentAttributes()
    }

    
    func setupComponentAttributes() {
        reviewCardView.backgroundColor = .white
        
        reviewerImage.layer.cornerRadius = 12
        reviewerImage.clipsToBounds = true
        reviewerImage.backgroundColor = MainColor.purple.withAlphaComponent(0.3)
        reviewerImage.tintColor = MainColor.purple
        reviewerImage.contentMode = .scaleAspectFill
        
        reviewerName.font = TextSize.title2
        
        reviewerPosition.font = TextSize.detail
        reviewerPosition.textColor = MainColor.silver
        
        reviewerPosition.font = TextSize.detail
        reviewTextView.textColor = MainColor.silver
    }
}
