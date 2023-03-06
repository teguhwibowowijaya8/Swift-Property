//
//  PropertyTableViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {
    static let identifier = "PropertyTableViewCell"

    @IBOutlet weak var propertyCardView: CardView!
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var propertyPriceLabel: UILabel!
    @IBOutlet weak var propertyAddressLabel: UILabel!
    @IBOutlet weak var propertySizeLabel: UILabel!
    @IBOutlet weak var propertyBedsLabel: UILabel!
    @IBOutlet weak var propertyBathsLabel: UILabel!
    @IBOutlet weak var propertyKitchensLabel: UILabel!
    
    func setupCell(property: Property) {
        propertyImageView.image = UIImage(named: property.image)
        propertyNameLabel.text = property.name
        propertyPriceLabel.text = property.priceString
        propertyAddressLabel.text = property.address
        propertySizeLabel.text = "(\(property.sizeString))"
        
        let facilities = property.facilities
        propertyBedsLabel.textWithAttachment(text: "\(facilities.beds.count) Bed", imageName: Images.bed)
        propertyBathsLabel.textWithAttachment(text: "\(facilities.baths.count) Bath", imageName: Images.bed)
        propertyKitchensLabel.textWithAttachment(text: "\(facilities.kitchens.count) Kitchen", imageName: Images.bed)
        
        setupComponentAttributes()
    }
    
    private func setupComponentAttributes() {
        propertyCardView.backgroundColor = .white
        
        propertyImageView.contentMode = .scaleAspectFill
        propertyImageView.layer.cornerRadius = 20
        
        propertyNameLabel.font = TextSize.title
        
        propertyPriceLabel.font = TextSize.title
        propertyPriceLabel.textColor = MainColor.purple
        propertyPriceLabel.adjustsFontSizeToFitWidth = true
        
        propertyAddressLabel.font = TextSize.subTitle
        propertyAddressLabel.textColor = MainColor.silver
        propertyAddressLabel.numberOfLines = 2
        propertyAddressLabel.adjustsFontSizeToFitWidth = true
        
        propertySizeLabel.font = TextSize.detail
        propertySizeLabel.textColor = MainColor.silver
        propertySizeLabel.adjustsFontSizeToFitWidth = true
    }
    
}
