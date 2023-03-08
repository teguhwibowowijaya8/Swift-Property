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
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    var reviews: [Review]?
    var screenWidth: CGFloat?
    var collectionCellsHeights: [CGFloat] = [CGFloat]()
    
    private let horizontalSpacing: CGFloat = 25
    private let verticalSpacing: CGFloat = 20
    private var availableWidth: CGFloat {
        guard let screenWidth = screenWidth else {return 0}
        return screenWidth - horizontalSpacing * 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        let maxHeight = getMaxHeight()
        collectionViewHeight.constant = maxHeight
        self.contentView.layoutIfNeeded()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: verticalSpacing, left: horizontalSpacing, bottom: verticalSpacing, right: horizontalSpacing)
        flowLayout.minimumLineSpacing = horizontalSpacing
        flowLayout.itemSize = CGSize(width: availableWidth, height: maxHeight)
        
        print(flowLayout.itemSize.height)
        print(collectionViewHeight.constant)
        propertyReviewCollectionView.collectionViewLayout = flowLayout
        propertyReviewCollectionView.isPagingEnabled = true
        propertyReviewCollectionView.showsHorizontalScrollIndicator = false
        propertyReviewCollectionView.delegate = self
        propertyReviewCollectionView.dataSource = self
        propertyReviewCollectionView.backgroundColor = .clear
        
        let propertyReviewCellNib = UINib(nibName: PropertyReviewCollectionViewCell.identifier, bundle: nil)
        propertyReviewCollectionView.register(propertyReviewCellNib, forCellWithReuseIdentifier: PropertyReviewCollectionViewCell.identifier)
    }
    
    func getMaxHeight() -> CGFloat {
        collectionCellsHeights = [CGFloat]()
        guard let reviews = reviews else {return .zero}
        var maxHeight: CGFloat = 0
        for review in reviews {
            let availableWidth = availableWidth
            print(availableWidth)
            let frame = CGRect(x: 0, y: 0, width: availableWidth, height: 200)
            
            guard let dummyCell = UINib(nibName: PropertyReviewCollectionViewCell.identifier, bundle: nil).instantiate(withOwner: nil).first as? PropertyReviewCollectionViewCell
            else {return .zero}
            dummyCell.frame = frame
            dummyCell.review = review
            dummyCell.setupCell()
            dummyCell.layoutIfNeeded()
            
            let targetSize = CGSize(width: availableWidth, height: 1000)
            let estimatedSize = dummyCell.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
            
            self.collectionCellsHeights.append(estimatedSize.height)
            if maxHeight < estimatedSize.height {
                maxHeight = estimatedSize.height
            }
        }
        
        return maxHeight
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
        reviewCell.cellHeight = collectionCellsHeights[indexPath.row]
        reviewCell.setupCell()
        
        return reviewCell
    }
}
