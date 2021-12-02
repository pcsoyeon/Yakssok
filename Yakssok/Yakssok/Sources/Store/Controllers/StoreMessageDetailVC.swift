//
//  StoreMessageDetailVC.swift
//  Yakssok
//
//  Created by soyeon on 2021/12/02.
//

import UIKit

class StoreMessageDetailVC: UIViewController {

    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpConfirmButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
