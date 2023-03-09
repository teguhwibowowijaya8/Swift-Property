//
//  StarsRatingStackView.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 08/03/23.
//

import UIKit

class StarsRatingStackView: UIStackView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var rating: Double = 0.0
    var maxRating: Int = 5
    var starTintColor: UIColor = MainColor.purple
    
    private var _rating: Double {
        if rating < 0.0 { return 0.0 }
        else if rating > Double(maxRating) { return 5.0 }
        else { return rating }
    }
    
    private var starsImagesView: [UIImageView] = [UIImageView]()
    
    private let zeroStarImage = UIImage(systemName: "star")
    private let halfStarImage = UIImage(systemName: "star.leadinghalf.filled")
    private let fullStarImage = UIImage(systemName: "star.fill")
    
    func setupStackView(
        rating: Double? = nil,
        maxRating: Int? = nil,
        starTintColor: UIColor? = nil
    ) {
        if let rating = rating {self.rating = rating}
        if let maxRating = maxRating {self.maxRating = maxRating}
        if let starTintColor = starTintColor {self.starTintColor = starTintColor}
        
        starsImagesView = [UIImageView]()
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.alignment = .fill
        self.spacing = 0
        
        let ratingDecimal = _rating.truncatingRemainder(dividingBy: 1.0)
        let ratingWithoutDecimal = Int(floor(_rating))
        
        for index in 1...Int(self.maxRating) {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = self.starTintColor
            if index <= ratingWithoutDecimal {
                imageView.image = fullStarImage
            } else if index == ratingWithoutDecimal + 1 {
                imageView.image = imageOfRatingDecimal(decimal: ratingDecimal)
            } else {
                imageView.image = zeroStarImage
            }
            starsImagesView.append(imageView)
            self.addArrangedSubview(starsImagesView[index-1])
        }
    }
    
    private func imageOfRatingDecimal(decimal: Double) -> UIImage {
        switch decimal {
        case 0.0..<0.4:
            return zeroStarImage!
        case 0.4..<0.8:
            return halfStarImage!
        case 0.8..<1.0:
            return fullStarImage!
        default:
            return zeroStarImage!
        }
    }
}
