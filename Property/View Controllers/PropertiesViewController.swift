//
//  ViewController.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit

class PropertiesViewController: BaseViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var filterButton: DefaultButton!
    @IBOutlet weak var propertiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupSearchTextField()
        setupFilterButton()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        propertiesTableView.backgroundColor = .clear
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupTableView() {
        propertiesTableView.delegate = self
        propertiesTableView.dataSource = self
        propertiesTableView.backgroundColor = .clear
        propertiesTableView.separatorStyle = .none
        
        let propertyNib = UINib(nibName: PropertyTableViewCell.identifier, bundle: nil)
        propertiesTableView.register(propertyNib, forCellReuseIdentifier: PropertyTableViewCell.identifier)
    }
    
    private func setupSearchTextField() {
        searchTextField.placeholder = "Search..."
        searchTextField.layer.cornerRadius = 12
        searchTextField.clipsToBounds = true
        searchTextField.layer.borderColor = UIColor.white.cgColor
        searchTextField.layer.borderWidth = 1
        searchTextField.leftView = searchLeftComponent()
        searchTextField.leftViewMode = .always
    }
    
    private func searchLeftComponent() -> UIView {
        let containerLeftImages = UIView()
        
        let searchImage = UIImage(systemName: "magnifyingglass")
        let searchImageView = UIImageView(image: searchImage)
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        searchImageView.tintColor = MainColor.purple
        
        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = MainColor.purple
        
        containerLeftImages.addSubview(searchImageView)
        containerLeftImages.addSubview(separatorView)
        NSLayoutConstraint.activate([
            searchImageView.topAnchor.constraint(equalTo: containerLeftImages.topAnchor, constant: 8),
            searchImageView.leftAnchor.constraint(equalTo: containerLeftImages.leftAnchor, constant: 12),
            searchImageView.rightAnchor.constraint(equalTo: separatorView.leftAnchor, constant: -15),
            searchImageView.bottomAnchor.constraint(equalTo: containerLeftImages.bottomAnchor, constant: -8),
            
            
            separatorView.topAnchor.constraint(equalTo: containerLeftImages.topAnchor, constant: 5),
            separatorView.rightAnchor.constraint(equalTo: containerLeftImages.rightAnchor, constant: -10),
            separatorView.bottomAnchor.constraint(equalTo: containerLeftImages.bottomAnchor, constant: -5),
            separatorView.widthAnchor.constraint(equalToConstant: 1)
        ])
        
        return containerLeftImages
    }
    
    private func setupFilterButton() {
        filterButton.setTitle("Filters", for: .normal)
        filterButton.configureTitleLabel()
        
        filterButton.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle.fill"), for: .normal)
        filterButton.imageView?.contentMode = .scaleAspectFit
    }
}

// MARK: Properties Table View Delegate and Data Source
extension PropertiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Properties.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let propertyTableCell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.identifier, for: indexPath) as? PropertyTableViewCell
        else { return UITableViewCell() }
        
        propertyTableCell.backgroundColor = .clear
        propertyTableCell.property = Properties.data[indexPath.row]
        propertyTableCell.delegate = self
        
        if indexPath.row == 0 {
            let sectionHeader = self.sectionHeader()
            propertyTableCell.setupCell(showHeader: true, headerView: sectionHeader)
        } else {
            propertyTableCell.setupCell()
        }
        
        
        return propertyTableCell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}


// MARK: Properties Table View Header
extension PropertiesViewController {
    
    private func sectionHeader() -> UIView {
        let headerSeeAllButton = UIButton(type: .system)
        headerSeeAllButton.translatesAutoresizingMaskIntoConstraints = false
        headerSeeAllButton.setTitle("See All >", for: .normal)
        headerSeeAllButton.setTitleColor(.green.withAlphaComponent(0.7), for: .normal)
        headerSeeAllButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        
        let headerView = SectionHeader()
        headerView.configure(title: "Matched Property", rightComponent: headerSeeAllButton)
        
        return headerView
    }
}

// MARK: Property Table View Delegate for on property card selected
extension PropertiesViewController: PropertyTableViewDelegate {
    func onPropertySelected(property: Property) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let propertyDetailVC = storyboard.instantiateViewController(withIdentifier: PropertyDetailViewController.identifier) as? PropertyDetailViewController {
            
            propertyDetailVC.property = property
            navigationController?.pushViewController(propertyDetailVC, animated: true)
        }
    }
}
