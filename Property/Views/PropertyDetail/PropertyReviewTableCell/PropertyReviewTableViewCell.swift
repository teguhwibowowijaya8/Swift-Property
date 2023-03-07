//
//  PropertyReviewTableViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 07/03/23.
//

import UIKit

class PropertyReviewTableViewCell: UITableViewCell {
    static let identifier = "PropertyReviewTableViewCell"
    
    @IBOutlet weak var propertyReviewCollectionView: UICollectionView!
    
    var reviews: [Review]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 50, height: 220)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
        flowLayout.minimumLineSpacing = 25
        
        propertyReviewCollectionView.collectionViewLayout = flowLayout
        propertyReviewCollectionView.isPagingEnabled = true
        propertyReviewCollectionView.showsHorizontalScrollIndicator = false
        propertyReviewCollectionView.delegate = self
        propertyReviewCollectionView.dataSource = self
        propertyReviewCollectionView.backgroundColor = .clear
        
        propertyReviewCollectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 240).isActive = true
        
        let reviewCollectionCellNib = UINib(nibName: PropertyReviewCollectionViewCell.identifier, bundle: nil)
        propertyReviewCollectionView.register(reviewCollectionCellNib, forCellWithReuseIdentifier: PropertyReviewCollectionViewCell.identifier)
    }
    
}

extension PropertyReviewTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let reviews = reviews, let reviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PropertyReviewCollectionViewCell.identifier, for: indexPath) as? PropertyReviewCollectionViewCell
        else { return UICollectionViewCell() }
        
        reviewCell.review = reviews[indexPath.row]
        reviewCell.setupCell()
        
        return reviewCell
    }
    
    
}
