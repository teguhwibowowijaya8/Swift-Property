//
//  PropertyTableViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit

protocol PropertyTableViewDelegate {
    func onPropertySelected(property: Property)
}

class PropertyTableViewCell: UITableViewCell {
    static let identifier = "PropertyTableViewCell"

    @IBOutlet weak var propertyHeaderView: UIView!
    @IBOutlet weak var propertyCardView: CardView!
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var propertyPriceLabel: UILabel!
    @IBOutlet weak var propertyAddressLabel: UILabel!
    @IBOutlet weak var propertySizeLabel: UILabel!
    @IBOutlet weak var propertyBedsLabel: UILabel!
    @IBOutlet weak var propertyBathsLabel: UILabel!
    @IBOutlet weak var propertyKitchensLabel: UILabel!
    @IBOutlet weak var propertyCardButton: UIButton!
    
    
    var property: Property?
    var delegate: PropertyTableViewDelegate?
    
    func setupCell(
        showHeader: Bool = false,
        headerView: UIView? = nil
    ) {
        if let headerView = headerView {
            setupConstraintHeader(headerView)
            propertyHeaderView.backgroundColor = .clear
        }
        else { propertyHeaderView.removeFromSuperview() }
        
        guard let property = property else {return}
        
        propertyImageView.image = UIImage(named: property.image)
        propertyNameLabel.text = property.name
        propertyPriceLabel.text = property.priceString
        propertySizeLabel.text = "(\(property.sizeString))"
        
        propertyAddressLabel.textWithAttachment(text: property.address, imageName: "location.fill", imageType: .systemName)
        
        let facilities = property.facilities
        propertyBedsLabel.textWithAttachment(text: "\(facilities.beds.count) Bed", imageName: Images.bed)
        propertyBathsLabel.textWithAttachment(text: "\(facilities.baths.count) Bath", imageName: Images.bed)
        propertyKitchensLabel.textWithAttachment(text: "\(facilities.kitchens.count) Kitchen", imageName: Images.bed)
        
        propertyCardButton.addTarget(self, action: #selector(onCardSelected), for: .touchUpInside)
        
        
        setupComponentAttributes()
    }
    
    func setupConstraintHeader(_ headerView: UIView) {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        propertyHeaderView.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: propertyHeaderView.topAnchor),
            headerView.leftAnchor.constraint(equalTo: propertyHeaderView.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: propertyHeaderView.rightAnchor),
            headerView.bottomAnchor.constraint(equalTo: propertyHeaderView.bottomAnchor)
        ])
    }
    
    @objc func onCardSelected(_ sender: UIButton) {
        guard let property = property else {return}
        delegate?.onPropertySelected(property: property)
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
