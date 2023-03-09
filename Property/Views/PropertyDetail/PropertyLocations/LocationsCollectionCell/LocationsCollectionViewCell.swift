//
//  LocationsCollectionViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 07/03/23.
//

import UIKit

class LocationsCollectionViewCell: UICollectionViewCell {
    static let identifier = "LocationsCollectionViewCell"
    
    var delegate: LocationCollectionCellDelegate?
    var locationPlace: Location? {
        didSet {
            guard let locationPlace = locationPlace else {return}
            locationPlaceButton.setTitle(locationPlace.place, for: .normal)
            if locationPlace.isSelected { setupIsSelectedButton() }
            else { setupNotSelectedButton() }
        }
    }
    
    private lazy var locationPlaceButton: UIButton = {
        let locationPlaceButton = UIButton(type: .system)
        locationPlaceButton.translatesAutoresizingMaskIntoConstraints = false
        locationPlaceButton.tintColor = MainColor.silver
        locationPlaceButton.titleLabel?.font = TextSize.subTitle2
        locationPlaceButton.backgroundColor = .clear
        locationPlaceButton.layer.cornerRadius = 12
        locationPlaceButton.addTarget(self, action: #selector(onButtonPressed), for: .touchUpInside)
        return locationPlaceButton
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell() {
        self.addSubview(locationPlaceButton)
        
        NSLayoutConstraint.activate([
            locationPlaceButton.topAnchor.constraint(equalTo: self.topAnchor),
            locationPlaceButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            locationPlaceButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            locationPlaceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupIsSelectedButton() {
        locationPlaceButton.tintColor = .white
        locationPlaceButton.titleLabel?.font = TextSize.title2
        locationPlaceButton.backgroundColor = MainColor.orange
    }
    
    func setupNotSelectedButton() {
        locationPlaceButton.tintColor = MainColor.silver
        locationPlaceButton.titleLabel?.font = TextSize.subTitle2
        locationPlaceButton.backgroundColor = .clear
    }
    
    @objc func onButtonPressed() {
        guard let locationPlace = locationPlace else {return}
        if locationPlace.isSelected != true {
            delegate?.onLocationSelected(locationPlace)
        }
    }

}
