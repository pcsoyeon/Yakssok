//
//  MainVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/13.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - UI
    
    // MARK: - Properties

    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

