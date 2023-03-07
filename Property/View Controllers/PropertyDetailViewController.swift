//
//  PropertyDetailViewController.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit

enum PropertyDetailViewSection: Int {
    case property
    case reviews
    case amenities
    case interiorDetails
    case constructionDetails
    case locationMapAndDetails
    
    init(_ section: Int) {
        switch section {
        case 0:
            self = .property
        case 1:
            self = .reviews
        case 2:
            self = .amenities
        case 3:
            self = .interiorDetails
        case 4:
            self = .constructionDetails
        case 5:
            self = .locationMapAndDetails
        default:
            self = .property
        }
    }
}

class PropertyDetailViewController: BaseViewController {
    
    static let identifier = "PropertyDetailViewController"
    
    @IBOutlet weak var propertyDetailTableView: UITableView!
    @IBOutlet weak var propertySaveButton: DefaultButton!
    
    var toggleHeader: [PropertyDetailViewSection : Bool] = [
        .amenities: false,
        .interiorDetails: false,
        .constructionDetails: false
    ]
    
    var property: Property?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupRightBarButton()
        setupTableView()
        setupPropertySaveButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        propertyDetailTableView.backgroundColor = .clear
        navigationController?.isNavigationBarHidden = false
    }
    
    func setupPropertySaveButton() {
        propertySaveButton.setTitle("Save", for: .normal)
        propertySaveButton.configureTitleLabel(isBold: true)
    }
    
    func setupTableView() {
        propertyDetailTableView.delegate = self
        propertyDetailTableView.dataSource = self
        propertyDetailTableView.separatorStyle = .none
        
        let propertyCellNib = UINib(nibName: PropertyTableViewCell.identifier, bundle: nil)
        propertyDetailTableView.register(propertyCellNib, forCellReuseIdentifier: PropertyTableViewCell.identifier)
        
        let propertyReviewCellNib = UINib(nibName: PropertyReviewTableViewCell.identifier, bundle: nil)
        propertyDetailTableView.register(propertyReviewCellNib, forCellReuseIdentifier: PropertyReviewTableViewCell.identifier)
        
        let detailSectionHeaderCellNib = UINib(nibName: DetailSectionHeaderTableViewCell.identifier, bundle: nil)
        propertyDetailTableView.register(detailSectionHeaderCellNib, forCellReuseIdentifier: DetailSectionHeaderTableViewCell.identifier)
        
        let propertyLocationCellNib = UINib(nibName: PropertyLocationsTableViewCell.identifier, bundle: nil)
        propertyDetailTableView.register(propertyLocationCellNib, forCellReuseIdentifier: PropertyLocationsTableViewCell.identifier)
    }
    
    func setupRightBarButton() {
        let rightButtonImage = UIImage(systemName: "bookmark.fill")
        let rightButtonImageView = UIImageView(image: rightButtonImage)
        rightButtonImageView.tintColor = MainColor.purple
        rightButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let rightNavbarButton = DefaultButton(type: .system)
        rightNavbarButton.backgroundColor = MainColor.purple.withAlphaComponent(0.3)
        rightNavbarButton.addSubview(rightButtonImageView)
        rightNavbarButton.addTarget(self, action: #selector(onRightBarButtonSelected), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rightButtonImageView.topAnchor.constraint(equalTo: rightNavbarButton.topAnchor, constant: 8),
            rightButtonImageView.leftAnchor.constraint(equalTo: rightNavbarButton.leftAnchor, constant: 8),
            rightButtonImageView.rightAnchor.constraint(equalTo: rightNavbarButton.rightAnchor, constant: -8),
            rightButtonImageView.bottomAnchor.constraint(equalTo: rightNavbarButton.bottomAnchor, constant: -8),
            rightButtonImageView.heightAnchor.constraint(equalToConstant: 18),
            rightButtonImageView.widthAnchor.constraint(equalToConstant: 18)
        ])
        
        let rightBarButton = UIBarButtonItem(customView: rightNavbarButton)
        navigationItem.setRightBarButton(rightBarButton, animated: true)
    }
    
    @objc func onRightBarButtonSelected(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let termOfServiceVC = storyboard.instantiateViewController(withIdentifier: TermOfServiceViewController.identifier) as? TermOfServiceViewController {
            
            navigationController?.navigationBar.topItem?.backButtonTitle = "Terms of Service"
            navigationController?.pushViewController(termOfServiceVC, animated: true)
        }
    }
}


// MARK: Property Detail Table View Delegate and Data Source
extension PropertyDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let property = property else { return 0 }
        switch PropertyDetailViewSection(section) {
        case .property, .reviews, .locationMapAndDetails:
            return 1
        case .amenities:
            guard let toggle = toggleHeader[.amenities] else {return 0}
            return toggle ? property.facilitiesCount + 1 : 1
            
        case .interiorDetails:
            guard let toggle = toggleHeader[.interiorDetails] else {return 0}
            return toggle ? property.interiorDetailImages.count + 1 : 1
            
        case .constructionDetails:
            guard let toggle = toggleHeader[.constructionDetails] else {return 0}
            return toggle ? property.constructionDetailImages.count + 1 : 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let property = property else { return UITableViewCell() }
        switch PropertyDetailViewSection(indexPath.section) {
        case .property:
            guard let propertyCell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.identifier, for: indexPath) as? PropertyTableViewCell
            else { return UITableViewCell() }
            
            propertyCell.backgroundColor = .clear
            propertyCell.property = property
            
            let propertyHeader = self.propertyHeader()
            propertyCell.setupCell(showHeader: true, headerView: propertyHeader)
            
            return propertyCell
            
            
        case .reviews:
            guard let propertyReviewCell = tableView.dequeueReusableCell(withIdentifier: PropertyReviewTableViewCell.identifier, for: indexPath) as? PropertyReviewTableViewCell
            else { return UITableViewCell() }
            
            propertyReviewCell.backgroundColor = .clear
            propertyReviewCell.reviews = property.review
            propertyReviewCell.setupCollectionView()
            
            return propertyReviewCell
            
            
        case .amenities:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailSectionHeaderTableViewCell.identifier, for: indexPath) as? DetailSectionHeaderTableViewCell
                else { return UITableViewCell() }
                
                cell.headerType = .amenities
                cell.delegate = self
                cell.setupHeaderView(isOpen: toggleHeader[.amenities, default: false])
                
                return cell
            }
            
            return UITableViewCell()
            
            
        case .interiorDetails:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailSectionHeaderTableViewCell.identifier, for: indexPath) as? DetailSectionHeaderTableViewCell
                else { return UITableViewCell() }
                
                cell.headerType = .interiorDetails
                cell.delegate = self
                cell.setupHeaderView(isOpen: toggleHeader[.interiorDetails, default: false])
                
                return cell
            }
            
            return UITableViewCell()
            
            
        case .constructionDetails:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailSectionHeaderTableViewCell.identifier, for: indexPath) as? DetailSectionHeaderTableViewCell
                else { return UITableViewCell() }
                
                cell.headerType = .constructionDetails
                cell.delegate = self
                cell.setupHeaderView(isOpen: toggleHeader[.constructionDetails, default: false])
                
                return cell
            }
            
            return UITableViewCell()
            
            
        case .locationMapAndDetails:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyLocationsTableViewCell.identifier, for: indexPath) as? PropertyLocationsTableViewCell
            else { return UITableViewCell() }
            
            cell.backgroundColor = .clear
            cell.locations = property.locations
            cell.setupCell()
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension PropertyDetailViewController {
    func propertyHeader() -> UIView {
        let headerTitleLabel = SectionHeader()
        headerTitleLabel.configure(title: "Property Details")
        
        return headerTitleLabel
    }
}

extension PropertyDetailViewController: DetailSectionHeaderDelegate {
    func onToggleButtonSelected(of headerType: PropertyDetailViewSection) {
        guard let toggle = toggleHeader[headerType] else {return}
        let toggleIndexPaths = getIndexPathsOfSection(of: headerType)
        toggleHeader[headerType] = !toggle
        let headerIndex = [IndexPath(row: 0, section: headerType.rawValue)]
        if toggle {
            propertyDetailTableView.deleteRows(at: toggleIndexPaths, with: .fade)
        } else {
            propertyDetailTableView.insertRows(at: toggleIndexPaths, with: .fade)
        }
        propertyDetailTableView.reloadRows(at: headerIndex, with: .automatic)

        
    }
    
    private func getIndexPathsOfSection(of headerType: PropertyDetailViewSection) -> [IndexPath] {
        var indexPaths = [IndexPath]()
        var count = 0
        
        switch headerType {
        case .amenities:
            count = property?.facilitiesCount ?? 0
        case .interiorDetails:
            count = property?.interiorDetailImages.count ?? 0
        case .constructionDetails:
            count = property?.constructionDetailImages.count ?? 0
        default:
            count = 0
        }
        
        for index in 1...count {
            indexPaths.append(IndexPath(row: index, section: headerType.rawValue))
        }
        
        return indexPaths
    }
}
