//
//  ViewController.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit

class PropertiesViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var propertiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = MainColor.background
        setupSearchTextField()
        setupFilterButton()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        super.viewWillAppear(animated)
    }
    
    private func setupTableView() {
        propertiesTableView.delegate = self
        propertiesTableView.dataSource = self
        propertiesTableView.backgroundColor = .clear
        
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
        containerLeftImages.translatesAutoresizingMaskIntoConstraints = false
        
        let searchImage = UIImage(systemName: "magnifyingglass")
        let searchImageView = UIImageView(image: searchImage)
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        searchImageView.tintColor = MainColor.purple
        
        containerLeftImages.addSubview(searchImageView)
        NSLayoutConstraint.activate([
            searchImageView.topAnchor.constraint(equalTo: containerLeftImages.topAnchor, constant: 8),
            searchImageView.leftAnchor.constraint(equalTo: containerLeftImages.leftAnchor, constant: 12),
            searchImageView.rightAnchor.constraint(equalTo: containerLeftImages.rightAnchor),
            searchImageView.bottomAnchor.constraint(equalTo: containerLeftImages.bottomAnchor, constant: -8)
            
        ])
        
        return containerLeftImages
    }
    
    private func setupFilterButton() {
        filterButton.backgroundColor = MainColor.purple
        filterButton.tintColor = .white
        filterButton.layer.cornerRadius = 12
        
        filterButton.setTitle("Filters", for: .normal)
        filterButton.titleLabel?.adjustsFontSizeToFitWidth = true
        filterButton.titleLabel?.minimumScaleFactor = 0.5
        filterButton.titleLabel?.lineBreakMode = .byTruncatingTail
        filterButton.titleLabel?.numberOfLines = 1
        
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
        propertyTableCell.setupCell(property: Properties.data[indexPath.row])
        
        return propertyTableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let propertyDetailVC = storyboard.instantiateViewController(withIdentifier: PropertyDetailViewController.identifier) as? PropertyDetailViewController {
            
            propertyDetailVC.property = Properties.data[indexPath.row]
            navigationController?.navigationBar.topItem?.backButtonTitle = "Property Details"
            navigationController?.navigationBar.tintColor = .black
            navigationController?.pushViewController(propertyDetailVC, animated: true)
        }
        
    }
}


// MARK: Properties Table View Header
extension PropertiesViewController {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionHeader()
    }
    
    private func sectionHeader() -> UITableViewHeaderFooterView {
        let headerView = UITableViewHeaderFooterView()
        
        let headerTitleLabel = UILabel()
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerTitleLabel.text = "Matched Property"
        headerTitleLabel.font = TextSize.title
        
        let headerSeeAllButton = UIButton(type: .system)
        headerSeeAllButton.translatesAutoresizingMaskIntoConstraints = false
        headerSeeAllButton.setTitle("See All >", for: .normal)
        headerSeeAllButton.setTitleColor(.green.withAlphaComponent(0.7), for: .normal)
        headerSeeAllButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        
        headerView.addSubview(headerTitleLabel)
        headerView.addSubview(headerSeeAllButton)
        
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            headerTitleLabel.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20),
            headerTitleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8),
            headerTitleLabel.rightAnchor.constraint(equalTo: headerSeeAllButton.leftAnchor, constant: 8),
            
            headerSeeAllButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            headerSeeAllButton.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -20),
            headerSeeAllButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8),
        ])
        
        return headerView
    }
}

