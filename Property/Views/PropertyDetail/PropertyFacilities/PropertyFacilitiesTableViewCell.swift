//
//  PropertyFacilitiesTableViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 09/03/23.
//

import UIKit

class PropertyFacilitiesTableViewCell: UITableViewCell {
    static let identifier = "PropertyFacilitiesTableViewCell"
    
    private let horizontalSpacing: CGFloat = 15
    private let verticalSpacing: CGFloat = 10
    private let baseCollectionViewHeight: CGFloat = 200
    
    var facilities: Facilities?
    
    @IBOutlet weak var facilityDescriptionTextView: UITextView! {
        didSet {
            facilityDescriptionTextView.isEditable = false
            facilityDescriptionTextView.isSelectable = false
            facilityDescriptionTextView.isScrollEnabled = false
            facilityDescriptionTextView.font = TextSize.subTitle
            facilityDescriptionTextView.tintColor = MainColor.silver
            facilityDescriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            facilityDescriptionTextView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var facilitiesCollectionView: UICollectionView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(screenWidth: CGFloat, facilityDescription: String) {
        self.backgroundColor = .clear
        facilityDescriptionTextView.text = facilityDescription
        setupCollectionView(screenWidth: screenWidth)
    }
    
    func setupCollectionView(screenWidth: CGFloat) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: verticalSpacing, left: horizontalSpacing, bottom: verticalSpacing, right: horizontalSpacing)
        flowLayout.minimumLineSpacing = horizontalSpacing
        let availableWidth = screenWidth - horizontalSpacing * 2
        flowLayout.itemSize = CGSize(width: availableWidth / 2, height: baseCollectionViewHeight)
        
        facilitiesCollectionView.collectionViewLayout = flowLayout
        facilitiesCollectionView.delegate = self
        facilitiesCollectionView.dataSource = self
        facilitiesCollectionView.backgroundColor = .clear
        
        facilitiesCollectionView.heightAnchor.constraint(equalToConstant: baseCollectionViewHeight + verticalSpacing * 2).isActive = true
        
        let facilityCollectionCellNib = UINib(nibName: FacilityCollectionViewCell.identifier, bundle: nil)
        facilitiesCollectionView.register(facilityCollectionCellNib, forCellWithReuseIdentifier: FacilityCollectionViewCell.identifier)
        
    }
    
}

extension PropertyFacilitiesTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let facilityCell = collectionView.dequeueReusableCell(withReuseIdentifier: FacilityCollectionViewCell.identifier, for: indexPath) as? FacilityCollectionViewCell
        else {return UICollectionViewCell()}
        
        facilityCell.setupCell(image: "Beautiful Apartment", name: "Beautiful Beautiful Beautiful Apartment")
        return facilityCell
    }
}
