//
//  PropertyLocationsTableViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 07/03/23.
//

import UIKit

class PropertyLocationsTableViewCell: UITableViewCell {
    static let identifier = "PropertyLocationsTableViewCell"
    
    @IBOutlet weak var locationsCollectionView: UICollectionView!
    @IBOutlet weak var locationImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
