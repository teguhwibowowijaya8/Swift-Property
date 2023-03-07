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
    
    var lastSelectedLocationIndex: Int = 0
    var locations: [Location]?
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {
        guard let locations = locations else {return}
        self.locations?[lastSelectedLocationIndex].changeIsSelected()
        locationImageView.image = UIImage(named: locations[lastSelectedLocationIndex].image)
        
        sectionHeaderView.configure(title: "Location Map & Details")
        
        setupTableView()
    }
    
    private func setupTableView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = CGSize(width: 50, height: 20)
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        flowLayout.minimumLineSpacing = 20
        
        locationsCollectionView.collectionViewLayout = flowLayout
        locationsCollectionView.delegate = self
        locationsCollectionView.dataSource = self
        
        locationsCollectionView.register(LocationsCollectionViewCell.self, forCellWithReuseIdentifier: LocationsCollectionViewCell.identifier)
    }
}

extension PropertyLocationsTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let location = locations?[indexPath.row], let locationCell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationsCollectionViewCell.identifier, for: indexPath) as? LocationsCollectionViewCell
        else {return UICollectionViewCell()}
        
        locationCell.locationPlace = location
        locationCell.delegate = self
        locationCell.setupCell()
        
        return locationCell
    }
}

extension PropertyLocationsTableViewCell: LocationCollectionCellDelegate {
    func onLocationSelected(_ location: Location) {
        guard let locations = locations else {return}
        let sameIndex = locations.firstIndex{$0 == location}
        
        if let sameIndex = sameIndex {
            let changedIndexPaths: [IndexPath] = [
                IndexPath(row: lastSelectedLocationIndex, section: 0),
                IndexPath(row: sameIndex, section: 0)
            ]
            
            self.locations?[sameIndex].changeIsSelected()
            lastSelectedLocationIndex = sameIndex
            
            locationsCollectionView.reloadItems(at: changedIndexPaths)
        }
    }
}


