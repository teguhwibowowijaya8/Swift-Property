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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        termOfServiceTableView.backgroundColor = .clear
        navigationController?.isNavigationBarHidden = false
    }
}
