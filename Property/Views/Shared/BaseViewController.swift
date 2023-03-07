//
//  BaseViewController.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 07/03/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = MainColor.background
        navigationController?.view.backgroundColor = MainColor.background
    }
}
