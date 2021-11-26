//
//  StoreGuideVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/26.
//

import UIKit

class StoreGuideVC: UIViewController {

    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension StoreGuideVC {
    private func initUI() {
        
    }
}
