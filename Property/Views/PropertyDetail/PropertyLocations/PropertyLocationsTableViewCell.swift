//
//  PropertyLocationsTableViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 07/03/23.
//

import UIKit

class PropertyLocationsTableViewCell: UITableViewCell {
    static let identifier = "PropertyLocationsTableViewCell"
    
    @IBOutlet weak var sectionHeaderView: SectionHeader!
    @IBOutlet weak var locationsCollectionView: UICollectionView!
    @IBOutlet weak var locationImageView: UIImageView! {
        didSet {
            locationImageView.contentMode = .scaleAspectFill
            locationImageView.layer.cornerRadius = 12
            locationImageView.clipsToBounds = true
        }
    }
    
    var locations: [Location] = [Location]()
    var lastSelectedLocationIndex: Int {
        for (index, location) in locations.enumerated() {
            if location.isSelected { return index }
        }
        locations[0].changeIsSelected()
        return 0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell() {
        self.locations[lastSelectedLocationIndex].changeIsSelected()
        locationImageView.image = UIImage(named: locations[lastSelectedLocationIndex].image)
        
        sectionHeaderView.configure(title: "Location Map & Details")
        
        setupTableView()
    }
    
    private func setupTableView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        locationsCollectionView.backgroundColor = .clear
        locationsCollectionView.collectionViewLayout = flowLayout
        locationsCollectionView.delegate = self
        locationsCollectionView.dataSource = self
        
        locationsCollectionView.register(LocationsCollectionViewCell.self, forCellWithReuseIdentifier: LocationsCollectionViewCell.identifier)
    }
}

extension PropertyLocationsTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let locationCell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationsCollectionViewCell.identifier, for: indexPath) as? LocationsCollectionViewCell
        else {return UICollectionViewCell()}
        
        locationCell.locationPlace = locations[indexPath.row]
        locationCell.delegate = self
        locationCell.setupCell()
        
        return locationCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        let dummyCell = LocationsCollectionViewCell(frame: frame)
        dummyCell.locationPlace = locations[indexPath.row]
        dummyCell.setupCell()
        dummyCell.layoutIfNeeded()
        
        let targetSize = CGSize(width: 1000, height: 50)
        let estimatedSize = dummyCell.systemLayoutSizeFitting(targetSize)
        
        return CGSize(width: estimatedSize.width + 35, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension PropertyLocationsTableViewCell: LocationCollectionCellDelegate {
    func onLocationSelected(_ location: Location) {
        let sameIndex = locations.firstIndex{$0 == location}

        if let sameIndex = sameIndex {
            let changedIndexPaths: [IndexPath] = [
                IndexPath(row: lastSelectedLocationIndex, section: 0),
                IndexPath(row: sameIndex, section: 0)
            ]

            self.locations[lastSelectedLocationIndex].changeIsSelected()
            self.locations[sameIndex].changeIsSelected()
            
            locationsCollectionView.reloadItems(at: changedIndexPaths)
            locationImageView.image = UIImage(named: location.image)
        }
    }
}


