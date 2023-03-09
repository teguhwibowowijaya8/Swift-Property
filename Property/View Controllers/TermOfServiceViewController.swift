//
//  TermOfServiceViewController.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit

class TermOfServiceViewController: BaseViewController {
    
    static let identifier = "TermOfServiceViewController"
    
    @IBOutlet weak var termOfServiceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupTableView()
    }
}

// MARK: Setup header and table view
extension TermOfServiceViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        termOfServiceTableView.backgroundColor = .clear
        setupLeftBarButtonItem()
        navigationController?.isNavigationBarHidden = false
    }

    private func setupLeftBarButtonItem() {
        let leftBarButtonView = CustomBackButtonView(type: .system)
        leftBarButtonView.title = "Term of Service"
        leftBarButtonView.onButtonSelected = onLeftBarButtonSelected
        let leftBarButtonButton = UIBarButtonItem(customView: leftBarButtonView)
        
        navigationItem.setLeftBarButton(leftBarButtonButton, animated: true)
    }
    
    private func onLeftBarButtonSelected() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupTableView() {
        termOfServiceTableView.delegate = self
        termOfServiceTableView.dataSource = self
        termOfServiceTableView.separatorStyle = .none
        
        termOfServiceTableView.register(TermPointTableViewCell.self, forCellReuseIdentifier: TermPointTableViewCell.identifier)
    }
}

extension TermOfServiceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TermOfServices.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let termsPointCell = tableView.dequeueReusableCell(withIdentifier: TermPointTableViewCell.identifier) as? TermPointTableViewCell
        else {return UITableViewCell()}
        
        let termOfService = TermOfServices.data[indexPath.row]
        termsPointCell.configureText(point: termOfService.point, detail: termOfService.detail)
        termsPointCell.setupCell()
        
        return termsPointCell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
