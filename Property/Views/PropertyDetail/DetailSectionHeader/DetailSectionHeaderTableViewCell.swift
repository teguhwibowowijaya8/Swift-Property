//
//  DetailSectionHeaderTableViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 07/03/23.
//

import UIKit

class DetailSectionHeaderTableViewCell: UITableViewCell {
    static let identifier = "DetailSectionHeaderTableViewCell"
    
    @IBOutlet weak var sectionHeaderView: SectionHeader!
    @IBOutlet weak var sectionHeaderButton: UIButton! {
        didSet {
            sectionHeaderButton.addTarget(self, action: #selector(onToggleSelected), for: .touchUpInside)
        }
    }
    
    var headerType: PropertyDetailViewSection?
    var delegate: DetailSectionHeaderDelegate?
    
    private lazy var toggleImageView: UIImageView = {
        let toggleImageView = UIImageView()
        toggleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toggleImageView.widthAnchor.constraint(equalToConstant: 20),
            toggleImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        toggleImageView.tintColor = .black
        return toggleImageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupHeaderView(isOpen: Bool) {
        self.backgroundColor = .clear
        guard let headerType = headerType else { return }
        let toggleImage = isOpen ? "chevron.down" : "chevron.up"
        toggleImageView.image = UIImage(systemName: toggleImage)
        
        switch headerType {
        case .amenities:
            sectionHeaderView.configure(title: "Amenities", rightComponent: toggleImageView)
        case .interiorDetails:
            sectionHeaderView.configure(title: "Interior Details", rightComponent: toggleImageView)
        case .constructionDetails:
            sectionHeaderView.configure(title: "Construction Details", rightComponent: toggleImageView)
        default:
            return
        }
    }
    
    @objc func onToggleSelected(_ sender: UIButton) {
        guard let headerType = headerType else {return}
        delegate?.onToggleButtonSelected(of: headerType)
    }
    
    func setupOnlyHeader(title: String) {
        self.backgroundColor = .clear
        sectionHeaderView.configure(title: title)
    }
    
}
