//
//  PropertyTableViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit

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
        else { propertyHeaderView?.removeFromSuperview() }
        
        guard let property = property else {return}
        
        propertyImageView.image = UIImage(named: property.image)
        propertyNameLabel.text = property.name
        propertyPriceLabel.text = property.priceString
        propertySizeLabel.text = "(\(property.sizeString))"
        
        propertyAddressLabel.textWithAttachment(text: property.address, imageName: "location.fill", imageType: .systemName)
        
        let amenities = property.amenities
        propertyBedsLabel.textWithAttachment(text: "\(amenities.beds.count) Bed", imageName: Images.bed)
        propertyBathsLabel.textWithAttachment(text: "\(amenities.baths.count) Bath", imageName: Images.bath)
        propertyKitchensLabel.textWithAttachment(text: "\(amenities.kitchens.count) Kitchen", imageName: Images.kitchen)
        
        propertyCardButton.addTarget(self, action: #selector(onCardSelected), for: .touchUpInside)
        
        if delegate != nil {
            propertyCardButton.addTarget(self, action: #selector(onCardTocuhDownObjc), for: .touchDown)
            propertyCardButton.addTarget(self, action: #selector(onCardTocuhCancelObjc), for: .touchCancel)
            propertyCardButton.addTarget(self, action: #selector(onCardTocuhCancelObjc), for: .touchDragExit)
        }
        
        
        setupComponentAttributes()
    }
    
    private func setupConstraintHeader(_ headerView: UIView) {
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
        
        if let delegate = delegate {
            onCardTocuhCancelObjc()
            delegate.onPropertySelected(property: property)
        }
    }
    
    @objc func onCardTocuhDownObjc() {
        CardView.animate(withDuration: 0.3) {
            self.propertyCardView.layer.opacity = 0.7
        }
    }
    
    @objc func onCardTocuhCancelObjc() {
        CardView.animate(withDuration: 0.3) {
            self.propertyCardView.layer.opacity = 1
        }
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
