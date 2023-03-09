//
//  FacilityCollectionViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 09/03/23.
//

import UIKit

class FacilityCollectionViewCell: UICollectionViewCell {
    static let identifier = "FacilityCollectionViewCell"
    
    
    @IBOutlet weak var facilityImageView: UIImageView! {
        didSet {
            facilityImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var facilityNameLabel: UILabel! {
        didSet {
            facilityNameLabel.numberOfLines = 2
            facilityNameLabel.adjustsFontSizeToFitWidth = true
            facilityNameLabel.font = TextSize.title2
        }
    }
    
    func setupCell(image: String, name: String) {
        facilityImageView.image = UIImage(named: image)
        facilityNameLabel.text = name
    }

}
